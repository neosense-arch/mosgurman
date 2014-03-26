<?php
/**
 * Created by Yury Smidovich (Stmol)
 * Date: 23.03.14
 * Project: mosgurman
 * Url: http://stmol.me
 * Email: dev@stmol.me
 */

namespace Mosgurman\FrontBundle\Controller;

use Mosgurman\FrontBundle\Entity\CartOrder;
use Mosgurman\FrontBundle\Entity\Customer;
use Mosgurman\FrontBundle\Form\CartOrderType;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

/**
 * Class CartController
 * @package Mosgurman\FrontBundle\Controller
 * @author Yury Smidovich <dev@stmol.me>
 */
class CartController extends Controller
{
    const CART_PRODUCTS_LIMIT = 50;

    /**
     * Add product to cart
     *
     * @param Request $request
     * @return JsonResponse
     */
    public function addProductAction(Request $request)
    {
        if (!$request->getSession()->has('customer_id')) {
            return new JsonResponse(null, 400);
        }

        $requestData = @json_decode($request->getContent(), true);

        $customerId = $request->getSession()->get('customer_id');
        $customer = $this->getCustomerManager()->findCustomerByUniqueId($customerId);

        if (!$customer instanceof Customer) {
            $customer = $this->getCustomerManager()->createCustomer($customerId);
            $this->getCustomerManager()->saveCustomer($customer);
        }

        $cartOrders = $this->getCartOrderManager()->findCartOrdersByCustomer($customer);

        if (count($cartOrders) > self::CART_PRODUCTS_LIMIT) {
            return new JsonResponse(null, 400);
        }

        $cartOrder = $this->getCartOrderManager()->createCartOrder();
        $cartOrder->setCustomer($customer);

        $form = $this->createCartOrderForm($cartOrder);
        $form->submit($requestData);

        if ($form->isValid()) {
            $this->getCartOrderManager()->saveCartOrder($cartOrder);

            return new JsonResponse(null, 204);
        }

        return new JsonResponse(array(), 400);
    }

    /**
     * Delete product from cart
     *
     * @param Request $request
     * @param $id
     * @return JsonResponse
     */
    public function deleteProductAction(Request $request, $id)
    {
        if (!$request->getSession()->has('customer_id')) {
            return new JsonResponse(null, 400);
        }

        $customerId = $request->getSession()->get('customer_id');
        $customer = $this->getCustomerManager()->findCustomerByUniqueId($customerId);

        if (!$customer instanceof Customer) {
            return new JsonResponse(null, 400);
        }

        $cartOrder = $this->getCartOrderManager()->findCartOrderById($id);

        // 404
        if (!$cartOrder instanceof CartOrder) {
            return new JsonResponse(null, 404);
        }

        // 403
        if ($cartOrder->getCustomer() !== $customer) {
            return new JsonResponse(null, 403);
        }

        $this->getCartOrderManager()->deleteCartOrder($cartOrder);

        return new JsonResponse(null, 204);
    }

    /**
     * Get count of orders in cart
     *
     * @param Request $request
     * @return JsonResponse
     */
    public function productCountAction(Request $request)
    {
        $productCount = 0;

        if ($request->getSession()->has('customer_id')) {
            $customerId = $request->getSession()->get('customer_id');
            $customer = $this->getCustomerManager()->findCustomerByUniqueId($customerId);

            if ($customer) {
                $cartOrders = $this->getCartOrderManager()->findCartOrdersByCustomer($customer);
                $productCount = count($cartOrders);
            }
        }

        return $this->render('MGFrontBundle:Cart:productCount.html.twig', array(
            'product_count' => $productCount,
        ));
    }

    /**
     * @param $cartOrder
     * @return \Symfony\Component\Form\Form
     */
    private function createCartOrderForm($cartOrder)
    {
        $form = $this->createForm(new CartOrderType(), $cartOrder, array(
            'csrf_protection' => false,
        ));

        return $form;
    }

    /**
     * @return \Mosgurman\FrontBundle\Service\CartOrderManager
     */
    private function getCartOrderManager()
    {
        return $this->get('mg_front.manager.cart_order');
    }

    /**
     * @return \Mosgurman\FrontBundle\Service\CustomerManager
     */
    private function getCustomerManager()
    {
        return $this->get('mg_front.manager.customer');
    }
}