<?php
switch($_GET['code'])
    {
    case '404': 
        header('Location:404.html');
        
    break;
    default:header('Location:front/index.php');
    }
?>