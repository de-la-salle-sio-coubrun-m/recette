<?php


if (isset($_GET['nomTable']) && isset($_GET['nomChamps'])) {
    $requete = "SELECT ". $_GET['nomChamps'] ." FROM ".$_GET['nomTable'];
    if (isset($_GET['search'])) {
        $requete .= " WHERE ".$_GET['nomChamps']." LIKE '%".$_GET['search']."%'";
    }
    $resultat=mysqli_query($connexion,$requete);
    $array = [];
    while($tab=mysqli_fetch_array($resultat)) {
        $array[] =  $tab[0];
    }
    print json_encode($array);
    die;
}



$array = '[';
$requete = "SELECT nomCategorie FROM categorie";
$resultat=mysqli_query($connexion,$requete);
while($tab=mysqli_fetch_array($resultat)) {
    $array .= '"'.$tab[0].'",';
}
$array .= ']';


$contenu = "form_recette.html";
?>