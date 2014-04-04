<?php
/**
 * Created by Yury Smidovich (Stmol)
 * Date: 04.04.14
 * Project: mosgurman
 * Url: http://stmol.me
 * Email: dev@stmol.me
 */

namespace Mosgurman\FrontBundle\Service;

/**
 * Class MailReportService
 * @package Mosgurman\FrontBundle\Service
 * @author Yury Smidovich <dev@stmol.me>
 */
class MailReportService
{
    /**
     * @var array
     */
    protected $mailsList;

    /**
     * @var \Swift_Mailer
     */
    protected $mailer;

    /**
     * @param $mailsFilePath
     * @param $mailer
     */
    public function __construct($mailsFilePath, $mailer)
    {
        $this->mailsList = explode(',', @file_get_contents($mailsFilePath));
        $this->mailer = $mailer;
    }

    /**
     * @param $template
     */
    public function sendReports($template)
    {
        if (empty($this->mailsList)) {
            return;
        }

        foreach ($this->mailsList as $mailAddress) {
            $message = \Swift_Message::newInstance()
                ->setSubject('Новый заказ! Mosgurman.ru')
                ->setFrom('checkout@mosgurman.ru')
                ->setTo($mailAddress)
                ->setBody($template, 'text/html');

            $this->mailer->send($message);
        }
    }
}
