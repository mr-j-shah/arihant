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
            $name = $_POST["name"];
            $doj = $_POST["doj"];
            $address = $_POST["address"];
            $mobileno = $_POST["mobileno"];
            $amount = $_POST["amount"];
            $updatedate = $_POST["updatedat"];
            $noofacc = $_POST["noofacc"];
            $penalty = $_POST["penalty"];
            $remainingamount = $_POST["remainingamount"];
            
            $sql="INSERT INTO `client`(`id`, `name`, `doj`, `address`, `mobileno`, `amount`,   `penalty`,`remainingamount`,`updatedate`,`noofacc`) VALUES ('$id','$name','$doj','$address','$mobileno','$amount','$penalty','$remainingamount','$doj','$noofacc')";
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