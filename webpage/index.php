<!DOCTYPE html>
<html lang="en">
<head>
    <title> Trucorp-2.0 </title>
</head>
<body>
<table>
<h1> Trucorp-Web-2.0 </h1>
     <tr>
     <th> ID </th>
     <th> Nama </th>
     <th> Kantor </th>
    </tr>
    <?php
        $count =0;
        $conn = mysqli_connect("127.0.0.1" , "root" , "adam" ,"Trucorp");
        if ($conn-> connect_error) {
            die("Connection Failed:" . $conn-> connect_error);
        }

        $sql = "SELECT ID , Nama , Kantor from users";
        $result = $conn-> query($sql);

        if ($result-> num_rows > 0){
            while ($row = $result-> fetch_assoc()) {
                $count++;
		echo "<tr><td>" . $row["ID"] . "</td><td>" . $row["Nama"] . "</td><td>" . $row["Kantor"] . "</td></tr><br>";
            }
            echo "</table>";
        }

        else{
            echo "0 result";
        }
        echo "<br>";
        echo "Total jumlah user yang ada di database : " . $count . " user(s)" ;
        $conn->close();
    ?>

</table>
</body>
</html>
