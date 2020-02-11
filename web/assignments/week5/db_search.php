<!DOCTYPE html>
<html>

<head>
    <title>
        AJAX Search Example
    </title>
    <script>
        function fetch() {
            // GET SEARCH TERM
            var data = new FormData();
            data.append('search', document.getElementById("search").value);
            data.append('ajax', 1);

            // AJAX
            var xhr = new XMLHttpRequest();
            xhr.open('POST', "search.php", true);
            xhr.onload = function() {
                if (xhr.status == 403 || xhr.status == 404) {
                    alert("ERROR LOADING FILE!");
                } else {
                    var results = JSON.parse(this.response),
                        wrapper = document.getElementById("results");
                    wrapper.innerHTML = "";
                    if (results.length > 0) {
                        for (var res of results) {
                            var line = document.createElement("div");
                            line.innerHTML = res['name'] + " - " + res['email'];
                            wrapper.appendChild(line);
                        }
                    } else {
                        wrapper.innerHTML = "No results found";
                    }
                }
            };
            xhr.send(data);
            return false;
        }
    </script>
</head>
<?php
    require("dbConnect.php");
    $db = get_db();
?>

<body>
    <!-- [SEARCH FORM] -->
    <form onsubmit="return fetch();">
        <h1>
            Search for fish by name
        </h1>
        <input type="text" id="search" required />
        <input type="submit" value="Search" />
    </form>

    <!-- [SEARCH RESULTS] -->
    <div id="results"></div>
</body>

</html>