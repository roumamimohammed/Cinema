<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
header('Access-Control-Allow-Methods: *');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization,X-Requested-With');
class Films extends Controller{
  private $film;
function __construct()
{
    $this->film=$this->model('Film');
}


function getfilms(){
    $data=$this->film->getfilms(); 
    echo json_encode($data);
}

function getfilm(){
    $idfilm=$_GET['id_film'];
    $data=$this->film->getfilm($idfilm); 
    echo json_encode($data);
}


function getfilmsbydate(){
    $date=$_POST['show_date'];
    $data=$this->film->getfilmbydate($date); 
    echo json_encode($data);
}





}