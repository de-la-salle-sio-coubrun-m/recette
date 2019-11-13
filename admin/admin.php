<?php
//permet l'usage des variables de session
session_start();
require_once("../tools/fonctions.php");
//établit la connexion avec la base de données
$connexion=connexion();

if(isset($_GET['action'])){
    switch ($_GET["action"]){
        case "déconnecter":
            # code...
        break; // fin case déconnecter
        
        case "recette":

            //contenu à afficher
            $contenu="form_recette.html";
            if(isset($_GET["cas"])){
                switch ($_GET["cas"]) {
                    case "ajouter":
                        if(isset($_POST['submit'])){
                            
                        }
                    break;//fin case ajouter
                    
                    case "modifier":
                        # code...
                    break;//fin case modifier

                    case "supprimer":
                        # code...
                    break;//fin case supprimer
                }
            }
        break;//fin case recette
        
        case "ingredient":
            # code...
        break;//fin case ingredient

        case "article":
            # code...
        break;//fin case article

        case "image":
            # code...
        break;//fin case image
        case "compte":
            # code...
        break;//fin case compte
    }//fin switch
}// fin if isset

//on referme la connexion à la base
mysqli_close($connexion);
include("admin.html");
?>