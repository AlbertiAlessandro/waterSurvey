<?php

namespace Model;
use PDO;
use Util\Connection;

class OpzioneRepository
{

    public static function listAllOpzioniByIDSurvey($id_survey): array
    {
        try {
            $pdo = Connection::getInstance();
            $sql = 'SELECT * FROM options WHERE id_questionario = :id_questionario';
            $stmt = $pdo->prepare($sql);
            $stmt->execute([':id_questionario' => $id_survey]);
            $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

            $responses = [];
            foreach ($rows as $row) {
                $responses[$row['id_domanda']][] = $row;
            }
            return $responses;
        } catch (PDOException $e) {
            error_log("Errore durante il recupero delle risposte: " . $e->getMessage());
            return [];
        }
    }

    public static function insertOpzione($risposta,$domanda,$questionario)  {
        $pdo = Connection::getInstance();
        $sql = 'INSERT INTO options (risposta,id_domanda,id_utente,id_questionario) VALUES ( :risposta, :domanda , 5 , :questionario)';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'risposta'=>$risposta,
            'domanda'=>$domanda,
            'questionario'=>$questionario
        ]);

    }

}