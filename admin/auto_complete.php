<?php

if (isset($_GET['nomTable']) && isset($_GET['nomChamps'])) {
    $requete = "SELECT ". $_GET['nomChamps'] ." FROM ".$_GET['nomTable'];
    if (isset($_GET['search'])) {
        $requete .= " WHERE ".$_GET['nomChamps']." LIKE '%".$_GET['search']."%'";
    }
    $requete.= "LIMIT 5";
    $resultat=mysqli_query($connexion,$requete);
    $array = [];
    while($tab=mysqli_fetch_array($resultat)) {
        $array[] =  utf8_encode($tab[0]);
    }
    print json_encode($array);
    die;
}

$contenu = "form_recette.html";
?>