<?php 
require_once('../tools/fonctions.php');
include('header.html'); ?>

    <section id="pageRecette">
    <?php
      $base = connect();
      $requete= $base->query("SELECT * FROM article ORDER BY dateArticle DESC");
      while($ligne= $requete->fetch(PDO::FETCH_OBJ)){
        $image = $base->query("SELECT urlImage FROM image, recette WHERE recette.idImage = image.idImage AND idRecette = '".$ligne->idRecette."'")->fetch(PDO::FETCH_OBJ);
        $thumbnail = '<figure class="miniRecette">';
        $thumbnail .= '<a href="article.php?idarticle='.$ligne->idArticle.'">';
        $image->urlImage = str_replace("_p", "_g", $image->urlImage);
        $thumbnail .= '<img src="'.$image->urlImage.'" alt="'.$ligne->titreArticle.'">';
        $thumbnail .= '<figcaption>'.$ligne->titreArticle.'</figcaption>';
        $thumbnail .= '</a>';
        $thumbnail .= '</figure>';
        echo $thumbnail;
      }
    ?>
    </section>

    <?php
  include('footer.html');
  ?>