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

  //==============
  function afficher_produits(){
    $connexion=connexion();
    $requete="SELECT * FROM produits ORDER BY nom_produit";
    $resultat=mysqli_query($connexion, $requete);
    
    $liste="<table id=\"liste\">\n";
    $liste.="<tr>";
    $liste.="<th>Nom du produit</th>";
    $liste.="<th>Description</th>";
    $liste.="<th>Prix</th>";
    $liste.="<th>Aperçu</th>";
    $liste.="<th>Actions</th>";
    $liste.="</tr>";
    
    while($ligne=mysqli_fetch_object($resultat)){
      $liste.="<tr>";
      $liste.="<td>" . $ligne->nom_produit . "</td>";
      $liste.="<td>" . $ligne->description_produit . "</td>";
      $liste.="<td>" . $ligne->prix_produit . "</td>";
      $liste.="<td><img src=\"" . $ligne->photo_produit . "\"alt=\"". $ligne->nom_produit . "\" /></td>";
      $liste.="<td><a href=\"admin.php?action=produit&cas=modifier&id_produit=".$ligne->id_produit."\">modifier</a>&nbsp;
      &nbsp;<a href=\"admin.php?action=produit&cas=supprimer&id_produit=".$ligne->id_produit."\">supprimer</a></td>";
      $liste.="</tr>";
    }
    
    $liste.="</table>\n";
    mysqli_close($connexion);
    return $liste;
  }

?>