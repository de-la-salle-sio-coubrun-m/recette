<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="../fontawesome-free-5.11.2-web/css/all.min.css">
    <link rel="stylesheet" href="../css/front.css">
    <title>Nous Contacter</title>
</head>
<body>
    <script src="header.js"></script>

    <section>
        <div id="contact">
            <form action="" method="POST">
                <input placeholder="Nom utilisateur" type="text" name="nom_contact" value="<?php if(isset($_POST['nom_contact'])){echo $_POST['nom_contact'];} ?>"  />
                <input placeholder="Email" type="email" name="email_contact" value="<?php if(isset($_POST['email_contact'])){echo $_POST['email_contact'];} ?>" />
                <textarea placeholder="Message" name="message_contact" rows="10" cols="50"><?php if(isset($_POST['message_contact'])){echo $_POST['message_contact'];} ?></textarea>
                
                <!-- <img id="captcha" src="../outils/captcha.php" alt="code sécurité" />  
                <input placeholder="Code de sécurité" type="text" name="captcha" value="<--?php if(isset($_POST['captcha'])){echo $_POST['captcha'];} ?>" />
                
                <label><a href="#pol_conf">voir la politique de confidentialité</a></label> -->
                
                <?php if(isset($message)){echo $message;} ?>
                
                <input type="submit" name="submit" value="ENVOYER" />
            </form>
            <!-- <div class="pol_conf">
                <a href="front.php?page=contact#contact">X</a>
                <p>Ac ridiculus aptent lacinia? Incididunt porro expedita integer, ipsum? Cumque explicabo, atque, cupidatat consequatur cillum hac. Mus ultricies laborum faucibus.</p>
                <p>Odio, ratione et senectus aliquam. Phasellus sit optio, ducimus, quidem lorem aute, cubilia. Leo! Culpa faucibus! Molestias morbi, class, sit.</p>
            </div> -->
        </div>
    </section>

    <script src="footer.js"></script>
    
</body>
</html>