<?php

namespace Model;
use Util\Connection;

class DomandaRepository
{

    public static function listAllDomandeByIDSurvey($id_survey): array
    {
            $pdo = Connection::getInstance();
            $sql = 'SELECT * FROM question WHERE id_survey = :id_survey'; // Assicurati che i nomi delle colonne e della tabella siano corretti
            $stmt = $pdo->prepare($sql);
            $stmt->execute(['id_survey' => $id_survey]); // Aggiungi i due punti nel binding del parametro
            return $stmt->fetchAll(); // Utilizza PDO::FETCH_ASSOC per ottenere solo un array associativo
        
    }





}