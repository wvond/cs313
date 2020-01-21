<?php
    // retrieve POST data
    $email = htmlspecialchars($_POST["emailForPHP"]);
    $password = htmlspecialchars($_POST["passwordForPHP"]);

    // do something with the data...
    echo "Here is your email $email, and your password is $password";

?>