<?php

require 'vendor/autoload.php';

use Model\UserRepository;

$template = new League\Plates\Engine('templates', 'tpl');




$informazioni = \Model\QuestionarioRepository::listAll();

//Informazioni per la pagina dell'admin
$utenti = UserRepository::listAll();
$numero_utenti = UserRepository::numberUsers();
$numero_survey = \Model\QuestionarioRepository::numberSurveys();

if (isset($_GET['action'])) {
    $action = $_GET['action'];
    if ($action === 'registrazione') {
        echo $template->render('registration', [

        ]);
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

    if ($action === 'profile'){
        $user = Util\Authenticator::getUser();
        $username = $user['username'];
        $id_ruolo = $user['ruolo'];
        $image=$user['image'];
        $nome_ruolo = \Model\RuoloRepository::getRuolo($id_ruolo);
        echo $template->render('profile', [
            'username' => $username,
            'nome_ruolo' => $nome_ruolo,
            'image'=>$image
        ]);
        exit(0);
    }

    if ($action === 'visitUsers'){
        echo $template->render('users', [
            'utenti' => $utenti
        ]);
        exit(0);
    }

    if ($action === 'delete' && isset($_GET['id'])){
        $id = $_GET['id'];
        UserRepository::removeUser($id);
        $utenti = UserRepository::listAll();
        echo $template->render('users', [
            'utenti' => $utenti
        ]);
        exit(0);
    }

    if ($action === 'finish'){

    }



}
$user = Util\Authenticator::getUser();







if(isset($_POST['email'])){
    if(isset($_FILES['immagine']) && $_FILES['immagine']['name']!='') {
        $immagine = basename($_FILES['immagine']['name']);
        $nome_univoco = sha1($_FILES['immagine']['name'] . rand()) . '.jpg';
        $uploadfile = UPLOAD_DIR . '/' . $nome_univoco;
        move_uploaded_file($_FILES['immagine']['tmp_name'], $uploadfile);
    }
    if($_FILES['immagine']['name']==''){
        $nome_univoco="user.jpg";
    }
    Model\UserRepository::insertUser($_POST['username'],password_hash($_POST['password'],PASSWORD_DEFAULT),$_POST['nome'],$_POST['cognome'],$_POST['email'], $nome_univoco);
    }

if($user == null){
    echo $template->render('login');
    if(isset($_POST['username']))
        echo "<script>alert('Nessun account con questo username è presente')</script>";
    exit(0);
}
$username = $user['username'];
$id_user = $user['id'];
if(isset($_GET['action']) && $_GET['action'] ==='login'){


    Util\MailGestion::enter($user['email']);
}
if($user['ruolo']=='1'){
    echo $template->render('admin', [
        'numero_utenti' => $numero_utenti,
        'numero_survey' => $numero_survey,
        'utenti' => $utenti
    ]);
    exit(0);
}
echo $template->render('surveyDashboard', [
    'informazioni' => $informazioni
]);
exit(0);









