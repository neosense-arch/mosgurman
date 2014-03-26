<?php
/**
 * Created by Yury Smidovich (Stmol)
 * Date: 11.03.14
 * Project: mosgurman
 * Url: http://stmol.me
 * Email: dev@stmol.me
 */

namespace Mosgurman\FrontBundle\Controller;

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
}
