<?php 
session_start();
require_once("../tools/fonctions.php"); 
	
$whatToReturn = 'login.html';
if(isset($_POST['submit']))
	{	
	// if(!empty($_POST['captcha']) && !empty($_POST['login_compte']))
		if(!empty($_POST['login_compte']))
		{ 
			// if(isset($_SESSION['captcha']) && $_SESSION['captcha']==$_POST['captcha'])
			
			login($_POST['login_compte'],$_POST['pass_compte']); 	
			$whatToReturn = 'admin.php';        
		}				
	}
	
include($whatToReturn);
?>