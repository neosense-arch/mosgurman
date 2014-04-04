<?php
/**
 * Created by Yury Smidovich (Stmol)
 * Date: 11.03.14
 * Project: mosgurman
 * Url: http://stmol.me
 * Email: dev@stmol.me
 */

namespace Mosgurman\FrontBundle\Controller;

use Mosgurman\FrontBundle\Entity\Checkout;
use Mosgurman\FrontBundle\Entity\Customer;
use Mosgurman\FrontBundle\Form\CheckoutType;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

/**
 * Class BlocksController
 * @package Mosgurman\FrontBundle\Controller
 * @author Yury Smidovich <dev@stmol.me>
 */
class BlocksController extends Controller
{
    /**
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function sliderBlockAction()
    {
        return $this->render('MGFrontBundle:Blocks:sliderBlock.html.twig');
    }

    /**
     * @param \Symfony\Component\HttpFoundation\Request $request
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function cartBlockAction(Request $request)
    {
        if (!$request->getSession()->has('customer_id')) {
            return $this->render('MGFrontBundle:Blocks:cartBlock.html.twig');
        }

        $customerId = $request->getSession()->get('customer_id');
        $customer = $this->get('mg_front.manager.customer')->findCustomerByUniqueId($customerId);

        if (!$customer) {
            return $this->render('MGFrontBundle:Blocks:cartBlock.html.twig');
        }

        $cartOrders = $this->get('mg_front.manager.cart_order')->findCartOrdersByCustomer($customer);

        return $this->render('MGFrontBundle:Blocks:cartBlock.html.twig', array(
            'cart_orders' => $cartOrders,
        ));
    }

    /**
     * @param Request $request
     * @return \Symfony\Component\HttpFoundation\RedirectResponse|\Symfony\Component\HttpFoundation\Response
     */
    public function checkoutBlockAction(Request $request)
    {
        if (!$request->getSession()->has('customer_id')) {
            return $this->redirect($this->generateUrl('ns_cms_main'));
        }

        $customer = $this->get('mg_front.manager.customer')
            ->findCustomerByUniqueId($request->getSession()->get('customer_id'));

        if (!$customer instanceof Customer) {
            return $this->redirect($this->generateUrl('ns_cms_main'));
        }

        $checkout = $this->getCheckoutManager()->createCheckout($customer);

        $form = $this->createCheckoutForm($checkout);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $this->getCheckoutManager()->saveCheckout($checkout);
            $this->get('session')->getFlashBag()->add('success', '');

            $this->get('mg_front.service.mail_report')->sendReports(
                $this->renderView('MGFrontBundle:Emails:checkout.html.twig', array('checkout' => $checkout))
            );

            return $this->redirect($this->generateUrl('ns_cms_page_name', array('name' => 'checkout')));
        }

        // Remove customer
        if ($this->get('session')->getFlashBag()->has('success')) {
            $request->getSession()->remove('customer_id');
        }

        return $this->render('MGFrontBundle:Blocks:checkoutBlock.html.twig', array(
            'form' => $form->createView(),
        ));
    }

    /**
     * @param Checkout $checkout
     * @return \Symfony\Component\Form\Form
     */
    private function createCheckoutForm(Checkout $checkout)
    {
        $form = $this->createForm(new CheckoutType(), $checkout, array(
            'method' => 'POST',
        ));

        $form->add('save', 'submit', array('label' => 'Заказать'));

        return $form;
    }

    /**
     * @return \Mosgurman\FrontBundle\Service\CheckoutManager
     */
    private function getCheckoutManager()
    {
        return $this->get('mg_front.manager.checkout');
    }
}
