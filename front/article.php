<?php 
    include('header.html');
    $base = connect();
    $article= $base->query("SELECT * FROM article WHERE idArticle='".$_GET['idArticle']."'")->fetch(PDO::FETCH_OBJ);
    $image= $base->query("SELECT urlImage FROM image, recette WHERE recette.idImage = image.idImage AND idRecette = '".$article->idRecette."'")->fetch(PDO::FETCH_OBJ);
    $image->urlImage = str_replace("_p", "_g", $image->urlImage);
    $auteur=$base->query("SELECT nomMembre FROM membre WHERE idMembre='".$article->idMembre."'")->fetch(PDO::FETCH_OBJ);
    $recette=$base->query("SELECT nomRecette FROM recette WHERE idRecette='".$article->idRecette."'")->fetch(PDO::FETCH_OBJ);
?>

<section id="ficheArticle">
    <h1><?php if(isset($article)){ echo $article->titreArticle; }?></h1>
    <article class="container">
        <div class="row">
        <figure class="col-md-8">
                <img src="<?php if(isset($image)){ echo $image->urlImage ;} ?>" alt="<?php if(isset($article)){ echo $article->titreArticle; }?>">
            </figure>
            <div class="col">
                <ul>
                    <li>Auteur de l'article: <?php if(isset($article)){ echo $auteur->nomMembre; }?></li>
                    <li>Date de publication: <?php if(isset($article)){ echo $article->dateArticle; }?></li>
                    <li>Recette: <?php if(isset($article)){ echo $recette->nomRecette; }?></li>
                </ul>
            </div>
            <div>
                <!-- <h2><?php //if(isset($article)){ echo $article->titreArticle; }?></h2> -->
                <p><?php if(isset($article)){ echo $article->contenuArticle; }?></p>
            </div>
        </div>
    </article>
</section>
<?php include('footer.html'); ?>