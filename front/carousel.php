<?php
require_once('../tools/fonctions.php');
?>

<!-- Caroussel -->
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
	<!-- Indicateurs -->

	<ol class="carousel-indicators">
		<?php
		// préparation de la requête : recherche des cinq dernières news.
		$base = connect();
		$req_pre = $base->prepare("SELECT COUNT(urlImage) nb FROM image LIMIT 6");
		$req_pre->execute();
		//le résultat est récupéré sous forme d'objet
		// lecture de la 1ère ligne
		$ligne=$req_pre->fetch(PDO::FETCH_OBJ);
		$nb = $ligne->nb;
		$i=0;

		while ($ligne) {

			for ($i=0; $i < 6; $i++) { 

				if($i==0){
					?> <li data-target="#moncaroussel" data-slide-to="<?php echo $i; ?>" class="active"></li> <?php
				}else{

				?>
				<li data-target="#moncaroussel" data-slide-to="<?php echo $i; ?>"></li>
				<?php
				}

			}
			// lecture de la ligne suivante
			$ligne=$req_pre->fetch(PDO::FETCH_OBJ);
		} // Fin de la boucle des news.

		// fermeture du curseur associé à un jeu de résultats
		$req_pre->closeCursor();
		?>
	</ol>
	<!-- /Indicateurs -->

	<div class="carousel-inner" role="listbox">

		<?php
		// préparation de la requête : recherche des cinq dernières news.
		$req_pre = $base->prepare("SELECT urlImage FROM image LIMIT 6");
		$req_pre->execute();
		//le résultat est récupéré sous forme d'objet
		// lecture de la 1ère ligne
		$ligne=$req_pre->fetch(PDO::FETCH_OBJ);
		$i=0;

		while ($ligne) {
			$ligne->urlImage = str_replace("_p", "_g", $ligne->urlImage);
			if($i==0){
				$i=1;
				
				?>
				<div class="carousel-item active">
					<center><img src="<?php echo $ligne->urlImage; ?>"></center>
				</div>
				<?php
			}else{
				?>
				<div class="carousel-item">
					<center><img src="<?php echo $ligne->urlImage; ?>"></center>
				</div>
				<?php
			} ?>

			<?php
			// lecture de la ligne suivante
			$ligne=$req_pre->fetch(PDO::FETCH_OBJ);
		} // Fin de la boucle des news.

		// fermeture du curseur associé à un jeu de résultats
		$req_pre->closeCursor();
		?>

	</div>

	<!-- Contrôleurs -->
	<a class="carousel-control-prev" href="#carousel-example-generic" role="button" data-slide="prev">
		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
		<span class="sr-only">Précédent</span>
	</a>

	<a class="carousel-control-next" href="#carousel-example-generic" role="button" data-slide="next">
		<span class="carousel-control-next-icon" aria-hidden="true"></span>
		<span class="sr-only">Suivant</span>
	</a>
	<!-- /Contrôleurs -->

</div>
<!-- /Caroussel -->
