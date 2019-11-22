<?php
	
//================================
function security($chaine){
	$connexion=connexion();
	$security=addcslashes(mysqli_real_escape_string($connexion,$chaine), "%_");
	mysqli_close($connexion);
	return $security;
}

//===========================pour se loguer=======================================================
function login($login,$password,$target)
{	
if(isset($target))
	{
	$connexion=connexion("mysqli");
	$login=security($login);
	$password=security($password);
	switch($target)
		{
		case "admin":
		$requete="SELECT * FROM comptes WHERE login= '" . $login . "' AND pass=PASSWORD('" . $password . "')";
		$resultat=mysqli_query($connexion, $requete) or die(mysqli_connect_error());
		$nb=mysqli_num_rows($resultat);
		
		if($nb==0)
		  {
		  return false;
		  }
		else
		  { 
			$ligne=mysqli_fetch_object($resultat);

			$_SESSION['id_acces']=$ligne->id_compte;
			$_SESSION['statut']=$ligne->statut;
			$_SESSION['prenom']=$ligne->prenom;    
			$_SESSION['nom']=$ligne->nom;
			$_SESSION['retour_bo']="<a id=\"retour_bo\" href=\"../admin/admin.php?module=intro\"><span class=\"dashicons dashicons-arrow-left-alt\"></span></a>\n";
			$_SESSION['connexion']=date('Y-m-d H:i:s');
			if($ligne->fichier_compte=="")
			  {
			  $_SESSION['photo_connecte']="<img id=\"image_connect\" src=\"../icones/icon_compte.png\" alt=\"\" />\n";        
			  }
			else
			  {
			  $_SESSION['photo_connecte']="<img id=\"image_connect\" src=\"../medias/profil" . $ligne->id_compte . "." . $ligne->fichier_compte . "\" alt=\"\" />\n";            
			  }

			header("Location:../admin/admin.php?module=intro");    
			return true;
		  }		
		break;	
		}
	mysqli_close($connexion); 	
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

function connexion()
{
  require_once("connect.php");
  //avec numéro de port
  //$connexion = mysqli_connect(SERVEUR,LOGIN,PASSE,BASE,PORT) or die("Error " . mysqli_error($connexion));
 
   //sans numéro de port
  $connexion = mysqli_connect(SERVEUR,LOGIN,PASSE,BASE) or die("Error " . mysqli_error($connexion));

  return $connexion;
}

//===============================================

 function envoi_mel($destinataire,$sujet,$message_txt, $message_html,$expediteur)
  {
  if (!preg_match("#^[a-z0-9._-]+@(hotmail|live|msn).[a-z]{2,4}$#", $destinataire)) // On filtre les serveurs qui rencontrent des bogues.
    {
  	$passage_ligne = "\r\n";
    }
  else
    {
  	$passage_ligne = "\n";
    }
   
  //=====Création de la boundary
  $boundary = "-----=" . md5(rand());
  //==========
   
  //=====Création du header de l'email
  $header = "From: \"" . $_SESSION['expediteur'] . "\"<" . $expediteur . ">" . $passage_ligne;
  $header.= "Reply-to: \"" . $_SESSION['expediteur'] . "\" <" . $expediteur . ">" . $passage_ligne;
  $header.= "MIME-Version: 1.0" . $passage_ligne;
  $header.= "X-Priority: 3" . $passage_ligne;//1 : max et 5 : min
  $header.= "Content-Type: multipart/alternative;" . $passage_ligne . " boundary=\"" . $boundary . "\"" . $passage_ligne;
  //==========
   
  //=====Création du message
  $message = $passage_ligne . "--" . $boundary. $passage_ligne;
  //=====Ajout du message au format texte
  $message.= "Content-Type: text/plain; charset=\"UTF-8\"" . $passage_ligne;
  $message.= "Content-Transfer-Encoding: 8bit" . $passage_ligne;
  $message.= $passage_ligne . $message_txt . $passage_ligne;
  //==========
  $message.= $passage_ligne . "--" . $boundary . $passage_ligne;
  //=====Ajout du message au format HTML
  $message.= "Content-Type: text/html; charset=\"UTF-8\"" . $passage_ligne;
  $message.= "Content-Transfer-Encoding: 8bit" . $passage_ligne;
  $message.= $passage_ligne . $message_html . $passage_ligne;
  //==========
  $message.= $passage_ligne . "--" . $boundary."--" . $passage_ligne;
  $message.= $passage_ligne . "--" . $boundary."--" . $passage_ligne;
  //==========
   
  //=====Envoi de l'email
  mail($destinataire,$sujet,$message,$header);  
  }    

  //============== affichage listes
  function afficher_recettes(){
    $connexion=connexion();
    $requete="SELECT * FROM recette ORDER BY nomRecette";
    $resultat=mysqli_query($connexion, $requete);
    
    $liste="<table id=\"liste\">\n";
    $liste.="<tr>";
    $liste.="<th>Origine de la recette</th>";
    $liste.="<th>Nom de la recette</th>";
    $liste.="<th>Description</th>";
    $liste.="<th>Durée de cuisson</th>";
    $liste.="<th>Durée de préparation</th>";
    $liste.="<th>La recette</th>";
    $liste.="<th>Les effets de la recette</th>";
    $liste.="<th>La catégorie</th>";
    $liste.="<th>Aperçu</th>";
    $liste.="<th>Actions</th>";
    $liste.="</tr>";
    
    while($ligne=mysqli_fetch_object($resultat)){
      $liste.="<tr>";
      $liste.="<td>" . utf8_decode(utf8_encode($ligne->idOrigine)) . "</td>";
      $liste.="<td>" . utf8_decode(utf8_encode($ligne->nomRecette)) . "</td>";
      $liste.="<td>" . utf8_decode(utf8_encode($ligne->descriptionRecette)) . "</td>";
      $liste.="<td>" . utf8_decode(utf8_encode($ligne->dureeCuisson)) . "</td>";
      $liste.="<td>" . utf8_decode(utf8_encode($ligne->dureePreparation)) . "</td>";
      $liste.="<td>" . utf8_decode(utf8_encode($ligne->recetteRecette)) . "</td>";
      $liste.="<td>" . utf8_decode(utf8_encode($ligne->effetsRecette)) . "</td>";
      $liste.="<td>" . utf8_decode(utf8_encode($ligne->idCategorie)) . "</td>";
      $liste.="<td><img src=\"" . $ligne->idImage . "\"alt=\"". $ligne->nomRecette . "\" /></td>";
      $liste.="<td><a href=\"admin.php?action=recette&cas=modifier&idRecette=".$ligne->idRecette."\">modifier</a>&nbsp;
      <a href=\"admin.php?action=recette&cas=supprimer&idRecette=".$ligne->idRecette."\">supprimer</a>&nbsp;</td>";
      $liste.="</tr>";
    }
    
    $liste.="</table>\n";
    mysqli_close($connexion);
    return $liste;
  }

  //============== affichage articles
  function afficher_articles(){
    $connexion=connexion();
    $requete="SELECT * FROM article ORDER BY titreArticle";
    $resultat=mysqli_query($connexion, $requete);
    
    $liste="<table id=\"liste\">\n";
    $liste.="<tr>";
    $liste.="<th>Titre de l'article</th>";
    $liste.="<th>Contenu de l'article</th>";
    $liste.="<th>Date de l'article</th>";
    $liste.="<th>Auteur</th>";
    $liste.="<th>Recette de l'article</th>";
    $liste.="<th>Actions</th>";
    $liste.="</tr>";
    
    while($ligne=mysqli_fetch_object($resultat)){
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
    mysqli_close($connexion);
    return $liste;
  }

//============== affichage images
function afficher_images(){
  $connexion=connexion();
  $requete="SELECT * FROM image ORDER BY nomImage";
  $resultat=mysqli_query($connexion, $requete);
  
  $liste="<table id=\"liste\">\n";
  $liste.="<tr>";
  $liste.="<th>Nom de l'image</th>";
  $liste.="<th>URL de l'image</th>";
  $liste.="<th>Actions</th>";
  $liste.="</tr>";
  
  while($ligne=mysqli_fetch_object($resultat)){
    $liste.="<tr>";
    $liste.="<td>" . $ligne->nomImage . "</td>";
    $liste.="<td>" . $ligne->urlImage . "</td>";
    $liste.="<td><a href=\"admin.php?action=image&cas=modifier&idImage=".$ligne->idImage."\">modifier</a>&nbsp;
    <a href=\"admin.php?action=image&cas=supprimer&idImage=".$ligne->idImage."\">supprimer</a>&nbsp;</td>";
    $liste.="</tr>";
  }
  
  $liste.="</table>\n";
  mysqli_close($connexion);
  return $liste;
}

//============== affichage ingrédients
function afficher_Ingredient(){
  $connexion=connexion();
  $requete="SELECT * FROM ingredient ORDER BY nomIngredient";
  $resultat=mysqli_query($connexion, $requete);
  
  $liste="<table id=\"liste\">\n";
  $liste.="<tr>";
  $liste.="<th>Nom de l'ingrédient</th>";
  $liste.="<th>Méthode de récolte de l'ingrédient</th>";
  $liste.="<th>Lieu où trouver l'ingrédient</th>";
  $liste.="<th>Actions</th>";
  $liste.="</tr>";
  
  while($ligne=mysqli_fetch_object($resultat)){
    $liste.="<tr>";
    $liste.="<td>" . $ligne->nomIngredient . "</td>";
    $liste.="<td>" . $ligne->recolteIngredient . "</td>";
    $liste.="<td>" . $ligne->lieuIngredient . "</td>";
    $liste.="<td><a href=\"admin.php?action=ingredient&cas=modifier&idIngredient=".$ligne->idIngredient."\">modifier</a>&nbsp;
    <a href=\"admin.php?action=ingredient&cas=supprimer&idIngredient=".$ligne->idIngredient."\">supprimer</a>&nbsp;</td>";
    $liste.="</tr>";
  }
  
  $liste.="</table>\n";
  mysqli_close($connexion);
  return $liste;
}

//============== affichage membres
function afficher_membres(){
  $connexion=connexion();
  $requete="SELECT * FROM membre ORDER BY nomMembre";
  $resultat=mysqli_query($connexion, $requete);
  
  $liste="<table id=\"liste\">\n";
  $liste.="<tr>";
  $liste.="<th>Nom du membre</th>";
  $liste.="<th>Mdp du membre</th>";
  $liste.="<th>Privilèges du membre</th>";
  $liste.="<th>Actions</th>";
  $liste.="</tr>";
  
  while($ligne=mysqli_fetch_object($resultat)){
    $liste.="<tr>";
    $liste.="<td>" . $ligne->nomMembre . "</td>";
    $liste.="<td>" . $ligne->mdpMembre . "</td>";
    $liste.="<td>" . $ligne->idPrivilege . "</td>";
    $liste.="<td><a href=\"admin.php?action=membre&cas=modifier&idMembre=".$ligne->idMembre."\">modifier</a>&nbsp;
    <a href=\"admin.php?action=membre&cas=supprimer&idMembre=".$ligne->idMembre."\">supprimer</a>&nbsp;</td>";
    $liste.="</tr>";
  }
  
  $liste.="</table>\n";
  mysqli_close($connexion);
  return $liste;
}

//============== affichage catégories
function afficher_categories(){
  $connexion=connexion();
  $requete="SELECT * FROM categorie ORDER BY nomCategorie";
  $resultat=mysqli_query($connexion, $requete);
  
  $liste="<table id=\"liste\">\n";
  $liste.="<tr>";
  $liste.="<th>identifiant de la catégorie</th>";
  $liste.="<th>Nom de la catégorie</th>";
  $liste.="<th>Actions</th>";
  $liste.="</tr>";
  
  while($ligne=mysqli_fetch_object($resultat)){
    $liste.="<tr>";
    $liste.="<td>" . $ligne->idCategorie . "</td>";
    $liste.="<td>" . $ligne->nomCategorie . "</td>";
    $liste.="<td><a href=\"admin.php?action=categorie&cas=modifier&idCategorie=".$ligne->idCategorie."\">modifier</a>&nbsp;
    <a href=\"admin.php?action=categorie&cas=supprimer&idCategorie=".$ligne->idCategorie."\">supprimer</a>&nbsp;</td>";
    $liste.="</tr>";
  }
  
  $liste.="</table>\n";
  mysqli_close($connexion);
  return $liste;
}

//============== affichage catégories
function afficher_ingredientrecette(){
  $connexion=connexion();
  $requete="SELECT nomRecette, nomIngredient, idRecette, idIngredient FROM recette, ingredient, ingredientrecette WHERE recette.idRecette = ingredientrecette.idRecette AND ingredientrecette.idIngredient = ingredient.idIngredient ORDER BY nomRecette";
  $resultat=mysqli_query($connexion, $requete);
  
  $liste="<table id=\"liste\">\n";
  $liste.="<tr>";
  $liste.="<th>id de la recette</th>";
  $liste.="<th>id de l'ingrédient</th>";
  $liste.="<th>Nom de la recette</th>";
  $liste.="<th>Nom de l'ingrédient</th>";
  $liste.="<th>Actions</th>";
  $liste.="</tr>";
  
  while($ligne=mysqli_fetch_object($resultat)){
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
  mysqli_close($connexion);
  return $liste;
}

?>