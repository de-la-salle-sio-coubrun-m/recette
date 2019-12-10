<?php 
require_once('../tools/fonctions.php');
include('header.html');
    //$liste.="<td>" . utf8_decode(utf8_encode($ligne->idOrigine)) . "</td>";
  ?>
  <section id="pageRecette">
    <?php
      $base = connect();

      $parametre = $_GET['categorie'];
      if($parametre == "Vegetarien"){
        $parametre = "Végétarien";
      }
      if($parametre == "Vegetalien"){
        $parametre = "Végétalien";
      }
      $parametre = $base->query("SELECT idCategorie FROM categorie WHERE nomCategorie = '". $parametre ."'")->fetch(PDO::FETCH_OBJ);

      if($parametre){
        $requete= $base->query("SELECT * FROM recette WHERE idCategorie = ". $parametre->idCategorie ." ORDER BY nomRecette");
        while($ligne= $requete->fetch(PDO::FETCH_OBJ)){
          $thumbnail = '<figure class="miniRecette">';
          $thumbnail .= '<a href="recette.php?idrecette='.$ligne->idRecette.'">';
          $image= $base->query("SELECT urlImage FROM image WHERE idImage='".$ligne->idImage."'")->fetch(PDO::FETCH_OBJ);
          $image->urlImage = str_replace("_p", "_g", $image->urlImage);
          $thumbnail .= '<img src="'.$image->urlImage.'" alt="'.$ligne->nomRecette.'">';
          $thumbnail .= '<figcaption>'.$ligne->nomRecette.'</figcaption>';
          $thumbnail .= '</a>';
          $thumbnail .= '</figure>';
          echo $thumbnail;
        }
      }
      else{
        echo "Désolé, mais cette catégorie n'existe pas.";
      }
    ?>
  </section>
  
  <?php
  include('footer.html');
  ?>
  