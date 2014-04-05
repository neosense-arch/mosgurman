<?php
/**
 * Created by Yury Smidovich (Stmol)
 * Date: 04.04.14
 * Project: mosgurman
 * Url: http://stmol.me
 * Email: dev@stmol.me
 */

namespace Mosgurman\FrontBundle\Controller;


use Mosgurman\FrontBundle\Entity\Checkout;
use Mosgurman\FrontBundle\Entity\CheckoutMailReport;
use Mosgurman\FrontBundle\Form\CheckoutMailReportType;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

/**
 * Class AdminCheckoutController
 * @package Mosgurman\FrontBundle\Controller
 * @author Yury Smidovich <dev@stmol.me>
 */
class AdminCheckoutController extends Controller
{
    /**
     * @param Request $request
     * @return \Symfony\Component\HttpFoundation\RedirectResponse|\Symfony\Component\HttpFoundation\Response
     */
    public function mailsAction(Request $request)
    {
        $form = $this->createFormBuilder()
            ->add('emails', 'text', array(
                'required' => true,
                'label'    => 'Адреса email через запятую',
                'data'     => $this->getMailsFromFile(),
            ))
            ->add('save', 'submit', array('label' => 'Сохранить'))
            ->getForm();

        $form->handleRequest($request);

        if ($form->isValid()) {
            $emails = $form->get('emails')->getNormData();
            @file_put_contents($this->getMailsFilePath(), $emails);

            return $this->redirect($this->generateUrl('ns_admin_bundle', array(
                'adminBundle'     => 'MGFrontBundle',
                'adminController' => 'checkout',
                'adminAction'     => 'mails',
            )));
        }

        return $this->render('MGFrontBundle:AdminCheckout:mails.html.twig', array(
            'form' => $form->createView(),
        ));
    }

    /**
     * @param Request $request
     * @return Response
     */
    public function listAction(Request $request)
    {
        $limitPerPage = 25;

        $page = $request->query->get('page', 1);
        $offset = ($page - 1) * $limitPerPage;

        $checkouts = $this->get('mg_front.manager.checkout')
            ->findAllCheckoutsLimited($limitPerPage, $offset);

        $checkoutsCount = $this->get('mg_front.manager.checkout')
            ->getCheckoutsCount();

        return $this->render('MGFrontBundle:AdminCheckout:list.html.twig', array(
            'checkouts'   => $checkouts,
            'items_count' => $checkoutsCount,
            'page'        => $page,
        ));
    }

    public function detailsAction(Request $request)
    {
        $chekoutId = $request->query->get('id');

        $chekout = $this->get('mg_front.manager.checkout')
            ->findCheckoutById($chekoutId);

        return $this->render('MGFrontBundle:AdminCheckout:details.html.twig', array(
            'checkout' => $chekout,
        ));
    }

    /**
     * @param Request $request
     * @return Response
     */
    public function statusAction(Request $request)
    {
        if (!$this->getUser()) {
            return new Response(null, 403);
        }

        try
        {
            $checkoutId = $request->request->get('id');

            $checkout = $this->get('mg_front.manager.checkout')
                ->findCheckoutById($checkoutId);

            if (!$checkout instanceof Checkout) {
                return new Response(null, 400);
            }

            $checkout->setIsDelivered(!$checkout->getIsDelivered());
            $this->get('mg_front.manager.checkout')->saveCheckout($checkout);

            return new Response(null, 200);
        } catch (\Exception $e) {
            return new Response(null, 500);
        }
    }

    /**
     * @return string
     */
    private function getMailsFromFile()
    {
        return @file_get_contents($this->getMailsFilePath());
    }

    /**
     * @return string
     */
    private function getMailsFilePath()
    {
        return $this->container->getParameter('report_mails_path');
    }
}
