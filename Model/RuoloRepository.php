<?php

namespace Model;
use Util\Connection;

class RuoloRepository
{

    public static function getRuolo(int $id) {
        $pdo = Connection::getInstance();
        $sql = 'SELECT nome FROM water_survey.ruolo WHERE id=:id';
        $stmt = $pdo->prepare($sql);
        $stmt->execute(['id' => $id]);

        if ($stmt->rowCount() == 0) {
            return null;
        } else {
            $result = $stmt->fetch();
            return $result['nome'];
        }
    }


    public static function listAll(): array{
        try {
            $pdo = Connection::getInstance();
            $sql = 'SELECT * FROM water_survey.ruolo'; // Assicurati che il nome della colonna sia corretto
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