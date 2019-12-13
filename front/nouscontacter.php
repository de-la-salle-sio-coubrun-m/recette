<?php session_start();
include('header.html'); 
if(isset($_POST['submit'])){
    $to = "kazumixxx69@gmail.com";
    $from = $_POST['email_contact'];
    $first_name = $_POST['first_name'];
    $last_name = $_POST['last_name'];
    $subject = "Form submission";
    //$message = $first_name . " " . $last_name . "wrote the following :\n\n" . $_POST['message_contact'];

    $headers = "From:" . $from;
    //mail($to,$subject,$message,$headers); // ne fonctionne que sur un vrai serveur, pas en local
    
    if(!$_POST['first_name'] || !$_POST['last_name'] || !$_POST['email_contact'] || !$_POST['message_contact']){
        echo "Veuillez renseigner tous les champs avant de valider.";
    } 
    elseif(empty($_POST['captcha']) || 
    (isset($_SESSION['captcha']) && $_SESSION['captcha']!=$_POST['captcha']))
    {
        $message="<label id=\"warning\">Captcha pas bien !</label>\n";
    }
    else{
        echo "Message envoyé. Merci " . $first_name . ", nous vous recontacterons bientôt.";
    }
}
?>


    <section id="pageContact">
        <div id="formulaire" class="col-md-8 ">
            <form action="" method="POST">
                <input placeholder="Prénom" type="text" name="first_name" value="<?php if(isset($_POST['first_name'])){echo $_POST['first_name'];} ?>"  />
                <input placeholder="Nom" type="text" name="last_name" value="<?php if(isset($_POST['last_name'])){echo $_POST['last_name'];} ?>"  />
                <input placeholder="Email" type="email" name="email_contact" value="<?php if(isset($_POST['email_contact'])){echo $_POST['email_contact'];} ?>" />
                <textarea placeholder="Message" name="message_contact" ><?php if(isset($_POST['message_contact'])){echo $_POST['message_contact'];} ?></textarea>
                
                <img id="captcha" src="../tools/captcha.php" alt="code sécurité" />
                <input placeholder="Code de sécurité" type="text" name="captcha" value="<?php if(isset($_POST['captcha'])){echo $_POST['captcha'];} ?>" />
                
                <label><a id="pol" href="#pol_conf">voir la politique de confidentialité</a></label>
                
                <?php if(isset($message)){echo $message;} ?>
                
                <input type="submit" name="submit" value="ENVOYER" />

                
                

            </form>
            <div id="pol_conf">
                <a href="nouscontacter.php"><i class="far fa-times-circle"></i></a>
                <p>Ac ridiculus aptent lacinia? Incididunt porro expedita integer, ipsum? Cumque explicabo, atque, cupidatat consequatur cillum hac. Mus ultricies laborum faucibus.</p>
                <p>Odio, ratione et senectus aliquam. Phasellus sit optio, ducimus, quidem lorem aute, cubilia. Leo! Culpa faucibus! Molestias morbi, class, sit.</p>
            </div>
        </div>
        <article id="coordonne" class="col-md-4">
            <p><i class="fas fa-map-marker-alt"></i> 16 champ de l'USS Enterprise <br>Bourg-Palette Kanto</p>
            <p><i class="fas fa-phone-alt"></i> 05 55 12 34 56</p>
            <p><i class="far fa-envelope"></i> onmangebien <i class="fas fa-at"></i> lacantina.fr</p>
            <img src="../images/map.png" alt="carte pour retrouver l'adress">
        </article>
    </section>

    <?php
  include('footer.html');
  ?>