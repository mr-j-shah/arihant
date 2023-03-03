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
            $id = $_POST["id"];
            $collectionid = $_POST["collectionid"];
            $date = $_POST["date"];
            $email = $_POST["email"];
            $collectionamount= $_POST["collectionamount"];
            $accountno = $_POST["accountno"];
            include("updateclientcollection.php");
            $sql="INSERT INTO `collection`(`collectionid`, `date`, `id`, `email`, `collectionamount`, `accountno`) VALUES ('$collectionid','$date','$id','$email','$collectionamount','$accountno')";
            $result = $conn->query($sql) or die("Error in Selecting " . mysqli_error($conn));
	        if ($result) { 
	            
                echo "Success";	
        	} else {
		        echo "Error";	
            }
        }
        else{
            echo"Unauther access";
        }
    }
    
    $conn->close();
?>