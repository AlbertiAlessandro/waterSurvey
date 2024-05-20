<?php

namespace Model;
use Util\Connection;

class QuestionarioRepository
{
    /**
     * Il metodo equivale al ListAll delle informazioni di ogni survey
     * @return array
     */
    public static function getInformazioniQuestionario(): array{
        try {
            $pdo = Connection::getInstance();
            $sql = 'SELECT * FROM water_survey.survey'; // Assicurati che il nome della colonna sia corretto
            $stmt = $pdo->prepare($sql);
            $stmt->execute([]);
            return $stmt->fetchAll(); // Utilizza PDO::FETCH_ASSOC per ottenere solo un array associativo
        } catch (PDOException $e) {
            // Gestione degli errori, ad esempio loggare l'errore e restituire un array vuoto
            error_log("Errore durante il recupero delle spese dell'utente: " . $e->getMessage());
            return []; // Restituisce un array vuoto in caso di errore
        }
    }


}