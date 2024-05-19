<?php

require 'vendor/autoload.php';

use Model\UserRepository;
use Util\Authenticator;

$template = new League\Plates\Engine('templates', 'tpl');

$informazioni = \Model\QuestionarioRepository::getInformazioniQuestionario();

if (isset($_GET['action'])) {
    $action = $_GET['action'];
    if ($action === 'survey'){
        echo $template->render('survey', [

        ]);
    }
    if($action==='registrazione'){
        echo $template->render('registration');
        exit(0);
    }
    if($action=== 'logout'){
        Util\Authenticator::logout();
    }
    if($action==='confirmcode'){
        Model\UserRepository::insertToken($_POST['email'],Util\MailGestion::resetPassword($_POST['email']));
        echo $template->render('code',[
            'email'=> $_POST['email']
        ]);
        exit(0);
    }
    if($action==='resetpassword'){
        $usermail=Model\UserRepository::getUserByEmail($_POST['email']);
        if($usermail['token_reset']===$_POST['code']){
            echo $template->render('resetPassword',[
                'email'=> $_POST['email']
            ]);
            exit(0);
        }
        else{
            Model\UserRepository::insertToken($_POST['email'],Util\MailGestion::resetPassword($_POST['email']));
            $message='Errore codice sbagliato';
            echo $template->render('code',[
                'email'=> $_POST['email']
            ]); 
            echo "<script>alert('$message');</script>";

            exit(0);
        }
    }
    if($action==='completeReset'){
        Model\UserRepository::updatePassword(password_hash($_POST['password'],PASSWORD_DEFAULT),$_POST['email']);
        unset($_POST['email']);
        $message='reset completato';
        echo "<script>alert('$message');</script>";

    }
}

if(isset($_POST['email'])){
    var_dump($_POST);
    Model\UserRepository::insertUser($_POST['username'],password_hash($_POST['password'],PASSWORD_DEFAULT),$_POST['nome'],$_POST['cognome'],$_POST['email']);
}

$user=Authenticator::getUser();

if($user == null){
    echo $template->render('login');
    exit(0);
}
if($action==='login'){

    Util\MailGestion::enter($user['email']);
}

echo $template->render('surveyDashboard', [
    'informazioni' => $informazioni
]);