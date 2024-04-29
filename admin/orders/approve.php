

<?php

include "../../connect.php";
include '../../functions.php';


$orderid =filterRequest("id");
$userid =filterRequest("userid");
$data=array(
 "orders_status"=> 1

);
updateData("orders",$data,"orders_id =$orderid AND orders_status = 0");
insertNotify("success", "the order Has been Approved",$userid,"users$userid","none","none");


  
