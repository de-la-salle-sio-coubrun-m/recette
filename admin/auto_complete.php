<?php
    require("../tools/fonctions.php");
   $base = connect();

if (isset($_GET['nomTable']) && isset($_GET['nomChamps'])) {
    $requete = "SELECT ". $_GET['nomChamps'] ." FROM ".$_GET['nomTable'];
    if (isset($_GET['search'])) {
        $requete .= " WHERE ".$_GET['nomChamps']." LIKE '%".$_GET['search']."%'";
    }
    $requete.= "LIMIT 5";
    $resultat=$base->prepare($requete);
    $resultat->execute();
    $array = [];
    while($tab = $resultat->fetch(PDO::FETCH_BOTH)) {
        $array[] = $tab[0];
    }
    print json_encode($array);
    die;
}

if ($_GET){
    $contenu = "form_".$_GET['action'].".html";
}
?>