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

}