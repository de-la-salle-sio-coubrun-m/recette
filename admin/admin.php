<?php
session_start();
include "../tools/fonctions.php";
include "security.php";
$base = connect();
$action_form="ajouter";

if(isset($_SESSION['idMembre']) &&  $_SESSION['idPrivilege'] == '1')
{
	
	require_once("../tools/fonctions.php");
	$base = connect();
	$action_form="ajouter";

	if(isset($_GET['action'])){
		switch ($_GET["action"]){
			case "déconnecter":
				# code...
			break; // fin case déconnecter
			
			case "recette":

				//contenu à afficher
				include('auto_complete.php');

				if(isset($_GET["cas"])){
					switch ($_GET["cas"]) {


						case "ajouter":
							
							$action_form="ajouter";
							//si le bouton créer a été activé
							if(isset($_POST['submit'])){
								if(empty($_POST['idOrigine']))
								{
									$message="<label id =\"warning\">veuillez entrer l'id de l'origine de la recette s'il-vous-plaît</label>";
								}
								elseif(empty($_POST['nomRecette']))
								{
									$message="<label id =\"warning\">veuillez entrer le nom de la recette s'il-vous-plaît</label>";
								}
								elseif(empty($_POST['descriptionRecette']))
								{
									$message="<label id =\"warning\">veuillez entrer la description de la recette s'il-vous-plaît</label>";
								}
								elseif(empty($_POST['dureeCuisson']))
								{
									$message="<label id =\"warning\">veuillez entrer la durée de cuisson de la recette s'il-vous-plaît</label>";
								}
								elseif(empty($_POST['dureePreparation']))
								{
									$message="<label id =\"warning\">veuillez entrer la durée préparation de la recette s'il-vous-plaît</label>";
								}
								elseif(empty($_POST['recetteRecette']))
								{
									$message="<label id =\"warning\">veuillez entrer la recette s'il-vous-plaît</label>";
								}
								elseif(empty($_POST['effetsRecette']))
								{
									$message="<label id =\"warning\">veuillez entrer les effets de la recette s'il-vous-plaît</label>";
								}
								elseif(empty($_POST['idCategorie']))
								{
									$message="<label id =\"warning\">veuillez entrer l'identifiant de la catégorie de la recette s'il-vous-plaît</label>";
								}
								else
								{
									//on insert dans la table recette les valeurs des champs nom et description
									//addslashes permet de mettre des \ en cas de  '  .
									$requete="  INSERT INTO recette 
									SET idOrigine='".addslashes($_POST['idOrigine'])."', nomRecette='".addslashes($_POST['nomRecette'])."', descriptionRecette='".addslashes($_POST['descriptionRecette'])."',dureeCuisson='".($_POST['dureeCuisson'])."', dureePreparation='".($_POST['dureePreparation'])."', recetteRecette='".addslashes($_POST['recetteRecette'])."', effetsRecette='".addslashes($_POST['effetsRecette'])."', idCategorie='".($_POST['idCategorie'])."', idImage='".($_POST['idImage'])."'";
									echo $requete;
									//execution de la requete dans la BDD
									// $resultat=mysqli_query($base,$requete);
									$resultat=$base->prepare($requete);
									$resultat->execute();
									//on récupere le dernier id_produit créé
								//$dernier_id_cree=mysqli_insert_id($base);
								}
							}
							else
							{

							}
						break;//fin case ajouter
						
						case "modifier":
							if(isset($_GET['idRecette']))
							{
								//si le bouton enregistrer du formulaire n'a pas été activé
								$action_form="modifier&idRecette=".$_GET['idRecette']."";
								
								//si on appuie sur le bouton enregistrer du formulaire
								if(isset($_POST['submit'])){
									if(empty($_POST['idOrigine']))
									{
										$message="<label id =\"warning\">veuillez entrer le nom de l'origine de la recette s'il-vous-plaît</label>";
									}
									elseif(empty($_POST['nomRecette']))
									{
										$message="<label id =\"warning\">veuillez entrer le nom de la recette s'il-vous-plaît</label>";
									}
									elseif(empty($_POST['descriptionRecette']))
									{
										$message="<label id =\"warning\">veuillez entrer la description de la recette s'il-vous-plaît</label>";
									}
									elseif(empty($_POST['dureeCuisson']))
									{
										$message="<label id =\"warning\">veuillez entrer la durée de cuisson de la recette s'il-vous-plaît</label>";
									}
									elseif(empty($_POST['dureePreparation']))
									{
										$message="<label id =\"warning\">veuillez entrer la durée préparation de la recette s'il-vous-plaît</label>";
									}
									elseif(empty($_POST['recetteRecette']))
									{
										$message="<label id =\"warning\">veuillez entrer la recette s'il-vous-plaît</label>";
									}
									elseif(empty($_POST['effetsRecette']))
									{
										$message="<label id =\"warning\">veuillez entrer les effets de la recette s'il-vous-plaît</label>";
									}
									elseif(empty($_POST['idCategorie']))
									{
										$message="<label id =\"warning\">veuillez entrer l'identifiant de la catégorie de la recette s'il-vous-plaît</label>";
									}
									elseif(empty($_POST['idImage']))
									{
										$message="<label id =\"warning\">veuillez entrer l'identifiant de l'image de la recette s'il-vous-plaît</label>";
									}
									else
									{
										//met à jour la ligne de la table recette
										$requete="UPDATE recette SET idOrigine='".addslashes($_POST['idOrigine'])."', nomRecette='".addslashes($_POST['nomRecette'])."', descriptionRecette='".addslashes($_POST['descriptionRecette'])."',dureeCuisson='".($_POST['dureeCuisson'])."', dureePreparation='".($_POST['dureePreparation'])."', recetteRecette='".addslashes($_POST['recetteRecette'])."', effetsRecette='".addslashes($_POST['effetsRecette'])."', idCategorie='".($_POST['idCategorie'])."', idImage='".($_POST['idImage'])."'WHERE idRecette='".$_GET['idRecette']."'";
										// $resultat=mysqli_query($base,$requete);
										$resultat=$base->prepare($requete);
										$resultat->execute();
									}
								}
								else
								{
									//on recharge le formulaire avec les données
									$requete="SELECT * FROM recette WHERE idRecette='".$_GET['idRecette']."'";
									// $resultat=mysqli_query($base,$requete);
									$resultat=$base->prepare($requete);
									$resultat->execute();
									$ligne = $resultat->fetch(PDO::FETCH_OBJ);
									$_POST['idOrigine']=stripslashes($ligne->idOrigine);
									$_POST['nomRecette']=stripslashes($ligne->nomRecette);
									$_POST['descriptionRecette']=stripslashes($ligne->descriptionRecette);
									$_POST['dureeCuisson']=$ligne->dureeCuisson;
									$_POST['dureePreparation']=$ligne->dureePreparation; 
									$_POST['recetteRecette']=stripslashes($ligne->recetteRecette); 
									$_POST['effetsRecette']=stripslashes($ligne->effetsRecette); 
									$_POST['idCategorie']=$ligne->idCategorie;
									$_POST['idImage']=$ligne->idImage;
								}
							}   
						break;//fin case modifier

						case "supprimer":
							$action_form="ajouter";

							if(isset($_GET['idRecette']))
							{
								
								$message="<label id=\"confirme\">Voulez-vous vraiment supprimer la recette ?<a href=\"admin.php?action=recette&cas=supprimer&idRecette=".$_GET['idRecette']."&confirme=oui\">OUI</a>&nbsp;&nbsp;<a href=\"admin.php?action=recette\">NON</a></label>";

								if(isset($_GET['confirme']) && $_GET['confirme']=="oui")
								{
									$requete="SELECT * FROM recette WHERE idRecette='".$_GET['idRecette']."'";
									// $resultat=mysqli_query($base,$requete);
									$resultat=$base->prepare($requete);
									$resultat->execute();
									$ligne = $resultat->fetch(PDO::FETCH_OBJ);
							
									$requete2="DELETE FROM recette WHERE idRecette='".$_GET['idRecette']."'";
									// $resultat2=mysqli_query($base,$requete2);
									$resultat2=$base->prepare($requete2);
									$resultat2->execute();
									$message="<label id=\"bravo\">La recette a bien été supprimée</label>";
								}
							}
						break;//fin case supprimer
					}
				}
				$liste=afficher_recettes();
				
			break;//fin case recette
			
			case "ingredient":
				//contenu à afficher
				$contenu="form_ingredient.html";

				if(isset($_GET["cas"])){
					switch ($_GET["cas"]) {
						case "ajouter":
							$action_form="ajouter";
							//si le bouton créer a été activé
							if(isset($_POST['submit'])){
								if(empty($_POST[':nomIngredient']))
								{
									$message="<label id =\"warning\">veuillez entrer le nom de l'ingrédient s'il-vous-plaît</label>";
								}
								elseif(empty($_POST[':recolteIngredient']))
								{
									$message="<label id =\"warning\">veuillez entrer la (ou les) méthode(s) d'obtention de l'ingrédients s'il-vous-plaît</label>";
								}
								elseif(empty($_POST[':lieuIngredient']))
								{
									$message="<label id =\"warning\">veuillez entrer le (ou les) lieu(x) ou l'ingredient peut être obtenu s'il-vous-plaît</label>";
								}
								else
								{
									array_pop($_POST);
									array_slice($_POST, -1);
									$requete= $base->prepare("INSERT INTO ingredient 
									(nomIngredient, recolteIngredient, lieuIngredient) VALUE (:nomIngredient, :recolteIngredient, :lieuIngredient)");
									
									var_dump($_POST);
									echo "<hr>";
									$requete->execute($_POST);
								}
							}
							else
							{

							}
						break;//fin case ajouter
						
						case "modifier":
							if(isset($_GET['idIngredient']))
							{
								//si le bouton enregistrer du formulaire n'a pas été activé
								$action_form="modifier&idIngredient=".$_GET['idIngredient']."";
								
								//si on appuie sur le bouton enregistrer du formulaire
								if(isset($_POST['submit'])){
									if(empty($_POST['nomIngredient']))
								{
									$message="<label id =\"warning\">veuillez entrer le nom de l'ingrédient s'il-vous-plaît</label>";
								}
								elseif(empty($_POST['recolteIngredient']))
								{
									$message="<label id =\"warning\">veuillez entrer la (ou les) méthode(s) d'obtention de l'ingrédients s'il-vous-plaît</label>";
								}
								elseif(empty($_POST['lieuIngredient']))
								{
									$message="<label id =\"warning\">veuillez entrer le (ou les) lieu(x) ou l'ingredient peut être obtenu s'il-vous-plaît</label>";
								}
									else
									{
										//met à jour la ligne de la table ingredient
										$requete= $base->exec("UPDATE ingredient SET nomIngredient='".addslashes($_POST['nomIngredient'])."', 	recolteIngredient='".addslashes($_POST['recolteIngredient'])."', lieuIngredient='".addslashes($_POST['lieuIngredient'])."'WHERE idIngredient='".$_GET['idIngredient']."'");
									}
								}
								else
								{
									//on recharge le formulaire avec les données
									$requete= $base->query("SELECT * FROM ingredient WHERE idIngredient='".$_GET['idIngredient']."'")->fetch(PDO::FETCH_OBJ);
									$_POST['nomIngredient']=stripslashes($requete->nomIngredient);
									$_POST['recolteIngredient']=stripslashes($requete->recolteIngredient);
									$_POST['lieuIngredient']=stripslashes($requete->lieuIngredient);
								}
							}   
						break;//fin case modifier

						case "supprimer":
							$action_form="ajouter";

							if(isset($_GET['idIngredient']))
							{
								
								$message="<label id=\"confirme\">Voulez-vous vraiment supprimer l'ingredient ?<a href=\"admin.php?action=ingredient&cas=supprimer&idIngredient=".$_GET['idIngredient']."&confirme=oui\">OUI</a>&nbsp;&nbsp;<a href=\"admin.php?action=ingredient\">NON</a></label>";

								if(isset($_GET['confirme']) && $_GET['confirme']=="oui")
								{
									$requete2=$base->exec("DELETE FROM ingredient WHERE idIngredient='".$_GET['idIngredient']."'");
									$message="<label id=\"bravo\">L'ingredient a bien été supprimé</label>";
								}
							}
						break;//fin case supprimer
					}
				}
				$liste=afficher_Ingredient();
			break;//fin case ingredient

			

			case "image":
				$contenu="form_image.html";

				if(isset($_GET["cas"]))
				{
					switch ($_GET["cas"])
					{
						case "ajouter":
							$action_form="ajouter";
							//si le bouton créer a été activé
							if(isset($_POST['submit']))
							{
								if(empty($_POST['nomImage']))
								{
									$message="<label id =\"warning\">veuillez entrer le nom de l'image' s'il-vous-plaît</label>";
								}
								else if(empty($_POST['urlImage']))
								{
									$message="<label id =\"warning\">veuillez entrer l'url de l'image' s'il-vous-plaît</label>";
								}
								else if(empty($_POST['imageRecette']))
								{
									$message="<label id =\"warning\">veuillez enregistrer une image' s'il-vous-plaît</label>";
								}
								else
								{
									//on insert dans la table image les valeurs des champs nom et description
									//addslashes permet de mettre des \ en cas de  '  .
									$requete="INSERT INTO image 
									SET nomImage='".addslashes($_POST['nomImage'])."',
									urlImage='".addslashes($_POST['urlImage'])."'";
									echo $requete;
									//execution de la requete dans la BDD
									// $resultat=mysqli_query($base,$requete);
									$resultat=$base->prepare($requete);
									$resultat->execute();
							
								//on récupere le dernier id_produit créé
								// $dernier_id_cree=mysqli_insert_id($base);
								$dernier_id_cree=$base->lastinsertID();

								//si le type du fichier photo est valide
								if(fichier_type($_FILES['imageRecette']['name'])=="jpg" ||
								fichier_type($_FILES['imageRecette']['name'])=="png" || 
								fichier_type($_FILES['imageRecette']['name'])=="gif")
									{ 
									$extension=fichier_type($_FILES['imageRecette']['name']);
									$chemin_image= $_GET['urlImage'] . $dernier_id_cree . "_g." . $extension;
									$chemin_image2= $_GET['urlImage'] . $dernier_id_cree . "_p." . $extension; 

									if(is_uploaded_file($_FILES['imageRecette']['tmp_name']))
										{  							
										if(copy($_FILES['imageRecette']['tmp_name'], $chemin_image))
											{ 			
											$size=GetImageSize($chemin_image);
											$width = $size[0];
											$height = $size[1];
											$rapport=$width/$height;
											
											//format paysage
											if($rapport>1)
												{
												$new_width=200;
												$new_height=200/$rapport;
												}
											//format portrait
											elseif($rapport<1)
												{
												$new_width=200*$rapport;
												$new_height=200;
												}
											else{
												$new_width=200;
												$new_height=200;
												}	
											//redimage(image origine,miniature,
											//largeur miniature,hauteur miniature,qualité de la miniature)
											redimage($chemin_image,$chemin_image2,$new_width,$new_height,"70");
											
											}
										}	

									}
								}
							}
							else
							{
	 
							}
						break;//fin case ajouter
						
						case "modifier":
							if(isset($_GET['nomImage']))
							{
								//si le bouton enregistrer du formulaire n'a pas été activé
								$action_form="modifier&idImage=".$_GET['idImage']."";
								
								//si on appuie sur le bouton enregistrer du formulaire
								if(isset($_POST['submit'])){
									if(empty($_POST['nomImage']))
									{
										$message="<label id =\"warning\">veuillez entrer le nom de l'image s'il-vous-plaît</label>";
									}
									else if(empty($_POST['urlImage']))
									{
										$message="<label id =\"warning\">veuillez entrer l'url de l'image s'il-vous-plaît</label>";
									}
									else if(empty($_POST['imageRecette']))
									{
										$message="<label id =\"warning\">veuillez enregistrer une image' s'il-vous-plaît</label>";
									}
									else
									{
										//met à jour la ligne de la table recette
										$requete="UPDATE image SET nomImage='".addslashes($_POST['nomImage'])."', urlImage='".addslashes($_POST['urlImage'])."' WHERE idImage='".$_GET['idImage']."'";
										// $resultat=mysqli_query($base,$requete);
										$resultat=$base->prepare($requete);
										$resultat->execute();

										//on récupere le dernier id_produit créé
								// $dernier_id_cree=mysqli_insert_id($base);
								$dernier_id_cree=$base->lastinsertID();
								
								//si le type du fichier photo est valide
								if(fichier_type($_FILES['imageRecette']['name'])=="jpg" ||
								fichier_type($_FILES['imageRecette']['name'])=="png" || 
								fichier_type($_FILES['imageRecette']['name'])=="gif")
									{ 
									$extension=fichier_type($_FILES['imageRecette']['name']);
									$chemin_image= $_GET['urlImage'] . $dernier_id_cree . "_g." . $extension;
									$chemin_image2= $_GET['urlImage'] . $dernier_id_cree . "_p." . $extension; 

									if(is_uploaded_file($_FILES['imageRecette']['tmp_name']))
										{  							
										if(copy($_FILES['imageRecette']['tmp_name'], $chemin_image))
											{ 			
											$size=GetImageSize($chemin_image);
											$width = $size[0];
											$height = $size[1];
											$rapport=$width/$height;
											
											//format paysage
											if($rapport>1)
												{
												$new_width=200;
												$new_height=200/$rapport;
												}
											//format portrait
											elseif($rapport<1)
												{
												$new_width=200*$rapport;
												$new_height=200;
												}
											else{
												$new_width=200;
												$new_height=200;
												}	
											//redimage(image origine,miniature,
											//largeur miniature,hauteur miniature,qualité de la miniature)
											redimage($chemin_image,$chemin_image2,$new_width,$new_height,"70");
											
											}
										}	

									}
									}
								}
								else
								{
									//on recharge le formulaire avec les données
									$requete="SELECT * FROM image WHERE idImage='".$_GET['idImage']."'";
									// $resultat=mysqli_query($base,$requete);
									$resultat=$base->prepare($requete);
									$resultat->execute();
									// $ligne=mysqli_fetch_object($resultat);
									$ligne = $resultat->fetch(PDO::FETCH_OBJ);
									$_POST['nomImage']=stripslashes($ligne->nomImage);
									$_POST['urlImage']=stripslashes($ligne->urlImage);
								}
							}   
						break;//fin case modifier
	 
						case "supprimer":
							$action_form="ajouter";
	 
							if(isset($_GET['idImage']))
							{
								
								$message="<label id=\"confirme\">Voulez-vous vraiment supprimer l'image' ?<a href=\"admin.php?action=image&cas=supprimer&idImage=".$_GET['idImage']."&confirme=oui\">OUI</a>&nbsp;&nbsp;<a href=\"admin.php?action=image\">NON</a></label>";
	 
								if(isset($_GET['confirme']) && $_GET['confirme']=="oui")
								{
									 $requete="SELECT * FROM image WHERE idImage='".$_GET['idImage']."'";
									//  $resultat=mysqli_query($base,$requete);
									$resultat=$base->prepare($requete);
									$resultat->execute();
									//  $ligne=mysqli_fetch_object($resultat);
									$ligne = $resultat->fetch(PDO::FETCH_OBJ);

									 if(isset($ligne->imageRecette))
									{
									//on calcule le lien vers la grande photo
									$miniature=$ligne->imageRecette;
									$lien_image_g=str_replace("_p","_g",$miniature);

									//on supprime les 2 photos (le @ permet d'éviter un warning si fichier manquant)
									@unlink($lien_image_g);
									@unlink($miniature);							
									}
	 
									 $requete2="DELETE FROM image WHERE idImage='".$_GET['idImage']."'";
									//  $resultat2=mysqli_query($base,$requete2);
									$resultat2=$base->prepare($requete2);
									$resultat2->execute();
									 $message="<label id=\"bravo\">L'image a bien été supprimée</label>";
								}
							}
						break;//fin case supprimer
					}
				}
			$liste=afficher_images();
			break;//fin case image

			case "categorie":
			   //contenu à afficher
			   include('auto_complete.php');
			   $contenu="form_categorie.html";

			   if(isset($_GET["cas"]))
			   {
				   switch ($_GET["cas"]) 
				   {
					   case "ajouter":
						   $action_form="ajouter";
						   //si le bouton créer a été activé
						   if(isset($_POST['submit']))
						   {
							   if(empty($_POST['nomCategorie']))
							   {
								   $message="<label id =\"warning\">veuillez entrer le nom de la catégorie s'il-vous-plaît</label>";
							   }
							   else
							   {
								   //on insert dans la table categorie les valeurs des champs nom et description
								   //addslashes permet de mettre des \ en cas de  '  .
								   $requete="INSERT INTO categorie 
								   SET nomCategorie='".addslashes($_POST['nomCategorie'])."'";
								   //echo $requete;
								   //execution de la requete dans la BDD
								   $resultat=$base->prepare($requete);
								   $resultat->execute();
								   //echo $requete;
								   $message="<label id=\"bravo\">Le produit a bien été ajouté</label>";
							   }
						   }
						   
					   break;//fin case ajouter
					   
					   case "modifier":
						   if(isset($_GET['idCategorie']))
						   {
							   //si le bouton enregistrer du formulaire n'a pas été activé
							   $action_form="modifier&idCategorie=".$_GET['idCategorie']."";
							   
							   //si on appuie sur le bouton enregistrer du formulaire
							   if(isset($_POST['submit'])){
								   if(empty($_POST['nomCategorie']))
							   {
								   $message="<label id =\"warning\">veuillez entrer le nom de la catégorie s'il-vous-plaît</label>";
							   }
								   else
								   {
									   //met à jour la ligne de la table recette
									   $requete="UPDATE categorie SET nomCategorie='".addslashes($_POST['nomCategorie'])."'WHERE idCategorie='".$_GET['idCategorie']."'";
										//    $resultat=mysqli_query($base,$requete);
										$resultat=$base->prepare($requete);
										$resultat->execute();
								   }
							   }
							   else
							   {
								   //on recharge le formulaire avec les données
								   $requete="SELECT * FROM categorie WHERE idCategorie='".$_GET['idCategorie']."'";
								//    $resultat=mysqli_query($base,$requete);
									$resultat=$base->prepare($requete);
									$resultat->execute();
								//    $ligne=mysqli_fetch_object($resultat);
								$ligne = $resultat->fetch(PDO::FETCH_OBJ);
								   $_POST['nomCategorie']=stripslashes($ligne->nomCategorie);
							   }
						   }   
					   break;//fin case modifier

					   case "supprimer":
						   $action_form="ajouter";

						   if(isset($_GET['idCategorie']))
						   {
							   
							   $message="<label id=\"confirme\">Voulez-vous vraiment supprimer la catégorie ?<a href=\"admin.php?action=categorie&cas=supprimer&idCategorie=".$_GET['idCategorie']."&confirme=oui\">OUI</a>&nbsp;&nbsp;<a href=\"admin.php?action=categorie\">NON</a></label>";

							   if(isset($_GET['confirme']) && $_GET['confirme']=="oui")
							   {
									$requete="SELECT * FROM categorie WHERE idCategorie='".$_GET['idCategorie']."'";
									// $resultat=mysqli_query($base,$requete);
									$resultat=$base->prepare($requete);
									$resultat->execute();
									// $ligne=mysqli_fetch_object($resultat);
									$ligne = $resultat->fetch(PDO::FETCH_OBJ);

									$requete2="DELETE FROM categorie WHERE idCategorie='".$_GET['idCategorie']."'";
									// $resultat2=mysqli_query($base,$requete2);
									$resultat2=$base->prepare($requete2);
									$resultat2->execute();
									$message="<label id=\"bravo\">La catégorie a bien été supprimée</label>";
							   }
						   }
					   break;//fin case supprimer
				   }
			   }
			   $liste=afficher_categories();
			break;//fin case categorie

			case "membre":
				$contenu="form_membre.html";

				if(isset($_GET["cas"]))
				{
					switch ($_GET["cas"])
					{
						case "ajouter":
							$action_form="ajouter";
							//si le bouton créer a été activé
							if(isset($_POST['submit']))
							{
								if(empty($_POST['nomMembre']))
								{
									$message="<label id =\"warning\">veuillez entrer le nom du membre s'il-vous-plaît</label>";
								}
								else if(empty($_POST['mdpMembre']))
								{
									$message="<label id =\"warning\">veuillez entrer le mdp du membre s'il-vous-plaît</label>";
								}
								else if(empty($_POST['idPrivilege']))
								{
									$message="<label id =\"warning\">veuillez entrer le privilege du membre s'il-vous-plaît</label>";
								}
								else
								{
									//on insert dans la table membre les valeurs des champs nom et description
                                    //addslashes permet de mettre des \ en cas de  '  .
                                    $mdpCrypt=password_hash($_POST['mdpMembre'], PASSWORD_BCRYPT);
									$requete="INSERT INTO membre 
									SET nomMembre='".addslashes($mdpCrypt)."',
									mdpMembre='".addslashes($_POST['mdpMembre'])."',
									idPrivilege='".addslashes($_POST['idPrivilege'])."'";
									//echo $requete;
									//execution de la requete dans la BDD
									// $resultat=mysqli_query($base,$requete);
									$resultat=$base->prepare($requete);
									$resultat->execute();
								}
							}
							else
							{
	 
							}
						break;//fin case ajouter
						
						case "modifier":
							if(isset($_GET['idMembre']))
							{
								//si le bouton enregistrer du formulaire n'a pas été activé
								$action_form="modifier&idMembre=".$_GET['idMembre']."";
								
								//si on appuie sur le bouton enregistrer du formulaire
								if(isset($_POST['submit'])){
									if(empty($_POST['nomMembre']))
									{
										$message="<label id =\"warning\">veuillez entrer le nom du membre s'il-vous-plaît</label>";
									}
									else if(empty($_POST['mdpMembre']))
									{
										$message="<label id =\"warning\">veuillez entrer le mdp du membre s'il-vous-plaît</label>";
									}
									else if(empty($_POST['idPrivilege']))
									{
										$message="<label id =\"warning\">veuillez entrer le privilege du membre s'il-vous-plaît</label>";
									}
									else
									{
                                        //met à jour la ligne de la table recette
                                        $mdpCrypt=password_hash($_POST['mdpMembre'], PASSWORD_BCRYPT);
										$requete="UPDATE membre SET nomMembre='".addslashes($mdpCrypt)."', mdpMembre='".addslashes($_POST['mdpMembre'])."', idPrivilege='".addslashes($_POST['idPrivilege'])."' WHERE idMembre='".$_GET['idMembre']."'";
										// $resultat=mysqli_query($base,$requete);
										$resultat=$base->prepare($requete);
										$resultat->execute();
									}
								}
								else
								{
									//on recharge le formulaire avec les données
									$requete="SELECT * FROM membre WHERE idMembre='".$_GET['idMembre']."'";
									// $resultat=mysqli_query($base,$requete);
									$resultat=$base->prepare($requete);
									$resultat->execute();
									// $ligne=mysqli_fetch_object($resultat);
									$ligne = $resultat->fetch(PDO::FETCH_OBJ);
									$_POST['nomMembre']=stripslashes($ligne->nomMembre);
									$_POST['mdpMembre']=stripslashes($ligne->mdpMembre);
									$_POST['idPrivilege']=stripslashes($ligne->idPrivilege);
								}
							}   
						break;//fin case modifier
	 
						case "supprimer":
							$action_form="ajouter";
	 
							if(isset($_GET['idMembre']))
							{
								
								$message="<label id=\"confirme\">Voulez-vous vraiment supprimer le membre' ?<a href=\"admin.php?action=membre&cas=supprimer&idMembre=".$_GET['idMembre']."&confirme=oui\">OUI</a>&nbsp;&nbsp;<a href=\"admin.php?action=membre\">NON</a></label>";
	 
								if(isset($_GET['confirme']) && $_GET['confirme']=="oui")
								{
									$requete="SELECT * FROM membre WHERE idMembre='".$_GET['idMembre']."'";
									// $resultat=mysqli_query($base,$requete);
									$resultat=$base->prepare($requete);
									$resultat->execute();
									// $ligne=mysqli_fetch_object($resultat);
									$ligne = $resultat->fetch(PDO::FETCH_OBJ);

									$requete2="DELETE FROM membre WHERE idMembre='".$_GET['idMembre']."'";
									// $resultat2=mysqli_query($base,$requete2);
									$resultat2=$base->prepare($requete2);
									$resultat2->execute();
									$message="<label id=\"bravo\">Le membre a bien été supprimé</label>";
								}
							}
						break;//fin case supprimer
					}
				}
			$liste=afficher_membres();
			break;//fin case membre

			case "ingredientRecette":
				$contenu="form_ingredientrecette.html";

				if(isset($_GET["cas"]))
				{
					switch ($_GET["cas"])
					{
						case "ajouter":
							$action_form="ajouter";
							//si le bouton créer a été activé
							if(isset($_POST['submit']))
							{
								if(empty($_POST['nomRecette']))
								{
									$message="<label id =\"warning\">veuillez entrer le nom de la recette s'il-vous-plaît</label>";
								}
								else if(empty($_POST['nomIngredient']))
								{
									$message="<label id =\"warning\">veuillez entrer le nom du l'ingrédient s'il-vous-plaît</label>";
								}
								else
								{
									//on insert dans la table membre les valeurs des champs nom et description
									//addslashes permet de mettre des \ en cas de  '  .
									$requete="INSERT INTO ingredientrecette 
									SET idRecette=(SELECT recette.idRecette FROM recette WHERE nomRecette ='".addslashes($_POST['nomRecette'])."'),
									idIngredient=(SELECT ingredient.idIngredient FROM ingredient WHERE nomIngredient ='".addslashes($_POST['nomIngredient'])."')";
									echo $requete;
									//execution de la requete dans la BDD
									// $resultat=mysqli_query($base,$requete);
									$resultat=$base->prepare($requete);
									$resultat->execute();
								}
							}
							else
							{
	 
							}
						break;//fin case ajouter
						
						case "modifier":
							if(isset($_GET['nomRecette']))
							{
								//si le bouton enregistrer du formulaire n'a pas été activé
								$action_form="modifier&nomRecette=".$_GET['nomRecette']."";
								
								//si on appuie sur le bouton enregistrer du formulaire
								if(isset($_POST['submit'])){
									if(empty($_POST['nomRecette']))
									{
										$message="<label id =\"warning\">veuillez entrer le nom de la recette s'il-vous-plaît</label>";
									}
									else if(empty($_POST['nomIngredient']))
									{
										$message="<label id =\"warning\">veuillez entrer le nom du l'ingrédient s'il-vous-plaît</label>";
									}
									else
									{
										//met à jour la ligne de la table recette
										$requete="UPDATE ingredientrecette SET idRecette=(SELECT recette.idRecette FROM recette WHERE nomRecette ='".addslashes($_POST['nomRecette'])."'),
										idIngredient=(SELECT ingredient.idIngredient FROM ingredient WHERE nomIngredient ='".addslashes($_POST['nomIngredient'])."')";
										// $resultat=mysqli_query($base,$requete);
										$resultat=$base->prepare($requete);
										$resultat->execute();
									}
								}
								else
								{
									//on recharge le formulaire avec les données
									$requete="SELECT * FROM ingredientrecette WHERE idRecette=(SELECT idRecette FROM recette WHERE nomRecette='".$_GET['nomRecette']."')";
									// $resultat=mysqli_query($base,$requete);
									$resultat=$base->prepare($requete);
									$resultat->execute();
									// $ligne=mysqli_fetch_object($resultat);
									$ligne = $resultat->fetch(PDO::FETCH_OBJ);
									$_POST['nomRecette']=stripslashes($ligne->nomMembre);
									$_POST['nomIngredient']=stripslashes($ligne->mdpMembre);
								}
							}   
						break;//fin case modifier
	 
						case "supprimer":
							$action_form="ajouter";
	 
							if(isset($_GET['nomRecette']))
							{
								
								$message="<label id=\"confirme\">Voulez-vous vraiment supprimer l'ingrédient de la recette ?<a href=\"admin.php?action=ingredientRecette&cas=supprimer&nomRecette".$_GET['nomRecette']."&nomIngredient=".$_GET['nomIngredient']."&confirme=oui\">OUI</a>&nbsp;&nbsp;<a href=\"admin.php?action=ingredientRecette\">NON</a></label>";
	 
								if(isset($_GET['confirme']) && $_GET['confirme']=="oui")
								{
									$requete="SELECT * FROM ingredientrecette WHERE idRecette=(SELECT idRecette FROM recette WHERE nomRecette='".$_GET['nomRecette']."') AND idIngredient=(SELECT idIngredient FROM ingredient WHERE nomIngredient='".$_GET['nomIngredient']."')";
									// $resultat=mysqli_query($base,$requete);
									$resultat=$base->prepare($requete);
									$resultat->execute();
									// $ligne=mysqli_fetch_object($resultat);
									$ligne = $resultat->fetch(PDO::FETCH_OBJ);

									$requete2="DELETE FROM ingredientrecette WHERE idRecette=(SELECT idRecette FROM recette WHERE nomRecette='".$_GET['nomRecette']."') AND idIngredient=(SELECT idIngredient FROM ingredient WHERE nomIngredient='".$_GET['nomIngredient']."')";
									// $resultat2=mysqli_query($base,$requete2);
									$resultat2=$base->prepare($requete2);
									$resultat2->execute();
									$message="<label id=\"bravo\">L'ingrédient a bien été supprimé</label>";
								}
							}
						break;//fin case supprimer
					}
				}
			$liste=afficher_ingredientrecette();
			break;//fin case ingredientrecette

			case "origine":
				$contenu="form_origine.html";

				if(isset($_GET["cas"]))
				{
					switch ($_GET["cas"])
					{
						case "ajouter":
							$action_form="ajouter";
							//si le bouton créer a été activé
							if(isset($_POST['submit']))
							{
								if(empty($_POST['nomOrigine']))
								{
									$message="<label id =\"warning\">veuillez entrer le nom du origine s'il-vous-plaît</label>";
								}
								else if(empty($_POST['descriptionOrigine']))
								{
									$message="<label id =\"warning\">veuillez entrer la description de l'origine s'il-vous-plaît</label>";
								}
								else
								{
									//on insert dans la table origine les valeurs des champs nom et description
									//addslashes permet de mettre des \ en cas de  '  .
									$requete="INSERT INTO origine 
									SET nomOrigine='".addslashes($_POST['nomOrigine'])."',
									descriptionOrigine='".addslashes($_POST['descriptionOrigine'])."'";
									//echo $requete;
									//execution de la requete dans la BDD
									// $resultat=mysqli_query($base,$requete);
									$resultat=$base->prepare($requete);
									$resultat->execute();
								}
							}
							else
							{
	 
							}
						break;//fin case ajouter
						
						case "modifier":
							if(isset($_GET['idOrigine']))
							{
								//si le bouton enregistrer du formulaire n'a pas été activé
								$action_form="modifier&idOrigine=".$_GET['idOrigine']."";
								
								//si on appuie sur le bouton enregistrer du formulaire
								if(isset($_POST['submit'])){
									if(empty($_POST['nomOrigine']))
									{
										$message="<label id =\"warning\">veuillez entrer le nom de l\'origine s\'il-vous-plaît</label>";
									}
									else if(empty($_POST['descriptionOrigine']))
									{
										$message="<label id =\"warning\">veuillez entrer la description de l\'origine s\'il-vous-plaît</label>";
									}
									else
									{
										//met à jour la ligne de la table recette
										$requete="UPDATE origine SET nomOrigine='".addslashes($_POST['nomOrigine'])."', descriptionOrigine='".addslashes($_POST['descriptionOrigine'])."' WHERE idOrigine='".$_GET['idOrigine']."'";
										// $resultat=mysqli_query($base,$requete);
										$resultat=$base->prepare($requete);
										$resultat->execute();
									}
								}
								else
								{
									//on recharge le formulaire avec les données
									$requete="SELECT * FROM origine WHERE idOrigine='".$_GET['idOrigine']."'";
									// $resultat=mysqli_query($base,$requete);
									$resultat=$base->prepare($requete);
									$resultat->execute();
									// $ligne=mysqli_fetch_object($resultat);
									$ligne = $resultat->fetch(PDO::FETCH_OBJ);
									$_POST['nomOrigine']=stripslashes($ligne->nomOrigine);
									$_POST['descriptionOrigine']=stripslashes($ligne->descriptionOrigine);
								}
							}   
						break;//fin case modifier
	 
						case "supprimer":
							$action_form="ajouter";
	 
							if(isset($_GET['idOrigine']))
							{
								
								$message="<label id=\"confirme\">Voulez-vous vraiment supprimer l\'origine' ?<a href=\"admin.php?action=origine&cas=supprimer&idOrigine=".$_GET['idOrigine']."&confirme=oui\">OUI</a>&nbsp;&nbsp;<a href=\"admin.php?action=origine\">NON</a></label>";
	 
								if(isset($_GET['confirme']) && $_GET['confirme']=="oui")
								{
									$requete="SELECT * FROM origine WHERE idOrigine='".$_GET['idOrigine']."'";
									// $resultat=mysqli_query($base,$requete);
									$resultat=$base->prepare($requete);
									$resultat->execute();
									// $ligne=mysqli_fetch_object($resultat);
									$ligne = $resultat->fetch(PDO::FETCH_OBJ);

									$requete2="DELETE FROM origine WHERE idOrigine='".$_GET['idOrigine']."'";
									// $resultat2=mysqli_query($base,$requete2);
									$resultat2=$base->prepare($requete2);
									$resultat2->execute();
									$message="<label id=\"bravo\">Le origine a bien été supprimé</label>";
								}
							}
						break;//fin case supprimer
					}
				}
			$liste=afficher_origines();
			break;//fin case origine

		}//fin switch
	}// fin if isset
}//fin session

elseif (isset($_SESSION['idMembre']) &&  $_SESSION['idPrivilege'] == '1' || $_SESSION['idPrivilege'] == '2') 
{
    echo $_SESSION['idPrivilege']."ligne 2 <br>";
if(isset($_GET['action'])){
    switch ($_GET["action"]){

        case "article":
            //contenu à afficher
            $contenu="form_article.html";

            if(isset($_GET["cas"])){
                switch ($_GET["cas"]) {
                    case "ajouter":
                        
                        //si le bouton créer a été activé
                        if(isset($_POST['submit'])){
                            $action_form="ajouter";
                            if(empty($_POST['titreArticle']))
                            {
                                $message="<label id =\"warning\">veuillez entrer le titre de l'article s'il-vous-plaît</label>";
                            }
                            elseif(empty($_POST['contenuArticle']))
                            {
                                $message="<label id =\"warning\">veuillez entrer le contenude l'article s'il-vous-plaît</label>";
                            }
                            elseif(empty($_POST['dateArticle']))
                            {
                                $message="<label id =\"warning\">veuillez entrer la date du jour s'il-vous-plaît</label>";
                            }
                            elseif(empty($_POST['idMembre']))
                            {
                                $message="<label id =\"warning\">veuillez entrer l'identifiant de l'auteur s'il-vous-plaît</label>";
                            }
                            elseif(empty($_POST['idRecette']))
                            {
                                $message="<label id =\"warning\">veuillez entrer l'identifiant de la recette liée à l'article s'il-vous-plaît</label>";
                            }
                            else
                            {
                                //on insert dans la table article les valeurs des champs nom et description
                                //addslashes permet de mettre des \ en cas de  '  .
                                $requete="  INSERT INTO article SET titreArticle='"
                                .addslashes($_POST['titreArticle'])
                                ."', 	contenuArticle='"
                                .addslashes($_POST['contenuArticle'])
                                ."', dateArticle='"
                                .addslashes($_POST['dateArticle'])
                                ."', idMembre='"
                                .addslashes($_POST['idMembre'])
                                ."', idRecette='"
                                .addslashes($_POST['idRecette'])
                                ."'";
                                echo $requete;
                                //execution de la requete dans la BDD
                                // $resultat=mysqli_query($base,$requete);
                                $resultat=$base->prepare($requete);
                                $resultat->execute();
                            }
                        }
                        else
                        {

                        }
                    break;//fin case ajouter
                    
                    case "modifier":
                        if(isset($_GET['idArticle']))
                        {
                            //si le bouton enregistrer du formulaire n'a pas été activé
                            $action_form="modifier&idArticle=".$_GET['idArticle']."";
                            
                            //si on appuie sur le bouton enregistrer du formulaire
                            if(isset($_POST['submit'])){
                                if(empty($_POST['titreArticle']))
                            {
                                $message="<label id =\"warning\">veuillez entrer le titre de l'article s'il-vous-plaît</label>";
                            }
                            elseif(empty($_POST['contenuArticle']))
                            {
                                $message="<label id =\"warning\">veuillez entrer le contenude l'article s'il-vous-plaît</label>";
                            }
                            elseif(empty($_POST['dateArticle']))
                            {
                                $message="<label id =\"warning\">veuillez entrer la date du jour s'il-vous-plaît</label>";
                            }
                            elseif(empty($_POST['idMembre']))
                            {
                                $message="<label id =\"warning\">veuillez entrer l'identifiant de l'auteur s'il-vous-plaît</label>";
                            }
                            elseif(empty($_POST['idRecette']))
                            {
                                $message="<label id =\"warning\">veuillez entrer l'identifiant de la recette liée à l'article s'il-vous-plaît</label>";
                            }
                                else
                                {
                                    //met à jour la ligne de la table recette
                                    $requete="UPDATE article SET titreArticle='".addslashes($_POST['titreArticle'])."', contenuArticle='".addslashes($_POST['contenuArticle'])."', dateArticle='".addslashes($_POST['dateArticle'])."', idMembre='".addslashes($_POST['idMembre'])."', idRecette='".addslashes($_POST['idRecette'])."'WHERE idArticle='".$_GET['idArticle']."'";
                                    // $resultat=mysqli_query($base,$requete);
                                    $resultat=$base->prepare($requete);
                                    $resultat->execute();
                                }
                            }
                            else
                            {
                                //on recharge le formulaire avec les données
                                $requete="SELECT * FROM article WHERE idArticle='".$_GET['idArticle']."'";
                                // $resultat=mysqli_query($base,$requete);
                                $resultat=$base->prepare($requete);
                                $resultat->execute();
                                // $ligne=mysqli_fetch_object($resultat);
                                $ligne=PDO::FETCH_OBJ($resultat);
                                $_POST['titreArticle']=stripslashes($ligne->titreArticle);
                                $_POST['contenuArticle']=stripslashes($ligne->contenuArticle);
                                $_POST['dateArticle']=stripslashes($ligne->dateArticle);
                                $_POST['idMembre']=stripslashes($ligne->idMembre);
                                $_POST['idRecette']=stripslashes($ligne->idRecette);
                            }
                        }   
                    break;//fin case modifier

                    case "supprimer":
                        $action_form="ajouter";

                        if(isset($_GET['idArticle']))
                        {
                            
                            $message="<label id=\"confirme\">Voulez-vous vraiment supprimer l'article ?<a href=\"admin.php?action=article&cas=supprimer&idArticle=".$_GET['idArticle']."&confirme=oui\">OUI</a>&nbsp;&nbsp;<a href=\"admin.php?action=article\">NON</a></label>";

                            if(isset($_GET['confirme']) && $_GET['confirme']=="oui")
                            {
                                $requete="SELECT * FROM article WHERE idArticle='".$_GET['idArticle']."'";
                                // $resultat=mysqli_query($base,$requete);
                                $resultat=$base->prepare($requete);
                                $resultat->execute();
                                // $ligne=mysqli_fetch_object($resultat);
                                $ligne=PDO::FETCH_OBJ($resultat);
                                
                                $requete2="DELETE FROM article WHERE idArticle='".$_GET['idArticle']."'";
                                // $resultat2=mysqli_query($base,$requete2);
                                $resultat2=$base->prepare($requete2);
                                $resultat2->execute();
                                $message="<label id=\"bravo\">L'article a bien été supprimé</label>";
                            }
                        }
                    break;//fin case supprimer
                }
            }
            $liste=afficher_articles();
        break;//fin case article

			}//fin switch
	}// fin if isset
}//fin elseif
else{
    
echo "je suis le else admin <hr>";            
?>  
	<div class="panel panel-danger">                
		<div class="panel-heading">Erreur : Vous n'êtes pas connecté</div>                
		<div class="panel-body">                    
			Connectez-vous pour accéder à votre compte. Si vous n'avez pas encore de compte, vous pouvez dès à présent vous inscrire !<br><br><br>                    
			<div class="btn-group" role="group">                        
				<a class="btn btn-danger" href="login.php">Connexion</a>                    
			</div>                
		</div>            
	</div>            
<?php } //fin else
	include("admin.html");
?>