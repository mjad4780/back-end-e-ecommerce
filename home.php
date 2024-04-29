<?php
include 'connect.php';
include 'functions.php';


$allData= array();


$allData['status']="success";

$categories= getAllData("categories",null,null, false);
$allData['categories']= $categories;

 $Item= getAllData("item1view","item_discount != 0 ",null, false);
$allData['item1view']=$Item;




echo json_encode($allData);
