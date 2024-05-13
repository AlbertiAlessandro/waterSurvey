<?php

require 'vendor/autoload.php';

use Model\UserRepository;

session_start();

$template = new League\Plates\Engine('templates', 'tpl');


$informazioni = \Model\QuestionarioRepository::getInformazioniQuestionario();


echo $template->render('surveyHome', [
    'informazioni' => $informazioni
]);