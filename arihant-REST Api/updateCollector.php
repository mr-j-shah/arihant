<?php 
    header("Access-Control-Allow-Headers: Authorization, Content-Type");
    header("Access-Control-Allow-Origin: *");
    header('content-type: application/json; charset=utf-8');
    header("Access-Control-Allow-Headers: X-Requested-With, Content-Type, Origin, Cache-Control, Pragma, Authorization, Accept, Accept-Encoding");
    include("include/config.php");
    if ($conn->connect_error) {
        die("Connection Failed". $conn->connect_error);
    }
    else{
        
        $_POST= json_decode(file_get_contents('php://input'),true);
        if ($_SERVER["REQUEST_METHOD"]=='POST' && isset($_POST)) {
            $name = $_POST["name"];
            $mobile = $_POST["mobile"];
            $address = $_POST["address"];
            $email = $_POST["email"];
            
            
            $sql="UPDATE `user_table` SET `name`='$name',`mobile`='$mobile',`address`='$address' WHERE `email`='$email'";
            
            $result = $conn->query($sql) or die("Error in Selecting " . mysqli_error($conn));

	        if ($result) { 
	            
                echo "Success";	
        	} else {
		        echo "Sorry";	
            }
        }
        else{
            echo"Unauther access";
        }
    }
    
    $conn->close();
?>