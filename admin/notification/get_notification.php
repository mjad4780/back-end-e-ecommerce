<?php

include "../../connect.php";
include '../../functions.php';


$id =filterRequest("id");
getAllData("notification","notification_userid=$id");