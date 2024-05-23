<?php

namespace Model;
use Util\Connection;

class UserRepository{

    public static function userAuthentication(string $username, string $password){
        $pdo = Connection::getInstance();
        $sql = 'SELECT * FROM user WHERE username=:username';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
                'username' => $username
            ]
        );

        //Non esiste un utente con quello username nel database
        if($stmt->rowCount() == 0)
            return null;
        //Recupera i dati dell'utente
        $row = $stmt->fetch();
        //Verifica che la password corrisponda
        //Se non corrisponde ritorna null
        if (!password_verify($password, $row['password']))
            return null;
        //Altrimenti ritorna il vettore contenente i dati dell'utente

        return $row;
    }
    public static function insertUser(string $username, string $password, string $nome, string $cognome, string $email){
        $pdo = Connection::getInstance();
        $sql = 'INSERT INTO user (username, password,nome,cognome,email) VALUES (:username, :password, :nome, :cognome, :email)';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'username' => $username,
            'password' => $password,
            'nome' => $nome,
            'cognome' => $cognome,
            'email' => $email,
        ]);

    }
    public static function getUser(string $username){
        $pdo = Connection::getInstance();
        $sql = 'SELECT * FROM user WHERE username=:username';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
                'username' => $username
            ]
        );
        if($stmt->rowCount() == 0)
            return null;
        else
            return $row = $stmt->fetch();
    }


    public static function getUserByEmail(string $email) {
        $pdo = Connection::getInstance();
        $sql = 'SELECT * FROM user WHERE email=:email';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
                'email' => $email
            ]
        );
        if($stmt->rowCount() == 0)
            return null;
        else
            return $row = $stmt->fetch();
    }

    public static function insertToken(string $email, string $code) {
        $pdo = Connection::getInstance();
        $sql = 'UPDATE user SET token_reset=:code   WHERE email=:email';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
                'email' => $email,
                'code'=> $code
            ]
        );
    }
    public static function updatePassword(string $password,string $email){
        $pdo = Connection::getInstance();

        $sql = 'UPDATE user SET token_reset=NULL, password=:password WHERE email=:email';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
                'password'=>$password,
                'email'=>$email
            ]
        );
    }

    public static function numberUsers(){
        $pdo = Connection::getInstance();
        $sql = 'SELECT COUNT(*) as utenti FROM user WHERE ruolo = 2';
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        $row = $stmt->fetch();
        if ($row) {
            return $row['utenti'];
        } else {
            return null;
        }
    }



}
