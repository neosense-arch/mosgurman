<?php
/**
 * Created by Yury Smidovich (Stmol)
 * Date: 02.04.14
 * Project: mosgurman
 * Url: http://stmol.me
 * Email: dev@stmol.me
 */

namespace Mosgurman\FrontBundle\Service;


use Doctrine\ORM\EntityManager;
use Mosgurman\FrontBundle\Entity\Checkout;
use Mosgurman\FrontBundle\Entity\Customer;

/**
 * Class CheckoutManager
 * @package Mosgurman\FrontBundle\Service
 * @author Yury Smidovich <dev@stmol.me>
 */
class CheckoutManager
{
    /**
     * @var \Doctrine\ORM\EntityManager
     */
    protected $entityManager;

    /**
     * @var \Doctrine\ORM\EntityRepository
     */
    protected $repository;

    /**
     * @param EntityManager $entityManager
     * @param $className
     */
    public function __construct(EntityManager $entityManager, $className)
    {
        $this->entityManager = $entityManager;
        $this->repository = $entityManager->getRepository($className);
    }

    /**
     * @param Customer $customer
     * @return Checkout
     */
    public function createCheckout(Customer $customer = null)
    {
        $checkout = new Checkout();

        if ($customer) {
            $checkout->setCustomer($customer);
        }

        return $checkout;
    }

    /**
     * @param Checkout $checkout
     * @param bool $flush
     */
    public function saveCheckout(Checkout $checkout, $flush = true)
    {
        $this->entityManager->persist($checkout);

        if ($flush) {
            $this->entityManager->flush();
        }
    }
}
