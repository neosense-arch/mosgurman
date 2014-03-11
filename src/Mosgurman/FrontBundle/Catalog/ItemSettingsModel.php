<?php
/**
 * Created by Yury Smidovich (Stmol)
 * Date: 10.03.14
 * Project: mosgurman
 * Url: http://stmol.me
 * Email: dev@stmol.me
 */

namespace Mosgurman\FrontBundle\Catalog;

use NS\CatalogBundle\Model\AbstractSettings;
use NS\ShopBundle\Item\Priceable;

/**
 * Class ItemSettingsModel
 * @package Mosgurman\FrontBundle\Catalog
 * @author Yury Smidovich <dev@stmol.me>
 */
class ItemSettingsModel extends AbstractSettings implements Priceable
{
    /**
     * @var string
     */
    private $title;

    /**
     * @var string
     */
    private $brief;

    /**
     * @var float
     */
    private $price;

    /**
     * @var string[]
     */
    protected $photos = array();

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
     * @param mixed $title
     * @return $this
     */
    public function setTitle($title)
    {
        $this->title = $title;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getTitle()
    {
        return $this->title;
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
}