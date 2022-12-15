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
            $amount = $_POST["amount"];
            $rmamount = $_POST["rmamount"];
            $updatedate = $_POST["updatedate"];
            $noofacc = $_POST["noofacc"];
            
            
            $sql="UPDATE `client` SET `amount`='$amount',`remainingamount`='$rmamount',`updatedate`='$updatedate',`noofacc`='$noofacc' WHERE id = '$id'";
            echo $sql;
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