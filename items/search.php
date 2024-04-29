<?php
include "../connect.php";
include '../functions.php';

$search =filterRequest("search");

getAllData('item1view',"item_name LIKE'%$search%' OR item_name_ar LIKE'%$search%'");