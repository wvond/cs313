<?php

  echo "<!DOCTYPE html>
  <html lang='en'>
  
  <head>
      <meta charset='utf-8' />
      <meta name='viewport' content='width=device-width, initial-scale=1.0'>
      <title>Home Page</title>
      <link rel='stylesheet' type='text/css' href='shared/header-nav.css'>
      <link rel='stylesheet' type='text/css' href='shared/boot-css/bootstrap-grid.css'>
  </head>
  
  <body>'";

  include 'shared/header.php';

  echo '<div class="main-content">
  <h2>About The Author:</h2>
  </div>
  <div class="col">
  <h3>Favorite Quote:</h3>
  <img src="shared/images/mcgregor.jpg">
  </div>

  <div class="col">
  <h3>From Austin, Texas</h3>
  <img src="shared/images/atx.jpg">
  </div>';

  include 'shared/footer.php';
  
  echo '</body>

  </html>';

?>