<?php

class Reservation extends database{
    function __construct() { }

    
    function decrement($id_film){  
        $sql = "UPDATE `film` SET `salle_place`=`salle_place`-1 WHERE `id_film`=$id_film";
        $stmt = $this->openConnection()->prepare($sql);
        if ($stmt->execute()) {
            return true;
        } else {
            return false;
        }
    }

    
    function reserver($id_film,$nbr_place,$prix,$id_user){
        $sql = "INSERT INTO `reservation`(`date_reservation`, `nbr_place`,`prix`,`id_film`, `id_user`) VALUES (:date_reservation,:nbr_place,:prix,:id_film,:id_user)";
        $stmt=$this->openConnection()->prepare($sql);
        $date_reservation=date("Y/m/d");
        $stmt->bindParam(':nbr_place',$nbr_place);
        $stmt->bindParam(':date_reservation',$date_reservation);
        $stmt->bindParam(':prix',$prix);
        $stmt->bindParam(':id_film',$id_film);
        $stmt->bindParam(':id_user',$id_user);
        $stmt->execute();
        return true;
    }


    function getMyreservation($id_user){

        $sql = "SELECT u.`user_id`, r.`nbr_place`, r.`date_reservation`,f.`image`, f.`film_name`,f.`show_date`,f.`salle`,f.`salle_place`,f.`prix`,r.`id_reservation`,r.`id_film` FROM reservation r INNER JOIN film f ON r.id_film=f.id_film INNER JOIN user u ON r.id_user=u.user_id WHERE id_user=:id_user";
        $stmt=$this->openConnection()->prepare($sql);
        $stmt->bindParam(':id_user',$id_user);
        $stmt->execute();
        $data=$stmt->fetchAll(PDO::FETCH_ASSOC);
        return $data;

    }

   
    

    function crement($id_film){
        $sql = "UPDATE `film` SET `salle_place`=`salle_place`+1 WHERE `id_film`=$id_film";
        $stmt = $this->openConnection()->prepare($sql);
        if ($stmt->execute()) {
            return true;
        } else {
            return false;
        }
        
    }
    function deleteReservation($id_reservation){
        $sql = "DELETE FROM `reservation` WHERE id_reservation=:id_reservation";
        $stmt=$this->openConnection()->prepare($sql);
        $stmt->bindParam(':id_reservation',$id_reservation);
        if($stmt->execute()){
            return true;
        }
    }
    
}
    
