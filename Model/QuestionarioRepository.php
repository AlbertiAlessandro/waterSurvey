<?php

namespace Model;

use Util\Authenticator;
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


    public static function insertQuestionario(string $titolo,string $descrizione) {
        $user=Authenticator::getUser();
        $pdo = Connection::getInstance();
        $sql = 'INSERT INTO survey (nome,descrizione,creatore) VALUES ( :titolo, :descrizione, :user)';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'titolo'=>$titolo,
            'descrizione'=>$descrizione,
            'user'=>$user['id']
        ]);

        $sql='SELECT id FROM survey ORDER BY id DESC LIMIT 1';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([]);
        return $stmt->fetch();
    }


}