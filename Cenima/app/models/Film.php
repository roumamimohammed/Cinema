<?php
class Film extends database {

function __construct(){

}

function getfilm($idfilm){
    $sql = "SELECT `film_name`, `show_date`,`image`, `salle`, `id_film`, `salle_place`,`prix` FROM `film` WHERE `id_film`=:id_film";
    $stmt = $this->openConnection()->prepare($sql);
    $stmt->bindParam(':id_film',$idfilm);
    $stmt->execute();
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    return $data;
}

function getfilms(){
    $sql = "SELECT `film_name`, `image` ,`show_date`, `salle`, `id_film`, `salle_place`,`prix` FROM `film` WHERE `show_date`> NOW() and `salle_place`>0";
    $stmt = $this->openConnection()->query($sql);
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    return $data;
}

function getfilmbydate($date){
    $sql = "SELECT `film_name`,`prix`,`image` , `show_date`, `salle`, `id_film`, `salle_place` FROM `film` WHERE`show_date`= :show_date";
    $stmt = $this->openConnection()->prepare($sql);
    $stmt->bindParam(':show_date',$date);
    $stmt->execute();
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    return $data;
}
}
