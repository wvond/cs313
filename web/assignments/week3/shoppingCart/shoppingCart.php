<!DOCTYPE html>
<html lang='en'>

<head>
	<meta charset='utf-8' />
	<meta name='viewport' content='width=device-width, initial-scale=1.0'>
	<title>Purchase Pictures</title>
	<link rel='stylesheet' href='https://pacific-refuge-37041.herokuapp.com/shared/header-nav.css'>
	<link rel='stylesheet' href='https://pacific-refuge-37041.herokuapp.com/shared/boot-css/bootstrap-grid.css'>
	<link rel="stylesheet" href="css/bootstrap.min.css" />
	<link rel="stylesheet" href="css/demo.css" />
	<link rel="stylesheet" href="css/main.css" />
</head>

<body>
	<?php include 'https://pacific-refuge-37041.herokuapp.com/shared/header.php'; ?>

	<div id="cart-container">
		<div class="col-md-7">
			<div class="page-header">
				<h1>Select a product</h1>
			</div>
			<?php
			//Loading the products.xml file
			if (file_exists("products.xml")) {
				$file = "products.xml";
			} else {
				die("No products.xml file found");
			}

			//Loading the config.xml file
			if (file_exists("config.xml")) {
				$config_file = "config.xml";
			} else {
				die("No config.xml file found");
			}

			//Initializing the config settings
			$xml_config = simplexml_load_file($config_file);
			$currency_symbol = $xml_config->configuration->currency_symbol;
			$currency_code = $xml_config->configuration->currency_code;

			$xml = simplexml_load_file($file);

			$script_products = "";
			$script_product_prices = "";

			//Loop through the products defined in the products.xml file
			foreach ($xml->product as $r) {
				$script_products .= "products[" . ($r->id) . "]=\"" . ($r->name) . "\";\n";
				$script_product_prices .= "product_prices[" . ($r->id) . "]=\"" . ($r->price) . "\";\n";
			?>
				<div class="product_display">
					<img src="<?php echo $r->image_link ?>">
					<p class="lead">
						<h3 class="pull-right no-top-margin"><?php echo $currency_symbol; ?><?php echo $r->price; ?></h3>
						<h3><?php echo $r->name; ?></h3>
					</p>
					<p>
						<?php echo $r->description; ?>
					</p>
					<br />
					<?php
					if (trim($r->details_link) != "") {
					?>
						<a target="_blank" href="http://<?php echo str_replace("http://", "", trim($r->details_link)); ?>" class="btn btn-xs btn-default add-right-margin">Details</a>
					<?php
					}
					?>
					<a class="btn btn-xs btn-info" href="javascript:AddToCart(<?php echo $r->id; ?>)">Add to Cart</a>
				</div>
				<hr />

			<?php
			}
			?>
			<script>
				var currency_symbol = "<?php echo $currency_symbol; ?>";
				var products = Array();
				<?php echo $script_products; ?>
				var product_prices = Array();
				<?php echo $script_product_prices; ?>
			</script>

		</div>
		<div class="col-md-1">
		</div>
		<div class="col-md-4">
			<br /><br />
			<div class="panel panel-default cart-panel" style="position: fixed">
				<div class="panel-heading">
					<img class="pull-left add-right-margin" height="20" src="images/cart-m.png" />
					<h3 class="pull-left panel-title">Your Cart</h3>
					<div class="clearfix"></div>
				</div>
				<div class="panel-body">
					<div id="Cart">
						The cart is empty!
					</div>
				</div>
			</div>

		</div>
	</div>
	<div class="clearfix"></div>
	<div id="payment-container">
		<div class="page-header">
			<h1>Enter your payment information</h1>
		</div>

		<form id="payment-from" method="POST" action="order.php">
			<input type="hidden" value="1" name="proceed" id="proceed" />
			<input type="hidden" value="" name="products_list" id="products_list" />
			<input type="hidden" value="" name="products_value" id="products_value" />

			Name:
			<input type="text" name="name"><br>
			Email:
			<input type="text" name="email"><br>
			Street Address:
			<input type="text" name="addr1"><br>
			Street Address 2:
			<input type="text" name="addr2"><br>
			City:
			<input type="text" name="city"><br>
			State:
			<input type="text" maxlength="2" name="state"><br>
			Zip Code:
			<input type="number" maxlength="5" name="zip"><br>

			<div class="clearfix"></div>
			<br><br>
			<a href="javascript:GoToCart()" class="btn btn-xs btn-default add-right-margin">Go back to cart</a>
			<a href="javascript:SubmitPaymentForm()" type="button" class="btn btn-xs btn-info">Continue</a>

		</form>
	</div>


	<div id="popup" class="alert alert-warning"></div>
	<script src="js/cart.js"></script>
	<?php include '..../shared/footer.php'; ?>