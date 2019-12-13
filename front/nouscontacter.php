<?php 
    session_start();
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
            $message= '<label class="erreur">Veuillez renseigner tous les champs avant de valider.</label>';
        }
        elseif(!isset($_POST['checkbox'])){
            $message= '<label class="erreur">Veuillez accepter que l\'on utilise vos informations pour vous recontactez sinon nous ne pouvons pas donner suite à votre message.</label>';
        }
        elseif(empty($_POST['captcha']) || 
        (isset($_SESSION['captcha']) && $_SESSION['captcha']!=$_POST['captcha']))
        {
            $message="<label class=\"erreur\">Captcha pas bien !</label>\n";
        }
        else{
            $message='<label class="merci">Message envoyé. Merci ' . $first_name . ', nous vous recontacterons bientôt.</label>';
        }
    }
    ?>
    <section id="pageContact">                
        <?php if(isset($message)){echo $message;} ?>
        <div id="formulaire" class="col-md-8 ">
            <form action="" method="POST">
                <input placeholder="Prénom" type="text" name="first_name" value="<?php if(isset($_POST['first_name'])){echo $_POST['first_name'];} ?>"  />
                <input placeholder="Nom" type="text" name="last_name" value="<?php if(isset($_POST['last_name'])){echo $_POST['last_name'];} ?>"  />
                <input placeholder="Email" type="email" name="email_contact" value="<?php if(isset($_POST['email_contact'])){echo $_POST['email_contact'];} ?>" />
                <textarea placeholder="Message" name="message_contact" ><?php if(isset($_POST['message_contact'])){echo $_POST['message_contact'];} ?></textarea>
                
                <img id="captcha" src="../tools/captcha.php" alt="code sécurité" />
                <input placeholder="Code de sécurité" type="text" name="captcha" value="<?php if(isset($_POST['captcha'])){echo $_POST['captcha'];} ?>" />
                
                <div id="box">
                    <input type="checkbox" name="checkbox">
                    <p>En soumettant ce formulaire, j'accepte que les information saisies soient exploitées pour permettre de me recontacter.</p>
                </div>
                
                <input type="submit" name="submit" value="ENVOYER" />

            </form>
            
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