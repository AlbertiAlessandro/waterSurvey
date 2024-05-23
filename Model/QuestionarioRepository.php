<?php

namespace Model;
use Util\Connection;

class QuestionarioRepository
{
    /**
     * Il metodo equivale al ListAll delle informazioni di ogni survey
     * @return array
     */
    public static function listAll(): array{
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

    public static function getInformazioniQuestionarioByID($id_survey): array{
        try {
            $pdo = Connection::getInstance();
            $sql = 'SELECT * FROM water_survey.survey WHERE id = :id_survey'; // Assicurati che il nome della colonna sia corretto
            $stmt = $pdo->prepare($sql);
            $stmt->execute(['id_survey' => $id_survey]);
            return $stmt->fetchAll(); // Utilizza PDO::FETCH_ASSOC per ottenere solo un array associativo
        } catch (PDOException $e) {
            // Gestione degli errori, ad esempio loggare l'errore e restituire un array vuoto
            error_log("Errore durante il recupero delle spese dell'utente: " . $e->getMessage());
            return []; // Restituisce un array vuoto in caso di errore
        }
    }

    // Metodo per verificare se un survey è stato completato
    public static function isCompleted($id_survey): bool
    {
        try {
            // Ottieni l'istanza della connessione PDO
            $pdo = Connection::getInstance();

            // Preparare la query SQL per controllare lo stato del survey
            $sql = 'SELECT water_survey.survey.completato FROM water_survey.survey WHERE id = :id_survey';
            $stmt = $pdo->prepare($sql);

            // Eseguire la query
            $stmt->execute(['id_survey' => $id_survey]);

            // Recuperare il risultato
            $result = $stmt->fetch();

            // Controllare se il survey esiste e se è completato
            if ($result && isset($result['completato'])) {
                return $result['completato'] == 1; // Assumendo che la colonna 'completed' sia 1 per completato e 0 per non completato
            } else {
                // Se non si trova il survey, considerarlo non completato
                return false;
            }
        } catch (PDOException $e) {
            // Gestire eventuali errori di connessione o query
            error_log('Errore di connessione al database: ' . $e->getMessage());
            return false;
        }
    }

    // Metodo per impostare un survey come completato
    public static function setCompleted($id_survey) {
        try {
            // Ottieni l'istanza della connessione PDO
            $pdo = Connection::getInstance();

            // Preparare la query SQL per aggiornare lo stato del survey
            $sql = 'UPDATE water_survey.survey SET completato = 1 WHERE id = :id_survey';
            $stmt = $pdo->prepare($sql);

            // Eseguire la query
            $stmt->execute(['id_survey' => $id_survey]);

            // Controllare se l'aggiornamento ha avuto successo
            return $stmt->rowCount() > 0;
        } catch (PDOException $e) {
            // Gestire eventuali errori di connessione o query
            error_log('Errore durante l\'aggiornamento dello stato del survey: ' . $e->getMessage());
            return false;
        }
    }


    public static function numberSurveys(){
        $pdo = Connection::getInstance();
        $sql = 'SELECT COUNT(*) as survey FROM water_survey.survey';
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        $row = $stmt->fetch();
        if ($row) {
            return $row['survey'];
        } else {
            return null;
        }
    }





}