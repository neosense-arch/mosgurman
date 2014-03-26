<?php
/**
 * Created by Yury Smidovich (Stmol)
 * Date: 23.03.14
 * Project: mosgurman
 * Url: http://stmol.me
 * Email: dev@stmol.me
 */

namespace Mosgurman\FrontBundle\Service;

use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityRepository;
use Mosgurman\FrontBundle\Entity\CartOrder;
use Mosgurman\FrontBundle\Entity\Customer;
use NS\CatalogBundle\Entity\Item;

/**
 * Class CartOrderManager
 * @package Mosgurman\FrontBundle\Service
 * @author Yury Smidovich <dev@stmol.me>
 */
class CartOrderManager
{
    /**
     * @var EntityManager
     */
    private $entityManager;

    /**
     * @var EntityRepository
     */
    private $repository;

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
     * @param Item $item
     * @return CartOrder
     */
    public function createCartOrder(Item $item = null)
    {
        $cartOrder = new CartOrder();

        if ($item) {
            $cartOrder->setItem($item);
        }

        return $cartOrder;
    }

    /**
     * @param $cartOrder
     * @param bool $flush
     */
    public function saveCartOrder(CartOrder $cartOrder, $flush = true)
    {
        $this->entityManager->persist($cartOrder);

        if ($flush) {
            $this->entityManager->flush();
        }
    }

    /**
     * @param CartOrder $cartOrder
     * @param bool $flush
     */
    public function deleteCartOrder(CartOrder $cartOrder, $flush = true)
    {
        $this->entityManager->remove($cartOrder);

        if ($flush) {
            $this->entityManager->flush();
        }
    }

    /**
     * @param Customer $customer
     * @return array
     */
    public function findCartOrdersByCustomer(Customer $customer)
    {
        return $this->repository
            ->createQueryBuilder('co')
            ->where('co.customer = :customer')
            ->setParameter('customer', $customer)
            ->getQuery()
            ->getResult();
    }

    /**
     * @param $id
     * @return null|object
     */
    public function findCartOrderById($id)
    {
        return $this->repository->find($id);
    }
}
