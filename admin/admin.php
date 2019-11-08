<?php
//permet l'usage des variables de session
session_start();
require_once("../tools/fonctions.php");
//établit la connexion avec la base de données
$connexion=connexion();

if(isset($_GET)){
    switch ($_GET['action']) {
        case 'déconnecter':
            # code...
        break;
        
        case 'recette':
            # code...
        break;
        
        case 'ingredient':
            # code...
        break;

        case 'article':
            # code...
        break;

        case 'image':
            # code...
        break;
    }
}

//on referme la connexion à la base
mysqli_close($connexion);
include("admin.html");
?>