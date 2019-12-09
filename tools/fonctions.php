<?php

//================================
function security($chaine){ // ne devrait pas être appelée depuis le passage en PDO
	 $base = connect();
	$security=addcslashes(mysqli_real_escape_string($base,$chaine), "%_");
	mysqli_close($base);
	return $security;
}

//===========================pour se loguer=======================================================
function login($login,$password)
{
  $connexion=connect();
  $requete="SELECT * FROM membre WHERE nomMembre= '" . $login."'";
  
  $query=$connexion->prepare($requete);
  $query->execute();
  $ligne=$query->fetch(PDO::FETCH_OBJ);
  
  if(password_verify($password, $ligne->mdpMembre))
  {
    $_SESSION['idMembre']=$ligne->idMembre;
    $_SESSION['idPrivilege']=$ligne->idPrivilege;
    $_SESSION['nomMembre']=$ligne->nomMembre;    
    $ligne->idMembre."id-membre<br>";
    if($ligne->idPrivilege == 1 || $ligne->idPrivilege == 2){
      header("Location:../admin/admin.php");
    }
    else {
      header("Location:../front/index.php");
    }
  } else {
    return '<label class="error">Les identifiants ne sont pas corrects !</label>';
  }
}

// ====détecter l'extension du fichier================
function fichier_type($uploadedFile)
{
$tabType = explode(".", $uploadedFile);
$nb=sizeof($tabType)-1;
$typeFichier=$tabType[$nb];
 if($typeFichier == "jpeg")
   {
   $typeFichier = "jpg";
   }
$extension=strtolower($typeFichier);
return $extension;
}

//============================================
function redimage($img_src,$img_dest,$dst_w,$dst_h,$quality)
{
if(!isset($quality))
	{
	$quality=100;
	}
   $extension=fichier_type($img_src);

   // Lit les dimensions de l'image
   $size = @GetImageSize($img_src);
   $src_w = $size[0];
   $src_h = $size[1];
   // Crée une image vierge aux bonnes dimensions   truecolor
   $dst_im = @ImageCreatetruecolor($dst_w,$dst_h);
   imagealphablending($dst_im, false);
   imagesavealpha($dst_im, true);      
    
   // Copie dedans l'image initiale redimensionnée  
   
   if($extension=="jpg")
     {
     $src_im = @ImageCreateFromJpeg($img_src);
     imagecopyresampled($dst_im,$src_im,0,0,0,0,$dst_w,$dst_h,$src_w,$src_h);
    
     // Sauve la nouvelle image
     @ImageJpeg($dst_im,$img_dest,$quality);     
     }
   if($extension=="png")
     {
     $src_im = @ImageCreateFromPng($img_src);    
     imagecopyresampled($dst_im,$src_im,0,0,0,0,$dst_w,$dst_h,$src_w,$src_h);     
     
     // Sauve la nouvelle image
     @ImagePng($dst_im,$img_dest,0);     
     }     
   if($extension=="gif")
     {
     $src_im = @ImageCreateFromGif($img_src);
     imagecopyresampled($dst_im,$src_im,0,0,0,0,$dst_w,$dst_h,$src_w,$src_h);
     
     // Sauve la nouvelle image
     @ImagePng($dst_im,$img_dest,0);     
     }

   // Détruis les tampons
   @ImageDestroy($dst_im);
   @ImageDestroy($src_im);
}

//===============================
// la fonction connecter() permet de choisir une
// base de données et de s'y connecter.

function connect () {
  try {      
      $base = new PDO('mysql:host=localhost;dbname=recette;charset=utf8', 'root', '');

  } catch(exception $error){

      die( 'error' .$error->getMessage());
  }
  return $base;
} 

  //============== affichage listes
  function afficher_recettes(){
     $base = connect();
    $requete= $base->query("SELECT * 
    FROM recette, image,origine, categorie
    WHERE  recette.idOrigine = origine.idOrigine 
    AND recette.idCategorie = categorie.idCategorie 
    AND recette.idImage = image.idImage 
    ORDER BY nomRecette");
    
    
    
    $liste="<table id=\"liste\">\n";
    $liste.="<tr>";
    $liste.="<th>Identifiant de la recette</th>";
    $liste.="<th>Origine de la recette</th>";
    $liste.="<th>Nom de la recette</th>";
    $liste.="<th>Description</th>";
    $liste.="<th>Durée de cuisson</th>";
    $liste.="<th>Durée de préparation</th>";
    $liste.="<th>La recette</th>";
    $liste.="<th>Les effets de la recette</th>";
    $liste.="<th>La catégorie</th>";
    $liste.="<th> les ingrédients";
    $liste .="<hr >";
    $liste.="<li>Les noms ingrédients</li>";
    $liste .="<hr >";
    $liste.="<li>Les identifiants ingrédients</li>";
    $liste .="<hr >";
    $liste.="</th>";
    $liste.="<th>Aperçu</th>";
    $liste.="<th>Actions</th>";
    $liste.="</tr>";
    
   while($ligne= $requete->fetch(PDO::FETCH_OBJ)){
     
      $liste.="<tr>";
      $liste.="<td>" . utf8_decode(utf8_encode($ligne->idRecette)) . "</td>";
      $liste.="<td>" . utf8_decode(utf8_encode($ligne->nomOrigine)) . "</td>";
      $liste.="<td>" . utf8_decode(utf8_encode($ligne->nomRecette)) . "</td>";
      $liste.="<td>" . utf8_decode(utf8_encode($ligne->descriptionRecette)) . "</td>";
      $liste.="<td>" . utf8_decode(utf8_encode($ligne->dureeCuisson)) . "</td>";
      $liste.="<td>" . utf8_decode(utf8_encode($ligne->dureePreparation)) . "</td>";
      $liste.="<td>" . utf8_decode(utf8_encode($ligne->recetteRecette)) . "</td>";
      $liste.="<td>" . utf8_decode(utf8_encode($ligne->effetsRecette)) . "</td>";
      $liste.="<td>" . utf8_decode(utf8_encode($ligne->nomCategorie)) . "</td>";
      $liste.="<td>";
      $requete2= $base->query("SELECT ingredient.idIngredient, ingredient.nomIngredient
    FROM recette,ingredientrecette, ingredient 
    WHERE recette.idRecette = ingredientrecette.idRecette 
    AND ingredientrecette.idIngredient = ingredient.idIngredient
    AND ingredientrecette.idRecette = '" .$ligne->idRecette."'
    ORDER BY nomIngredient");
      while($ligne2 = $requete2->fetch(PDO::FETCH_OBJ)){
        $liste.="<li>" . utf8_decode(utf8_encode($ligne2->nomIngredient)) . "</li>";
        $liste.="<li>" . utf8_decode(utf8_encode($ligne2->idIngredient)) . "</li>";
        $liste .="<hr >";
      }
      $liste.="</td>";
      $liste.="<td><img src=\"" . $ligne->urlImage . "\"alt=\"". $ligne->nomRecette . "\" /></td>";
      $liste.="<td><a href=\"admin.php?action=recette&cas=modifier&idRecette=".$ligne->idRecette."\">modifier</a>&nbsp;
      <a href=\"admin.php?action=recette&cas=supprimer&idRecette=".$ligne->idRecette."\">supprimer</a>&nbsp;</td>";
      $liste.="</tr>";
    }
    
    $liste.="</table>\n";
    return $liste;
  }

  //============== affichage articles
  function afficher_articles(){
     $base = connect();
    $requete= $base->query("SELECT * FROM article ORDER BY titreArticle");
    
    
    $liste="<table id=\"liste\">\n";
    $liste.="<tr>";
    $liste.="<th>Titre de l'article</th>";
    $liste.="<th>Contenu de l'article</th>";
    $liste.="<th>Date de l'article</th>";
    $liste.="<th>Auteur</th>";
    $liste.="<th>Recette de l'article</th>";
    $liste.="<th>Actions</th>";
    $liste.="</tr>";
    
   while($ligne= $requete->fetch(PDO::FETCH_OBJ)){
      $liste.="<tr>";
      $liste.="<td>" . $ligne->titreArticle . "</td>";
      $liste.="<td>" . $ligne->contenuArticle . "</td>";
      $liste.="<td>" . $ligne->dateArticle . "</td>";
      $liste.="<td>" . $ligne->idMembre . "</td>";
      $liste.="<td>" . $ligne->idRecette . "</td>";
      $liste.="<td><a href=\"admin.php?action=article&cas=modifier&idArticle=".$ligne->idArticle."\">modifier</a>&nbsp;
      <a href=\"admin.php?action=article&cas=supprimer&idArticle=".$ligne->idArticle."\">supprimer</a>&nbsp;</td>";
      $liste.="</tr>";
    }
    
    $liste.="</table>\n";
    
    return $liste;
  }

//============== affichage images
function afficher_images(){
   $base = connect();
  $requete= $base->query("SELECT * FROM image ORDER BY nomImage");
  
  $liste="<table id=\"liste\">\n";
  $liste.="<tr>";
  $liste.="<th>Nom de l'image</th>";
  $liste.="<th>URL de l'image</th>";
  $liste.="<th>Image </th>";
  $liste.="<th>Actions</th>";
  $liste.="</tr>";
  
 while($ligne= $requete->fetch(PDO::FETCH_OBJ)){
    $liste.="<tr>";
    $liste.="<td>" . $ligne->nomImage . "</td>";
    $liste.="<td>" . $ligne->urlImage . "</td>";
    $liste.='<td><img src="'.$ligne->urlImage.'"alt="'.$ligne->nomImage.'" /></td>';
    $liste.="<td><a href=\"admin.php?action=image&cas=modifier&idImage=".$ligne->idImage."\">modifier</a>&nbsp;
    <a href=\"admin.php?action=image&cas=supprimer&idImage=".$ligne->idImage."\">supprimer</a>&nbsp;</td>";
    $liste.="</tr>";
  }
  
  $liste.="</table>\n";
  
  return $liste;
}

//============== affichage ingrédients
function afficher_Ingredient(){
  $base = connect();
  $requete= $base->query("SELECT * FROM ingredient ORDER BY nomIngredient");
  
  $liste="<table id=\"liste\">\n";
  $liste.="<tr>";
  $liste.="<th>Nom de l'ingrédient</th>";
  $liste.="<th>Méthode de récolte de l'ingrédient</th>";
  $liste.="<th>Lieu où trouver l'ingrédient</th>";
  $liste.="<th>Actions</th>";
  $liste.="</tr>";
  
  while($ligne= $requete->fetch(PDO::FETCH_OBJ)){
    $liste.="<tr>";
    $liste.="<td>" . $ligne->nomIngredient . "</td>";
    $liste.="<td>" . $ligne->recolteIngredient . "</td>";
    $liste.="<td>" . $ligne->lieuIngredient . "</td>";
    $liste.="<td><a href=\"admin.php?action=ingredient&cas=modifier&idIngredient=".$ligne->idIngredient."\">modifier</a>&nbsp;
    <a href=\"admin.php?action=ingredient&cas=supprimer&idIngredient=".$ligne->idIngredient."\">supprimer</a>&nbsp;</td>";
    $liste.="</tr>";
  }
  
  $liste.="</table>\n";
  return $liste;
}

//============== affichage membres
function afficher_membres(){
  $base = connect();
  $requete= $base->query("SELECT * FROM membre ORDER BY nomMembre");
  
  
  $liste="<table id=\"liste\">\n";
  $liste.="<tr>";
  $liste.="<th>Nom du membre</th>";
  $liste.="<th>Mdp du membre</th>";
  $liste.="<th>Privilèges du membre</th>";
  $liste.="<th>Actions</th>";
  $liste.="</tr>";
  
 while($ligne= $requete->fetch(PDO::FETCH_OBJ)){
    $liste.="<tr>";
    $liste.="<td>" . $ligne->nomMembre . "</td>";
    $liste.="<td>" . $ligne->mdpMembre . "</td>";
    $liste.="<td>" . $ligne->idPrivilege . "</td>";
    $liste.="<td><a href=\"admin.php?action=membre&cas=modifier&idMembre=".$ligne->idMembre."\">modifier</a>&nbsp;
    <a href=\"admin.php?action=membre&cas=supprimer&idMembre=".$ligne->idMembre."\">supprimer</a>&nbsp;</td>";
    $liste.="</tr>";
  }
  
  $liste.="</table>\n";
  
  return $liste;
}

//============== affichage catégories
function afficher_categories(){
   $base = connect();
  $requete= $base->query("SELECT * FROM categorie ORDER BY nomCategorie");
  
  
  $liste="<table id=\"liste\">\n";
  $liste.="<tr>";
  $liste.="<th>identifiant de la catégorie</th>";
  $liste.="<th>Nom de la catégorie</th>";
  $liste.="<th>Actions</th>";
  $liste.="</tr>";
  
 while($ligne= $requete->fetch(PDO::FETCH_OBJ)){
    $liste.="<tr>";
    $liste.="<td>" . $ligne->idCategorie . "</td>";
    $liste.="<td>" . $ligne->nomCategorie . "</td>";
    $liste.="<td><a href=\"admin.php?action=categorie&cas=modifier&idCategorie=".$ligne->idCategorie."\">modifier</a>&nbsp;
    <a href=\"admin.php?action=categorie&cas=supprimer&idCategorie=".$ligne->idCategorie."\">supprimer</a>&nbsp;</td>";
    $liste.="</tr>";
  }
  
  $liste.="</table>\n";
  
  return $liste;
}

//============== affichage catégories
function afficher_ingredientrecette(){
   $base = connect();
  $requete = "SELECT nomRecette, nomIngredient, recette.idRecette, ingredient.idIngredient FROM recette, ingredient, ingredientrecette WHERE recette.idRecette = ingredientrecette.idRecette AND ingredientrecette.idIngredient = ingredient.idIngredient ORDER BY nomRecette";
  $resultat=$base->prepare($requete);
	$resultat->execute();
    
  $liste="<table id=\"liste\">\n";
  $liste.="<tr>";
  $liste.="<th>id de la recette</th>";
  $liste.="<th>id de l'ingrédient</th>";
  $liste.="<th>Nom de la recette</th>";
  $liste.="<th>Nom de l'ingrédient</th>";
  $liste.="<th>Actions</th>";
  $liste.="</tr>";
  
 while($ligne= $resultat->fetch(PDO::FETCH_OBJ)){
    $liste.="<tr>";
    $liste.="<td>" . $ligne->idRecette . "</td>";
    $liste.="<td>" . $ligne->idIngredient . "</td>";
    $liste.="<td>" . $ligne->nomRecette . "</td>";
    $liste.="<td>" . $ligne->nomIngredient . "</td>";
    $liste.="<td><a href=\"admin.php?action=ingredientRecette&cas=modifier&idRecette=".$ligne->idRecette."&idIngredient=".$ligne->idIngredient."\">modifier</a>&nbsp;
    <a href=\"admin.php?action=ingredientRecette&cas=supprimer&idRecette=".$ligne->idRecette."&idIngredient=".$ligne->idIngredient."\">supprimer</a>&nbsp;</td>";
    $liste.="</tr>";
  }
  
  $liste.="</table>\n";
  return $liste;
}

function afficher_origines(){
  $base = connect();
  $requete= $base->query("SELECT * FROM origine ORDER BY nomOrigine");
  
  
  $liste="<table id=\"liste\">\n";
  $liste.="<tr>";
  $liste.="<th>Nom de l'origine</th>";
  $liste.="<th>Description de l'origine</th>";
  $liste.="<th>Actions</th>";
  $liste.="</tr>";
  
 while($ligne= $requete->fetch(PDO::FETCH_OBJ)){
    $liste.="<tr>";
    $liste.="<td>" . $ligne->nomOrigine . "</td>";
    $liste.="<td>" . $ligne->descriptionOrigine . "</td>";
    $liste.="<td><a href=\"admin.php?action=origine&cas=modifier&idOrigine=".$ligne->idOrigine."\">modifier</a>&nbsp;
    <a href=\"admin.php?action=origine&cas=supprimer&idOrigine=".$ligne->idOrigine."\">supprimer</a>&nbsp;</td>";
    $liste.="</tr>";
  }
  
  $liste.="</table>\n";
  
  return $liste;
}

// ?>