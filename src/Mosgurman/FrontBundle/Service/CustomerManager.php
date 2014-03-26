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
use Mosgurman\FrontBundle\Entity\Customer;

/**
 * Class CustomerManager
 * @package Mosgurman\FrontBundle\Service
 * @author Yury Smidovich <dev@stmol.me>
 */
class CustomerManager
{
    /**
     * @var \Doctrine\ORM\EntityManager
     */
    private $entityManager;

    /**
     * @var \Doctrine\ORM\EntityRepository
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
     * @param string $uniqueId
     * @return Customer
     */
    public function createCustomer($uniqueId)
    {
        $customer = new Customer();
        $customer->setUniqueId($uniqueId);

        return $customer;
    }

    /**
     * @param Customer $customer
     * @param bool $flush
     */
    public function saveCustomer(Customer $customer, $flush = true)
    {
        $this->entityManager->persist($customer);

        if ($flush) {
            $this->entityManager->flush();
        }
    }

    /**
     * @param $uniqueId
     * @return Customer|null
     */
    public function findCustomerByUniqueId($uniqueId)
    {
        return $this->repository
            ->createQueryBuilder('c')
            ->where('c.uniqueId = :uniqueId')
            ->setParameter('uniqueId', $uniqueId)
            ->getQuery()
            ->getOneOrNullResult();
    }
}
