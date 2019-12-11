<?php
    include('header.html');
    $base = connect();
    $recette= $base->query("SELECT * FROM recette WHERE idRecette='".$_GET['idrecette']."'")->fetch(PDO::FETCH_OBJ);
    $requete = $base->query("SELECT ingredient.nomIngredient FROM recette, ingredientrecette, ingredient 
    WHERE recette.idRecette = ingredientrecette.idRecette 
    AND ingredientrecette.idIngredient = ingredient.idIngredient
    AND ingredientrecette.idRecette = '" .$recette->idRecette."'
    ORDER BY nomIngredient");
    $image= $base->query("SELECT urlImage FROM image WHERE idImage='".$recette->idImage."'")->fetch(PDO::FETCH_OBJ);
    $image->urlImage = str_replace("_p", "_g", $image->urlImage);
?>

<section id="ficheRecette">
    <h1><?php if(isset($recette)){ echo $recette->nomRecette; }?></h1>
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
        <div class="row">
            <div class="col-md-6">
                <h2>Les ingrédients :</h2>
                <?php while($ingredient = $requete->fetch(PDO::FETCH_OBJ)){
                    echo '<li>'.$ingredient->nomIngredient.'</li>';
                }?>
            </div>
            <div class="col-md-6">
                <h2>La recette :</h2>
                <p mt-2><?php if(isset($recette)){ echo $recette->recetteRecette; }?></p>
            </div>
        </div>
    </article>
</section>
<?php include('footer.html'); ?>