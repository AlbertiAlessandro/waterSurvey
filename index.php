<?php

require 'vendor/autoload.php';

use Model\UserRepository;

$template = new League\Plates\Engine('templates', 'tpl');




$informazioni = \Model\QuestionarioRepository::listAll();

if (isset($_GET['action'])) {
    $action = $_GET['action'];
    if ($action === 'registrazione') {
        echo $template->render('registration');
        exit(0);
    }
    if ($action === 'logout') {
        Util\Authenticator::logout();
    }
    if ($action === 'confirmcode') {
        Model\UserRepository::insertToken($_POST['email'], Util\MailGestion::resetPassword($_POST['email']));
        echo $template->render('code', [
            'email' => $_POST['email']
        ]);
        exit(0);
    }
    if ($action === 'resetpassword') {
        $usermail = Model\UserRepository::getUserByEmail($_POST['email']);
        if ($usermail['token_reset'] === $_POST['code']) {
            echo $template->render('resetPassword', [
                'email' => $_POST['email']
            ]);
            exit(0);
        } else {
            Model\UserRepository::insertToken($_POST['email'], Util\MailGestion::resetPassword($_POST['email']));
            $message = 'Errore codice sbagliato';
            echo $template->render('code', [
                'email' => $_POST['email']
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


    if ($action === 'survey') {
        $id_survey = intval($_GET['id']);
        if ($id_survey > 0) {
            $domande = \Model\DomandaRepository::listAllDomandeByIDSurvey($id_survey);
            $opzioni = \Model\OpzioneRepository::listAllOpzioniByIDSurvey($id_survey);
            echo $template->render('survey', [
                'domande' => $domande,
                'opzioni' => $opzioni,
                'id_survey' => $id_survey
            ]);
            exit(0);
        }
    }


}
$user = Util\Authenticator::getUser();

if($action==='login'){

    Util\MailGestion::enter($user['email']);
}
if(isset($_POST['email'])){
    var_dump($_POST);
    Model\UserRepository::insertUser($_POST['username'],password_hash($_POST['password'],PASSWORD_DEFAULT),$_POST['nome'],$_POST['cognome'],$_POST['email']);
}

if($user == null){
    echo $template->render('login');
    exit(0);
}else{
    echo $template->render('surveyDashboard', [
        'informazioni' => $informazioni
    ]);
    exit(0);
}





