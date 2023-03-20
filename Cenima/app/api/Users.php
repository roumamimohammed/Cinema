<?php

header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization,X-Requested-With');

require_once '../vendor/autoload.php';
use Firebase\JWT\JWT;

class Users extends Controller{
    private $user;
    function __construct() {
        $this->user=$this->model('User');
    }

    public function getToken($data)
    {
        $key='vDoWNVvoLBuil_L6v3vWDm4AwQz86v1vdU9wukQanGT8yYudqDPPeKJwFaXL-Nie';
        $jwt=JWT::encode($data,$key,'HS256');
        return $jwt;
    }
    
    public function register(){
        header('Access-Control-Allow-Methods: POST');
        if($_SERVER['REQUEST_METHOD']=='POST'){
            $data = [
                'user_name' => $_POST['user_name'] ,
                'user_username' => $_POST['user_username'] ,
            ];
            $password=$this->getToken($data);
            if($this->user->register($data,$password)==true){
                echo json_encode($this->user->return_id());
              }
        }
    }


    public function login(){
        header('Access-Control-Allow-Methods: POST');
        if($_SERVER['REQUEST_METHOD']=='POST'){
            $user_id = $_POST['user_id'];
            $data=$this->user->login($user_id);
            if($data) {
                echo json_encode($data);
            } else {
                http_response_code(403);
                echo json_encode(['error' =>  'wrong ID']);
            }
        }
    }
}
