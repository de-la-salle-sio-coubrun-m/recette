<?php
    include('header.html');
    $base = connect();
    $recette= $base->query("SELECT * FROM recette WHERE idRecette='".$_GET['idrecette']."'")->fetch(PDO::FETCH_OBJ);
    $image= $base->query("SELECT urlImage FROM image WHERE idImage='".$recette->idImage."'")->fetch(PDO::FETCH_OBJ);
    $image->urlImage = str_replace("_p", "_g", $image->urlImage);
?>

<section id="ficheRecette">
    <h2><?php if(isset($recette)){ echo $recette->nomRecette; }?></h2>
    <article class="container">
        <div class="row">
            <figure class="col-md-8">
                <img src="<?php if(isset($image)){ echo $image->urlImage ;} ?>" alt="<?php if(isset($recette)){ echo $recette->nomRecette; }?>">
            </figure>
            <div class="col">
                <ul>
                    <li>Effets de la recette: <?php if(isset($recette)){ echo $recette->effetsRecette; }?></li>
                    <li>Durée de la préparation: <?php if(isset($recette)){ echo $recette->dureePreparation; }?></li>
                    <li>Durée de la cuisson: <?php if(isset($recette)){ echo $recette->dureeCuisson; }?></li>
                    <li>Description de la recette: <?php if(isset($recette)){ echo $recette->descriptionRecette; }?></li>
                </ul>
            </div>
        </div>
        <div class="col-md-12">
            <h3>La recette :</h3>
            <p><?php if(isset($recette)){ echo $recette->recetteRecette; }?></p>
        </div>
    </article>
</section>
<?php include('footer.html'); ?>