<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
header('Access-Control-Allow-Methods: *');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization,X-Requested-With');

class Reservations extends Controller
{
   
    private $reservation;

    function __construct()
    {
        $this->reservation = $this->model('Reservation');
    }

    function index()
    {
       
    }

    function reserver()
    {    $id_user = $_GET['user_id'];
        $nbr_place = $_GET['nbr_place'];
        $p= $_GET['prix'];
        $id_film = $_GET['id_film'];    
        $prix=$p*$nbr_place;
      if ($nbr_place>0) {
        $this->reservation->reserver($id_film,$nbr_place,$prix,$id_user) ;
            $this->reservation->decrement($id_film);

        }
    }


    function getMyreservation()
    {
        $id_user = $_POST['user_id'];
        $data = $this->reservation->getMyreservation($id_user);
        echo json_encode($data);
    }


    function deleteReservation()
    {   
             $id_reservation=$_GET['id_reservation'];
             $id_film=$_GET['id_film'];
            if ($this->reservation->deleteReservation($id_reservation)) {
                $this->reservation->crement($id_film);
                echo json_encode(['fghjkl' => 'fghjklmù']);
            }
       
     }}















