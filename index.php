<?php

require 'vendor/autoload.php';

use Model\UserRepository;

session_start();

$template = new League\Plates\Engine('templates', 'tpl');


$informazioni = \Model\QuestionarioRepository::getInformazioniQuestionario();

if (isset($_GET['action'])) {
    $action = $_GET['action'];
    if ($action === 'survey'){
        $id_survey = $_GET['id'];
        $domande = \Model\DomandaRepository::listAllDomandeByIDSurvey($id_survey);
        $risposte = \Model\RispostaRepository::listAllRiposteByIDSurvey($id_survey);
        echo $template->render('survey', [
            'domande' => $domande,
            'risposte' => $risposte
        ]);
    }

}else{
    echo $template->render('surveyHome', [
        'informazioni' => $informazioni
    ]);
}


