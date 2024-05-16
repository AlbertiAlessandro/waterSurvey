<?php

require 'vendor/autoload.php';

use Model\UserRepository;

session_start();

$template = new League\Plates\Engine('templates', 'tpl');


$informazioni = \Model\QuestionarioRepository::getInformazioniQuestionario();

if (isset($_GET['action'])) {
    $action = $_GET['action'];
    if ($action === 'survey'){
        echo $template->render('survey', [

        ]);
    }

}



echo $template->render('surveyHome', [
    'informazioni' => $informazioni
]);