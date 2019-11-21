<?php
//permet l'usage des variables de session
session_start();
require_once("../tools/fonctions.php");
//établit la connexion avec la base de données
$connexion=connexion();

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
                            elseif(empty($_POST['idIngredient']))
                            {
                                $message="<label id =\"warning\">veuillez entrer l'identifiant d'un ingrédient de la recette s'il-vous-plaît</label>";
                            }
                            else
                            {
                                //on insert dans la table recette les valeurs des champs nom et description
                                //addslashes permet de mettre des \ en cas de  '  .
                                $requete="  INSERT INTO recette 
                                SET idOrigine='".addslashes($_POST['idOrigine'])."', nomRecette='".addslashes($_POST['nomRecette'])."', descriptionRecette='".addslashes($_POST['descriptionRecette'])."',dureeCuisson='".($_POST['dureeCuisson'])."', dureePreparation='".($_POST['dureePreparation'])."', recetteRecette='".addslashes($_POST['recetteRecette'])."', effetsRecette='".addslashes($_POST['effetsRecette'])."', idCategorie='".($_POST['idCategorie'])."', idIngredient='".($_POST['idIngredient'])."', idImage='".($_POST['idImage'])."'";
                                echo $requete;
                                //execution de la requete dans la BDD
                                $resultat=mysqli_query($connexion,$requete);
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
                                elseif(empty($_POST['idIngredient1']))
                                {
                                    $message="<label id =\"warning\">veuillez entrer l'identifiant d'un ingrédient de la recette s'il-vous-plaît</label>";
                                }
                                elseif(empty($_POST['idImage']))
                                {
                                    $message="<label id =\"warning\">veuillez entrer l'identifiant de l'image de la recette s'il-vous-plaît</label>";
                                }
                                else
                                {
                                    //met à jour la ligne de la table recette
                                    $requete="UPDATE recette SET idOrigine='".addslashes($_POST['idOrigine'])."', nomRecette='".addslashes($_POST['nomRecette'])."', descriptionRecette='".addslashes($_POST['descriptionRecette'])."',dureeCuisson='".($_POST['dureeCuisson'])."', dureePreparation='".($_POST['dureePreparation'])."', recetteRecette='".addslashes($_POST['recetteRecette'])."', effetsRecette='".addslashes($_POST['effetsRecette'])."', idCategorie='".($_POST['idCategorie'])."', idIngredient='".($_POST['idIngredient'])."', idImage='".($_POST['idImage'])."'";
                                    $resultat=mysqli_query($connexion,$requete);
                                }
                            }
                            else
                            {
                                //on recharge le formulaire avec les données
                                $requete="SELECT * FROM recette WHERE idRecette='".$_GET['idRecette']."'";
                                $resultat=mysqli_query($connexion,$requete);
                                $ligne=mysqli_fetch_object($resultat);
                                $_POST['idOrigine']=stripslashes($ligne->idOrigine);
                                $_POST['nomRecette']=stripslashes($ligne->nomRecette);
                                $_POST['descriptionRecette']=stripslashes($ligne->descriptionRecette);
                                $_POST['dureeCuisson']=$ligne->dureeCuisson;
                                $_POST['dureePreparation']=$ligne->dureePreparation; 
                                $_POST['recetteRecette']=stripslashes($ligne->recetteRecette); 
                                $_POST['effetsRecette']=stripslashes($ligne->effetsRecette); 
                                $_POST['idCategorie']=$ligne->idCategorie; 
                                $_POST['idIngredient']=$ligne->idIngredient;
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
                                $requete2="DELETE FROM recette WHERE idRecette='".$_GET['idRecette']."'";
                                echo $requete2;
                                $resultat2=mysqli_query($connexion,$requete2);
                                echo $resultat2;
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
                                //on insert dans la table recette les valeurs des champs nom et description
                                //addslashes permet de mettre des \ en cas de  '  .
                                $requete="  INSERT INTO ingredient 
                                SET nomIngredient='".addslashes($_POST['nomIngredient'])."', 	recolteIngredient='".addslashes($_POST['	recolteIngredient'])."', lieuIngredient='".addslashes($_POST['lieuIngredient'])."'";
                                echo $requete;
                                //execution de la requete dans la BDD
                                $resultat=mysqli_query($connexion,$requete);
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
                                    //met à jour la ligne de la table recette
                                    $requete="UPDATE ingredient SET nomIngredient='".addslashes($_POST['nomIngredient'])."', 	recolteIngredient='".addslashes($_POST['	recolteIngredient'])."', lieuIngredient='".addslashes($_POST['lieuIngredient'])."'";
                                    $resultat=mysqli_query($connexion,$requete);
                                }
                            }
                            else
                            {
                                //on recharge le formulaire avec les données
                                $requete="SELECT * FROM ingredient WHERE idIngredient='".$_GET['idIngredient']."'";
                                $resultat=mysqli_query($connexion,$requete);
                                $ligne=mysqli_fetch_object($resultat);
                                $_POST['nomIngredient']=stripslashes($ligne->nomIngredient);
                                $_POST['recolteIngredient']=stripslashes($ligne->recolteIngredient);
                                $_POST['lieuIngredient']=stripslashes($ligne->lieuIngredient);
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
                                $requete2="DELETE FROM ingredient WHERE idIngredient='".$_GET['idIngredient']."'";
                                echo $requete2;
                                $resultat2=mysqli_query($connexion,$requete2);
                                echo $resultat2;
                                $message="<label id=\"bravo\">L'ingredient a bien été supprimée</label>";
                            }
                        }
                    break;//fin case supprimer
                }
            }
            $liste=afficher_Ingredient();
        break;//fin case ingredient

        case "article":
            # code...
        break;//fin case article

        case "image":
            # code...
        break;//fin case image

        case "categorie":
            # code...
        break;//fin case categorie
        
        case "membre":
            # code...
        break;//fin case membre
    }//fin switch
}// fin if isset

//on referme la connexion à la base
mysqli_close($connexion);
include("admin.html");
?>