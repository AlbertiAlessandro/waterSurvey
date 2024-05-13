<?php

namespace Model;
use Util\Connection;

class NoteRepository
{
    public static function aggiungiSpesa($descrizione, $data, $importo, $id_user, $id_tipo): void
    {
        try {
            $pdo = Connection::getInstance();

            // Verifica se l'utente con l'ID fornito esiste nel database
            $userExists = \Model\UserRepository::userExists($id_user);

            if (!$userExists) {
                // Gestisci il caso in cui l'utente non esiste nel database
                throw new Exception("L'utente con l'ID $id_user non esiste nel database.");
            }

            // Assicurati che i nomi delle colonne siano corretti nel tuo schema del database
            $sql = 'INSERT INTO gestionespese.note (descrizione, date, importo, Id_user, Id_tipo) 
                VALUES (:descrizione, :data, :importo, :id_user, :id_tipo)';
            $stmt = $pdo->prepare($sql);
            $stmt->execute([
                'descrizione' => $descrizione,
                'data' => $data,
                'importo' => $importo,
                'id_user' => $id_user, // Aggiunto l'ID utente come parametro della query
                'id_tipo' => $id_tipo
            ]);
        } catch (PDOException $e) {
            // Gestione degli errori di PDO
            error_log("Errore durante l'esecuzione della query: " . $e->getMessage());
            throw new Exception("Errore durante l'esecuzione della query.");
        } catch (Exception $e) {
            // Gestione degli altri tipi di errori
            error_log("Errore: " . $e->getMessage());
            throw $e;
        }
    }

    public static function rimuoviSpesa($id_spesa): void
    {
        try {
            $pdo = Connection::getInstance();

            // Assicurati che i nomi delle colonne siano corretti nel tuo schema del database
            $sql = 'DELETE FROM gestionespese.note WHERE id = :id_spesa';
            $stmt = $pdo->prepare($sql);
            $stmt->execute(['id_spesa' => $id_spesa]);
        } catch (PDOException $e) {
            // Gestione degli errori di PDO
            error_log("Errore durante l'esecuzione della query: " . $e->getMessage());
            throw new Exception("Errore durante l'esecuzione della query.");
        } catch (Exception $e) {
            // Gestione degli altri tipi di errori
            error_log("Errore: " . $e->getMessage());
            throw $e;
        }
    }


    public static function ModificaSpesa($id_spesa, $descrizione, $data, $importo, $id_user, $id_tipo): void
    {
        try {
            $pdo = Connection::getInstance();

            // Verifica se l'utente con l'ID fornito esiste nel database
            $userExists = \Model\UserRepository::userExists($id_user);
            if (!$userExists) {
                // Gestisci il caso in cui l'utente non esiste nel database
                throw new Exception("L'utente con l'ID $id_user non esiste nel database.");
            }

            // Verifica se la spesa da modificare esiste
            $sql = 'SELECT * FROM gestionespese.note WHERE id = :id_spesa';
            $stmt = $pdo->prepare($sql);
            $stmt->execute(['id_spesa' => $id_spesa]);
            $spesa = $stmt->fetch();

            if (!$spesa) {
                // Gestisci il caso in cui la spesa da modificare non esiste
                throw new Exception("La spesa con l'ID $id_spesa non esiste nel database.");
            }

            // Preparazione del comando SQL per l'aggiornamento della spesa esistente
            $sql = 'UPDATE gestionespese.note SET descrizione = :descrizione, date = :data, importo = :importo, Id_user = :id_user, Id_tipo = :id_tipo WHERE id = :id_spesa';
            $stmt = $pdo->prepare($sql);
            $stmt->execute([
                'descrizione' => $descrizione,
                'data' => $data,
                'importo' => $importo,
                'id_user' => $id_user,
                'id_tipo' => $id_tipo,
                'id_spesa' => $id_spesa
            ]);
        } catch (PDOException $e) {
            // Gestione degli errori di PDO
            error_log("Errore durante l'esecuzione della query: " . $e->getMessage());
            throw new Exception("Errore durante l'esecuzione della query.");
        } catch (Exception $e) {
            // Gestione degli altri tipi di errori
            error_log("Errore: " . $e->getMessage());
            throw $e;
        }
    }




    public static function listAll($id): array
    {
        try {
            $pdo = Connection::getInstance();
            $sql = 'SELECT * FROM note WHERE id_user = :id_user'; // Assicurati che il nome della colonna sia corretto
            $stmt = $pdo->prepare($sql);
            $stmt->execute(['id_user' => $id]);
            return $stmt->fetchAll(); // Utilizza PDO::FETCH_ASSOC per ottenere solo un array associativo
        } catch (PDOException $e) {
            // Gestione degli errori, ad esempio loggare l'errore e restituire un array vuoto
            error_log("Errore durante il recupero delle spese dell'utente: " . $e->getMessage());
            return []; // Restituisce un array vuoto in caso di errore
        }
    }


    public static function getSpeseByIdUtente($id_utente): array
    {
        try {
            $pdo = Connection::getInstance();

            // Verifica se l'utente con l'ID fornito ha delle spese nel database
            $sql = 'SELECT * FROM note WHERE Id_user = :id_utente';
            $stmt = $pdo->prepare($sql);
            $stmt->execute(['id_utente' => $id_utente]);
            $spese = $stmt->fetchAll();

            if (!$spese) {
                // Se l'utente non ha spese, ritorna un array vuoto
                return [];
            }

            return $spese;
        } catch (PDOException $e) {
            // Gestione degli errori di PDO
            error_log("Errore durante l'esecuzione della query: " . $e->getMessage());
            throw new Exception("Errore durante l'esecuzione della query.");
        } catch (Exception $e) {
            // Gestione degli altri tipi di errori
            error_log("Errore: " . $e->getMessage());
            throw $e;
        }
    }


    public static function getIDSpesa($descrizione, $data, $importo, $id_user, $id_tipo): ?int
    {
        try {
            $pdo = Connection::getInstance();

            // Assicurati che i nomi delle colonne siano corretti nel tuo schema del database
            $sql = 'SELECT id FROM gestionespese.note WHERE descrizione = :descrizione 
                AND date = :data AND importo = :importo 
                AND Id_user = :id_user AND Id_tipo = :id_tipo';
            $stmt = $pdo->prepare($sql);
            $stmt->execute([
                'descrizione' => $descrizione,
                'data' => $data,
                'importo' => $importo,
                'id_user' => $id_user,
                'id_tipo' => $id_tipo
            ]);

            $row = $stmt->fetch();

            if ($row) {
                return $row['id'];
            } else {
                return null;
            }
        } catch (PDOException $e) {
            // Gestione degli errori di PDO
            error_log("Errore durante l'esecuzione della query: " . $e->getMessage());
            throw new Exception("Errore durante l'esecuzione della query.");
        } catch (Exception $e) {
            // Gestione degli altri tipi di errori
            error_log("Errore: " . $e->getMessage());
            throw $e;
        }
    }




    public static function query1()
    {
        $pdo = Connection::getInstance();
        $sql = 'SELECT id, username, mail, id_permesso FROM users;';
        $result = $pdo->query($sql);
        return $result->fetchAll();
    }

    public static function query2(){
        $pdo = Connection::getInstance();
        $sql = 'SELECT * FROM note';
        $result = $pdo->query($sql);
        return $result->fetchAll();
    }

    public static function nusers() {
        $pdo = Connection::getInstance();
        $sql = 'SELECT COUNT(*) AS count FROM users';
        $result = $pdo->query($sql);
        return $result->fetchColumn();
    }

    public static function nnote() {
        $pdo = Connection::getInstance();
        $sql = 'SELECT COUNT(*) AS countnote FROM note';
        $result = $pdo->query($sql);
        return $result->fetchColumn();
    }

    public static function totspese() {
        $pdo = Connection::getInstance();
        $sql = 'SELECT SUM(importo) AS sommaspese FROM note';
        $result = $pdo->query($sql);
        return $result->fetchColumn();
    }


    /**
     * Verifica se una spesa esiste nel database.
     *
     * @param int $idSpesa L'ID della spesa da verificare.
     * @param int $idUser L'ID dell'utente associato alla spesa.
     * @return bool True se la spesa esiste, altrimenti false.
     */
    public static function existsSpesa($idSpesa, $idUser) {
        $pdo = Connection::getInstance();

        $sql = 'SELECT COUNT(*) FROM note 
                WHERE id = :idSpesa AND Id_user = :idUser';

        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'idSpesa' => $idSpesa,
            'idUser' => $idUser
        ]);

        $count = $stmt->fetchColumn();

        return ($count > 0);
    }

    public static function getSpesaById(mixed $idSpesa)
    {
    }

}