<?php
//permet de préciser le type de redirection
header("Status:301 Moved Permanently",false,301);

//permet de faire une redirection de type 301 car en ligne3 on a changé le statut
header("Location:front/index.php");
?>