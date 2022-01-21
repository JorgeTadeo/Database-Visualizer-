 <!DOCTYPE html>
<html>
  <head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <meta charset="UTF-8">
    <title></title>
	<script>
	$(document).ready(function(){
	  $("#btn1").click(function(){
		$("tr[target='ItemOrder-row-0']").css("background-color", "yellow");
		$("tr[target='ItemOrder-row-1']").css("background-color", "yellow");
		$("tr[target='ItemOrder-row-2']").css("background-color", "yellow");
		$("tr[target='ItemOrder-row-3']").css("background-color", "yellow");
	  });
	});
	
	$(document).ready(function(){
	  $("#btn2").click(function(){
		$("tr[target='customer-row-0']").css("background-color", "red");
	  });
	});
	
	$(document).ready(function(){
	  $("#btn3").click(function(){
		$("tr[target='item-row-0']").children("td[target='item-col-0']").css("background-color", "blue");
		$("tr[target='item-row-0']").children("td[target='item-col-1']").css("background-color", "blue");
		$("tr[target='item-row-1']").children("td[target='item-col-0']").css("background-color", "blue");
		$("tr[target='item-row-1']").children("td[target='item-col-1']").css("background-color", "blue");
		$("tr[target='item-row-2']").children("td[target='item-col-0']").css("background-color", "blue");
		$("tr[target='item-row-2']").children("td[target='item-col-1']").css("background-color", "blue");

	  });
	});
	
		$(document).ready(function(){
	  $("#btn4").click(function(){
		$("tr[target='item-row-0']").children("td[target='item-col-0']").css("background-color", "green");
		$("tr[target='item-row-0']").children("td[target='item-col-1']").css("background-color", "green");
		$("tr[target='item-row-1']").children("td[target='item-col-0']").css("background-color", "green");
		$("tr[target='item-row-1']").children("td[target='item-col-1']").css("background-color", "green");
		$("tr[target='item-row-2']").children("td[target='item-col-0']").css("background-color", "green");
		$("tr[target='item-row-2']").children("td[target='item-col-1']").css("background-color", "green");

	  });
	});
</script>
  </head>
  <style>
  table, th, td {
	  border: 1px solid black;
	}
  </style>
	<body>
	<h1>An example of Database Visualization.</h1>

	<h2>The Database</h2>
	<p>Suppose we have a customer who has an email, id and password. Each customer can place an order, which is associated with a customer, item, confirmation number and date placed. Each item has a name, price and item id.</p> 
	
	<h2>The Database Tables</h2>
<?php

	// return connection to database
	function connect() {
		$servername = "us-cdbr-east-02.cleardb.com";
		$username = "bee6a3f45e7c13";
		$password = "e4f67d27";
		$dbname = "heroku_7644f7be0261fcc";

		return	$conn = new mysqli($servername, $username, $password, $dbname);
	}
	// prints all the column names of the table
	function printColumns($var){
		$sql = "SHOW COLUMNS FROM $var";
		$conn = connect();
		$result = $conn->query($sql);
		echo "<tr>";
		while($row = mysqli_fetch_array($result)){
			echo "<th>". $row['Field'] . "</th>";
		}
		echo "</tr>";
	}
	// prints all the rows of each column
	function printRows1($row, $columns, $counter, $tableName){
		$columns = $columns - 1;
		for ($i = 0; $i < count($row); $i++)  {	
			if ($i == 0) {
				echo "<tr target=$tableName-row-$counter><td target=$tableName-col-$i>" . $row[$i] ."</td>";
			}else if ($i != $columns){
				echo  "<td target=$tableName-col-$i>" . $row[$i]. "</td> ";	
			}else
				echo "<td target=$tableName-col-$i>" . $row[$i] ."</td></tr>" ;
			}
	}
	
	// prints contents of a table
	function printTable($tableName, $columns){
		$sql = "SELECT * FROM $tableName";
		$conn = connect();
		$result = $conn->query($sql);
		$counter = 0;
		if($conn->connect_error) {
		  die("Connection failed: " . $conn->connect_error);
		  exit();
		} else if ($result) {
		  echo "<table><caption>" . $tableName . " Table </caption>";
		  printColumns($tableName);
		  while ($row = $result->fetch_row()) {
			  printRows1($row, $columns, $counter++, $tableName);
			  
		  }
		   echo "</table>";
		  // Free result set
		  $result -> free_result();
		} else {
		  echo "failure";
		}
	}
	printTable("ItemOrder", 4);
	printTable("customer", 3);
	printTable("item", 3);
?> 
	<h2> Example Queries </h2>
	<ol>
		<li>SELECT * FROM ItemOrder; <button id="btn1">Query</button></li>
		<li>SELECT * FROM customer WHERE Email = 'Guest@mail.com'; <button id="btn2">Query</button></li>
		<li>SELECT Name, Price FROM item WHERE Price > 9.99; <button id="btn3">Query</button></li>
		<li>SELECT Name, Price FROM item, ItemOrder, customer WHERE Email = 'Guest@mail.com' AND customer.CustomerID = ItemOrder.CustomerID AND ItemOrder.ItemID = item.ItemID;  <button id="btn4">Query</button></li>
	</ol>

	<h2> English Translation </h2>
	<ol>
		<li>Print all items.</li>
		<li>Print the customer who's email is "Guest@mail.com".</li>
		<li>Print the name and price of items which price is greater than 9.99.</li>
		<li>Print the name and price of all the items from "Guest@mail.com".
	</ol>
	</body>
</html>
