<?php

namespace Model;

use League\Plates\Template\Functions;
use PDO;
use Util\Connection;

class RispostaRepository
{

    public static function insert_response($response,$id_survey,$id_utente,$id_domanda){
        $pdo = Connection::getInstance();
        $sql = 'INSERT INTO response (risposta,id_utente,id_domanda,id_questionario) VALUES (:response,:utente,:domanda,:questionario)';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'response'=> $response,
            'utente'=>$id_utente,
            'domanda'=>$id_domanda,
            'questionario'=>$id_survey
        ]);

    }
    public static function getAll_responseByUtenteBySurvey($id_utente,$id_survey){
        $pdo = Connection::getInstance();
        $sql = 'SELECT * FROM response WHERE id_utente=:utente AND id_questionario=:questionario';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'utente'=>$id_utente,
            'questionario'=>$id_survey
        ]);
        if ($stmt->rowCount() == 0) {
            return true;
        } else {
            $result = $stmt->fetchall();
            return $result;
        }
    }

    public static function numberOfFeedback(): int {
        $pdo = Connection::getInstance();
        $sql = 'SELECT COUNT(*) AS count FROM response WHERE id_domanda % 10 = 0';
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        $result = $stmt->fetch();
        return (int) $result['count'];
    }


    public static function getFeedback(): array {
        try {
            $pdo = Connection::getInstance();
            $sql = 'SELECT id_utente, risposta, id_questionario FROM response WHERE id_domanda % 10 = 0';
            $stmt = $pdo->prepare($sql);
            $stmt->execute();
            $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
            return $result;
        } catch (PDOException $e) {
            // Log the exception or handle it as needed
            error_log($e->getMessage());
            return [];
        }
    }


}