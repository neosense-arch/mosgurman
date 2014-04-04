<?php
/**
 * Created by Yury Smidovich (Stmol)
 * Date: 04.04.14
 * Project: mosgurman
 * Url: http://stmol.me
 * Email: dev@stmol.me
 */

namespace Mosgurman\FrontBundle\Controller;


use Mosgurman\FrontBundle\Entity\CheckoutMailReport;
use Mosgurman\FrontBundle\Form\CheckoutMailReportType;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

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
