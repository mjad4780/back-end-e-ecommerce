<?php
include "../connect.php";
include '../functions.php';

$couponName =filterRequest("coupon");
$now =date("Y-m-d H:i:s");
getData('coupon',"coupon_name ='$couponName' AND    coupon_data <'$now ' AND coupon_count > 0   ");
