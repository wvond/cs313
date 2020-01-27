<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Order Confirmation</title>
</head>
<body>
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
      <p><?php echo $addr1; if($addr2 != NULL){echo $addr2;} ?></p>
      <p><?php echo $city; ?>, <?=$state?> <?=$zip?></p>
      <p>Order Summary:</p>
      <p>Products - 
      <?php echo "$products <br>";?> </p>
      <p>Cost - 
      <?php foreach ($cost as $value) {
          echo "$value <br>";
      } ?> </p>
      
    </div>
  </body>
</html>