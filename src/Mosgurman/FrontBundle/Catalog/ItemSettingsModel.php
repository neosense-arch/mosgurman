<?php
/**
 * Created by Yury Smidovich (Stmol)
 * Date: 10.03.14
 * Project: mosgurman
 * Url: http://stmol.me
 * Email: dev@stmol.me
 */

namespace Mosgurman\FrontBundle\Catalog;

use Doctrine\ORM;
use NS\CatalogBundle\Model\AbstractSettings;

/**
 * Class ItemSettingsModel
 * @package Mosgurman\FrontBundle\Catalog
 * @author Yury Smidovich <dev@stmol.me>
 */
class ItemSettingsModel extends AbstractSettings
{
    const
        GROUP_ALL    = 'all',
        GROUP_HOT    = 'hot',
        GROUP_NOMEAT = 'nomeat',
        GROUP_SWEET  = 'sweet',
        GROUP_SEASON = 'season'
    ;

    /**
     * @var string
     */
    protected $brief;

    /**
     * @var float
     */
    protected $price;

    /**
     * @var string[]
     */
    protected $photos = array();

    /**
     * @var
     */
    protected $photo;

    /**
     * @var array
     */
    private $prices = array();

    /**
     * @var string
     */
    protected $pricesString = '';

    /**
     * @var string
     */
    protected $group;

    /**
     * @var bool
     */
    protected $isNew;

    /**
     * @var bool
     */
    protected $isSale;

    public function __construct()
    {
        $this
            ->setIsNew(false)
            ->setIsSale(false)
            ->setGroup(self::GROUP_ALL)
        ;
    }

    /**
     * @param mixed $group
     * @throws \InvalidArgumentException
     * @return $this
     */
    public function setGroup($group)
    {
        if (!in_array($group, $this->getGroups())) {
            throw new \InvalidArgumentException();
        }

        $this->group = $group;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getGroup()
    {
        return $this->group;
    }

    /**
     * @param mixed $isNew
     * @return $this
     */
    public function setIsNew($isNew)
    {
        $this->isNew = (bool)$isNew;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getIsNew()
    {
        return $this->isNew;
    }

    /**
     * @param mixed $isSale
     * @return $this
     */
    public function setIsSale($isSale)
    {
        $this->isSale = (bool)$isSale;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getIsSale()
    {
        return $this->isSale;
    }

    /**
     * @param array $prices
     */
    public function setPrices($prices)
    {
        $this->prices = $prices;
    }

    /**
     * @return array
     */
    public function getPrices()
    {
        return $this->prices;
    }

    /**
     * @param string $pricesString
     */
    public function setPricesString($pricesString)
    {
        $this->pricesString = $this->setPrices(json_decode($pricesString, true));
    }

    /**
     * @return string
     */
    public function getPricesString()
    {
        return json_encode($this->getPrices());
    }

    /**
     * @param mixed $brief
     * @return $this
     */
    public function setBrief($brief)
    {
        $this->brief = $brief;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getBrief()
    {
        return $this->brief;
    }

    /**
     * @param $price
     * @return $this
     */
    public function setPrice($price)
    {
        $this->price = $price;

        return $this;
    }

    /**
     * Retrieves item price
     * @return float
     */
    public function getPrice()
    {
        return $this->price;
    }

    /**
     * @param string[] $photos
     * @return $this
     */
    public function setPhotos(array $photos = null)
    {
        if (!$photos) {
            $photos = array();
        }

        $this->photos = $photos;

        return $this;
    }

    /**
     * @return string[]
     */
    public function getPhotos()
    {
        return $this->photos;
    }

    /**
     * @return null|string
     */
    public function getPhoto()
    {
        $photos = $this->getPhotos();

        if (count($photos)) {
            return $photos[0];
        }

        return null;
    }

    /**
     * @param string $name
     * @return string
     */
    public function getSetting($name)
    {
        if ($name === 'photos') {
            return join(';', $this->getPhotos());
        }

        return parent::getSetting($name);
    }

    /**
     * @param string $name
     * @param mixed $value
     */
    public function setSetting($name, $value)
    {
        if ($name === 'photos') {
            $this->setPhotos(explode(';', $value));
            return;
        }

        parent::setSetting($name, $value);
    }

    /**
     * @return array
     */
    protected function getGroups()
    {
        return array(
            self::GROUP_ALL,
            self::GROUP_NOMEAT,
            self::GROUP_SWEET,
            self::GROUP_SEASON,
            self::GROUP_HOT,
        );
    }
}