<?php 
session_start();
require_once("../tools/fonctions.php"); 
	
$whatToReturn = 'login.html';
if(isset($_POST['submit']))
	{	
	// if(!empty($_POST['captcha']) && !empty($_POST['login_compte']))
		if(!empty($_POST['login_compte']))
		{ 
			echo "esque le formulaire est plein ? <br>";
			// if(isset($_SESSION['captcha']) && $_SESSION['captcha']==$_POST['captcha'])
			
			echo "retour form".$_POST['login_compte']."et le mot de pass ".$_POST['pass_compte']."<br>";
			login($_POST['login_compte'],$_POST['pass_compte']); 	
			$whatToReturn = 'admin.php';        
		}				
	}
	echo $whatToReturn."ou es que je vais ? <br>";
include($whatToReturn);
?>