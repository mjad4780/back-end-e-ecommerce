
<?php
include "../connect.php";
include '../functions.php';
$itemid =filterRequest("itemid");
$userid =filterRequest("userid");

$count=getData('cart',"cart_itemid =$itemid AND cart_userid =$userid AND cart_orders= 0",null,false ) ;
$data= array(
    'cart_itemid'=> $itemid,
    'cart_userid'=> $userid,


);
insertData('cart',$data,);