<?php

namespace Mosgurman\FrontBundle\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity as Unique;

/**
 * Customer
 *
 * @ORM\Table(name="mg_customers")
 * @ORM\Entity
 *
 * @Unique("uniqueId")
 */
class Customer
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="unique_id", type="string", length=255, unique=true)
     */
    private $uniqueId;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="created_at", type="datetime")
     */
    private $createdAt;

    /**
     * @var ArrayCollection
     *
     * @ORM\OneToMany(targetEntity="CartOrder", mappedBy="customer")
     */
    private $cartOrders;

    public function __construct()
    {
        $this->createdAt = new \DateTime();
        $this->cartOrders = new ArrayCollection();
    }

    /**
     * Get id
     *
     * @return integer 
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set uniqueId
     *
     * @param string $uniqueId
     * @return Customer
     */
    public function setUniqueId($uniqueId)
    {
        $this->uniqueId = $uniqueId;

        return $this;
    }

    /**
     * Get uniqueId
     *
     * @return string 
     */
    public function getUniqueId()
    {
        return $this->uniqueId;
    }

    /**
     * Set createdAt
     *
     * @param \DateTime $createdAt
     * @return Customer
     */
    public function setCreatedAt($createdAt)
    {
        $this->createdAt = $createdAt;

        return $this;
    }

    /**
     * Get createdAt
     *
     * @return \DateTime 
     */
    public function getCreatedAt()
    {
        return $this->createdAt;
    }

    /**
     * Add cartOrders
     *
     * @param CartOrder $cartOrder
     * @return Customer
     */
    public function addCartOrder(CartOrder $cartOrder)
    {
        $this->cartOrders[] = $cartOrder;

        return $this;
    }

    /**
     * Remove cartOrders
     *
     * @param CartOrder $cartOrder
     */
    public function removeCartOrder(CartOrder $cartOrder)
    {
        $this->cartOrders->removeElement($cartOrder);
    }

    /**
     * Get cartOrders
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getCartOrders()
    {
        return $this->cartOrders;
    }
}
