<?php 
session_start();
require_once("../tools/fonctions.php"); 
$base = connect();

if(isset($_POST['submit']))
	{	
	// if(!empty($_POST['captcha']) && !empty($_POST['login_compte']))
		if(!empty($_POST['login_compte']) || !empty($_POST['pass_compte']))
		{
			$requete="SELECT nomMembre FROM membre WHERE nomMembre= '" . $_POST['login_compte']."'";
			$query=$base->prepare($requete);
			$query->execute();
			$ligne=$query->fetch(PDO::FETCH_OBJ);
			if($ligne){
				$message = login($_POST['login_compte'],$_POST['pass_compte']);
			} else {
				$message = '<label class="error">Les identifiants ne sont pas corrects !</label>';
			}
		} else {
			$message = '<label class="error">Les champs sont vides !</label>';
		}
	}
include('login.html');
?>