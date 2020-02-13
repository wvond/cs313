<?php
session_start();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Fish Records</title>
</head>

<body>
    <h1>See All Fish Records</h1>
    <div>
        <ol>
            <?php
            require "dbConnect.php";
            $db = get_db();

            $fish = $db->prepare("SELECT * FROM fish;");
            $fish->execute();

            while ($row = $fish->fetch(PDO::FETCH_ASSOC)) {
                $id = $row['fish_id'];
                $weight = $row['fish_weight'];
                $time = $row['time_caught'];
                $date = $row['date_caught'];

                echo "<li>Fish #$id weighs $weight pounds and was caught on $date at $time.</li>";
            }
            ?>
        </ol>
    </div>
    <!-- [SEARCH RESULTS] -->
    <div id="results"></div>
</body>

</html>