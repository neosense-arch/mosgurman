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
}