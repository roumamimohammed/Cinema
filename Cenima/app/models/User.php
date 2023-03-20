<?php

class User extends database
{
    function __construct()
    {
    }


    function register($data,$password)
    {
        $sql = "INSERT INTO `user`(`user_name`, `user_username`,`password`) VALUES (:user_name,:user_username,:pass)";
        $stmt = $this->openConnection()->prepare($sql);
        $stmt->bindParam(':user_name', $data['user_name']);
        $stmt->bindParam(':user_username', $data['user_username']);
        $stmt->bindParam(':pass', $password);
        if ($stmt->execute()) {
            return true;
        }
    }

    function return_id()
    {
        $sql = "SELECT `password` FROM `user` ORDER BY `user_id` DESC LIMIT 1 ";
        $stmt = $this->openConnection()->prepare($sql);
        $stmt->execute();
        if ($stmt->rowCount() == 1) {
            $data = $stmt->fetch(PDO::FETCH_ASSOC);

            return $data['password'];;
        }
    }

    function login($user_id)
    {
        $sql = "SELECT `user_id`,`user_name`, `user_username` FROM `user` WHERE password=:user_id";
        $stmt = $this->openConnection()->prepare($sql);
        $stmt->bindParam(':user_id', $user_id);
        $stmt->execute();
        if ($stmt->rowCount() == 1) {
            $data = $stmt->fetch(PDO::FETCH_ASSOC);
                return $data;
            } else {
                return false;
            }
        } 
    }

