<?php 
    require_once('../tools/fonctions.php');
    include('header.html'); 
?>

    <section id="caroussel">
        <?php include("carousel.php"); ?>
    </section>
    
    <section id="recette">
        <article class="recetteHome">
            <h2 class="my-4 text-center">Recette aléatoire :</h2>
            <?php 
                $base = connect();
                $ligne= $base->query("SELECT * FROM recette ORDER BY RAND() LIMIT 1")->fetch(PDO::FETCH_OBJ);
                $image = $base->query("SELECT urlImage FROM image, recette WHERE recette.idImage = image.idImage AND idRecette = '".$ligne->idRecette."'")->fetch(PDO::FETCH_OBJ);
                $thumbnail = '<a href="recette.php?idrecette='.$ligne->idRecette.'">';
                $image= $base->query("SELECT urlImage FROM image WHERE idImage='".$ligne->idImage."'")->fetch(PDO::FETCH_OBJ);
                $image->urlImage = str_replace("_p", "_g", $image->urlImage);
                $thumbnail .= '<img src="'.$image->urlImage.'" alt="'.$ligne->nomRecette.'"></a>';
                $thumbnail .= '<p>'.$ligne->recetteRecette.'</p>';
                $thumbnail .= '<p>'.$ligne->descriptionRecette.'</p>';
                echo $thumbnail;
                ?>
        </article>
        <aside>
            <?php
            $ligne= $base->query("SELECT * FROM article ORDER BY dateArticle DESC LIMIT 1")->fetch(PDO::FETCH_OBJ);
            $thumbnail = '<h2>Dernier article : &nbsp;&nbsp;'.$ligne->titreArticle.'</h2>';
            $thumbnail .= '<ul><li>Date: '.$ligne->dateArticle.'</li>';
            $thumbnail .= '<li>Notre article: </li>';
            $thumbnail .= '<li>'.$ligne->contenuArticle.'</li></ul>';
            echo $thumbnail;
      ?>
        </aside>
    </section>
    
    <!-- <div><a href="../admin/login.php">Se connecter</a></div> -->

    <?php
  include('footer.html');
  ?>