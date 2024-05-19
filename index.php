<?php

require 'vendor/autoload.php';

use Model\UserRepository;

session_start();

$template = new League\Plates\Engine('templates', 'tpl');


$informazioni = \Model\QuestionarioRepository::listAll();

if (isset($_GET['action'])) {
    $action = $_GET['action'];
    if ($action === 'survey') {
        $_SESSION['id_survey'] = intval($_GET['id']);
        if ($_SESSION['id_survey'] > 0) {
            $domande = \Model\DomandaRepository::listAllDomandeByIDSurvey($_SESSION['id_survey']);
            $opzioni = \Model\OpzioneRepository::listAllOpzioniByIDSurvey($_SESSION['id_survey']);
            echo $template->render('survey', [
                'domande' => $domande,
                'opzioni' => $opzioni,
                'id_survey' => $_SESSION['id_survey']
            ]);
        }

    }else if ($action === 'finish'){

    }

}else{
    echo $template->render('surveyDashboard', [
        'informazioni' => $informazioni
    ]);
}


