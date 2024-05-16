<?php

namespace Model;
use PDO;
use Util\Connection;

class RispostaRepository
{

    //da fare con l'id della domanda, così che ogni riposta sarà l'opzione di una
    //specifica domanda
    public static function listAllRiposteByIDSurvey($id_survey): array
    {
        try {
            $pdo = Connection::getInstance();
            $sql = 'SELECT * FROM response WHERE id_questionario = :id_questionario';
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



}