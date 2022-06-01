<?php
define("KEY","develoteca");
define("COD","AES-128-ECB");

        try {
         $pdo= new PDO("mysql:dbname=proyecto_informatica; host=localhost","root", "",
        array(PDO::MYSQL_ATTR_INIT_COMMAND=>"SET NAMES utf8")    
    );
        //echo "<script>alert('Conectado....')</script>";
    } catch (PDOException $e) {
        die($ex->getMesagge());
    //echo "<script>alert('Error...')</script>";
}










?>