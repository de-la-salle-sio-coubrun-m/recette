<?php

$array = '[';
$requete = "SELECT nomCategorie FROM categorie";
$resultat=mysqli_query($connexion,$requete);
while($tab=mysqli_fetch_array($resultat)) {
    $array .= '"'.$tab[0].'",';
}
$array .= ']';


$contenu = "form_recette.html";
?>