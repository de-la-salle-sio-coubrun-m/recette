<?php include('header.html'); ?>

    <section>
        <div id="contact">
            <form action="" method="POST">
                <input placeholder="Prénom" type="text" name="first_name" value="<?php if(isset($_POST['first_name'])){echo $_POST['first_name'];} ?>"  />
                <input placeholder="Nom" type="text" name="last_name" value="<?php if(isset($_POST['last_name'])){echo $_POST['last_name'];} ?>"  />
                <input placeholder="Email" type="email" name="email_contact" value="<?php if(isset($_POST['email_contact'])){echo $_POST['email_contact'];} ?>" />
                <textarea placeholder="Message" name="message_contact" rows="10" cols="50"><?php if(isset($_POST['message_contact'])){echo $_POST['message_contact'];} ?></textarea>
                
                <!-- <img id="captcha" src="../outils/captcha.php" alt="code sécurité" />  
                <input placeholder="Code de sécurité" type="text" name="captcha" value="<--?php if(isset($_POST['captcha'])){echo $_POST['captcha'];} ?>" />
                
                <label><a href="#pol_conf">voir la politique de confidentialité</a></label> -->
                
                <!--?php if(isset($message)){echo $message;} ?-->
                
                <input type="submit" name="submit" value="ENVOYER" />

                <?php
                if(isset($_POST['submit'])){
                    $to = "kazumixxx69@gmail.com";
                    $from = $_POST['email_contact'];
                    $first_name = $_POST['first_name'];
                    $last_name = $_POST['last_name'];
                    $subject = "Form submission";
                    $message = $first_name . " " . $last_name . "wrote the following :\n\n" . $_POST['message_contact'];

                    $headers = "From:" . $from;
                    //mail($to,$subject,$message,$headers); // ne fonctionne que sur un vrai serveur, pas en local
                    echo "Message envoyé. Merci " . $first_name . ", nous vous recontacterons bientôt.";
                }
                ?>

            </form>
            <!-- <div class="pol_conf">
                <a href="front.php?page=contact#contact">X</a>
                <p>Ac ridiculus aptent lacinia? Incididunt porro expedita integer, ipsum? Cumque explicabo, atque, cupidatat consequatur cillum hac. Mus ultricies laborum faucibus.</p>
                <p>Odio, ratione et senectus aliquam. Phasellus sit optio, ducimus, quidem lorem aute, cubilia. Leo! Culpa faucibus! Molestias morbi, class, sit.</p>
            </div> -->
        </div>
    </section>

    <?php
  include('footer.html');
  ?>