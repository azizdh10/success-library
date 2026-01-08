<?php


    include 'timeout.php';
    include "db_connect.php";
    $reponse=$bdd->prepare('DELETE FROM adhérents where id=?');
    $reponse->execute([$_GET['id']]);
    include 'logout.php';
    exit();
?>