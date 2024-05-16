<?php

namespace Model;
use PDO;
use Util\Connection;

class RispostaRepository
{

    public static function listAllRiposteByIDSurvey($id_survey): array
    {
        try {
            $pdo = Connection::getInstance();
            $sql = 'SELECT * FROM response WHERE id_questionario = :id_survey'; // Assicurati che i nomi delle colonne e della tabella siano corretti
            $stmt = $pdo->prepare($sql);
            $stmt->execute(['id_survey' => $id_survey]); // Aggiungi i due punti nel binding del parametro
            return $stmt->fetchAll(); // Utilizza PDO::FETCH_ASSOC per ottenere solo un array associativo
        } catch (PDOException $e) {
            // Gestione degli errori, ad esempio loggare l'errore e restituire un array vuoto
            error_log("Errore durante il recupero delle domande del questionario: " . $e->getMessage());
            return []; // Restituisce un array vuoto in caso di errore
        }
    }


}