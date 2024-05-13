<?php

namespace Model;
use Util\Connection;

class UserRepository
{

    private static function start()
    {
        if (session_id() == "")
            session_start();
    }










}
