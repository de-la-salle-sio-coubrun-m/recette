<?php include('header.html');  ?>
  <section id="pageRecette">
    <?php
      $base = connect();
      $requete= $base->query("SELECT * FROM recette ORDER BY nomRecette");
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
    ?>
  </section>
  
  <?php
  include('footer.html');
  ?>
  