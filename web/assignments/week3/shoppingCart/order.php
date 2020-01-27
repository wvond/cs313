<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation</title>
    <link rel='stylesheet' type='text/css' href='header-nav.css'>
</head>

<body>
    <div class="header-background">
        <div class="header container">
            <h1>Will Von Doersten's Home Page</h1>
        </div>
    </div>

    <div class="topnav">
        <a href="https://pacific-refuge-37041.herokuapp.com/">Home</a>
        <a href="https://pacific-refuge-37041.herokuapp.com/assignments/assignments.php">Assignments</a>
        <a href="https://www.linkedin.com/in/william-von-doersten/">LinkedIn</a>
    </div>

    <?php
    $name = htmlspecialchars($_POST["name"]);
    $email = htmlspecialchars($_POST["email"]);
    $addr1 = htmlspecialchars($_POST["addr1"]);
    $addr2 = htmlspecialchars($_POST["addr2"]);
    $city = htmlspecialchars($_POST["city"]);
    $state = htmlspecialchars($_POST["state"]);
    $zip = htmlspecialchars($_POST["zip"]);
    $products = $_POST["products_list"];
    $cost = $_POST["products_value"];
    ?>
    <div>
        <h1>Thank you <?php echo $name; ?> for your order.</h1>
        <p>A copy of this confirmation will be sent to <a href=<?= "mailto:$email" ?>><?= $email ?></a></p>
        <p>Your shipping address is:</p>
        <p><?php echo $addr1;
            if ($addr2 != NULL) {
                echo $addr2;
            } ?></p>
        <p><?php echo $city; ?>, <?= $state ?> <?= $zip ?></p>
        <p>Order Summary:</p>
        <p>Products - <?php echo $products."<br>";?></p>
        <p>Order Total: $<?=$cost?></p>
    </div>
</body>

</html>