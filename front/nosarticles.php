<?php include('header.html'); ?>

    <section id="pageRecette">
      <h2>Nos articles</h2>
    <?php
      $base = connect();
      $requete= $base->query("SELECT * FROM article ORDER BY dateArticle DESC");
      while($ligne= $requete->fetch(PDO::FETCH_OBJ)){
        $image = $base->query("SELECT urlImage FROM image, recette WHERE recette.idImage = image.idImage AND idRecette = '".$ligne->idRecette."'")->fetch(PDO::FETCH_OBJ);
        $thumbnail = '<article class="miniRecette">'; 
        $thumbnail .= '<a href="article.php?idArticle='.$ligne->idArticle.'">';       
        $image->urlImage = str_replace("_p", "_g", $image->urlImage);
        $thumbnail .= '<img src="'.$image->urlImage.'" alt="'.$ligne->titreArticle.'">';
        $thumbnail .= '<div><h3>'.$ligne->titreArticle.'</h3>';
        // $thumbnail .= '<ul><li>Date: '.$ligne->dateArticle.'</li>';
        // $thumbnail .= '<li>Notre article: </li>';
        // $thumbnail .= '<li>'.$ligne->contenuArticle.'</li></ul>';
        $thumbnail .= '</div></article>';
        echo $thumbnail;
      }
    ?>
    </section>

    <?php
  include('footer.html');
  ?>