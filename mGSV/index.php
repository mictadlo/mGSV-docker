<?php
echo "Hello World!";
//mysqli_connect("localhost","my_user","my_password","my_db");
$con = mysqli_connect("localhost","mgsv_user","mgsvpass","mgsv");

// Check connection
if (mysqli_connect_errno())
  {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }
  else {
  	 echo "done";
  }
?>
