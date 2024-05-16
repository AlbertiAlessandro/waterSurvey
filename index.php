<?php

require 'vendor/autoload.php';

use Model\UserRepository;
use Util\Authenticator;

$template = new League\Plates\Engine('templates', 'tpl');
if(isset($_GET['action'])){
    if($_GET['action']=='registrazione'){
        echo $template->render('registration');
        exit(0);
    }
}
if(isset($_POST['email'])){
    var_dump($_POST);
    Model\UserRepository::insertUser($_POST['username'],password_hash($_POST['password'],PASSWORD_DEFAULT),$_POST['nome'],$_POST['cognome'],$_POST['email']);
}


$informazioni = \Model\QuestionarioRepository::getInformazioniQuestionario();

if (isset($_GET['action'])) {
    $action = $_GET['action'];
    if ($action === 'survey'){
        echo $template->render('survey', [

        ]);
    }

}

$user=Authenticator::getUser();
if($user == null){
    echo $template->render('login');
    exit(0);
}


echo $template->render('surveyDashboard', [
    'informazioni' => $informazioni
]);