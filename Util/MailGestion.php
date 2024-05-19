<?php
namespace Util;
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;

require './vendor/autoload.php';

class MailGestion
{
    private function __construct()
    {
    }

    private static function sendEmail(string $address,string $subject, string $body)  {
    $mail = new PHPMailer();

    $mail->isSMTP();
    $mail->SMTPAuth=true;
    $mail->Host = 'smtp.gmail.com';

    $mail->Port = 465;

    $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;


    $mail->Username = 'castelli.survey@gmail.com';

    $mail->Password = 'jqrlplvkntpqybrz';

    $mail->setFrom('castelli.survey@gmail.com');

    $mail->addReplyTo('castelli.survey@gmail.com');

    $mail->addAddress($address);

    $mail->Subject = $subject;

    $mail->Body = $body;


    $mail->send();
    }


public static function resetPassword(string $address){

    $body='Il codice per il reset della password è il seguente :   ';

    $caratteri = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $lunghezzaCaratteri = strlen($caratteri);
    $codice = '';
    for ($i = 0; $i < 7; $i++) {
        $codice .= $caratteri[rand(0, $lunghezzaCaratteri - 1)];
    }

    $body .= $codice;

    self::sendEmail($address,'Reset Password',$body);
    return $codice;
}

public static function enter(string $address){
    $body='La informiamo che ha appena loggato al nostro servizio';
    $subject='no-reply. Servizio Castelli notifica di login';
    self::sendEmail($address, $subject,$body);
}
}






