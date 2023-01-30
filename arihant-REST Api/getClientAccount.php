<?php 
    header("Access-Control-Allow-Headers: Authorization, Content-Type");
    header("Access-Control-Allow-Origin: *");
    header('content-type: application/json; charset=utf-8');
    header("Access-Control-Allow-Headers: X-Requested-With, Content-Type, Origin, Cache-Control, Pragma, Authorization, Accept, Accept-Encoding");
    include("include/config.php");
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    else {
        $_POST = json_decode(file_get_contents('php://input'),TRUE);
        if ($_SERVER["REQUEST_METHOD"]=='POST' && isset($_POST["clientid"])) 
        {
              
            $id = $_POST["clientid"];
            $usersql = "SELECT * FROM `account` WHERE id ='$id'";
            $result = $conn->query($usersql) or die("Error in Selecting " . mysqli_error($conn));
            if ($result->num_rows > 0) {    
                    while($row=$result->fetch_assoc()){
    			        $info[]=$row;
    		        }
    	        } else {
    		        $info = array();	
    	        }
    	        echo json_encode($info);
            
            
        }
        else{
            echo "Unauther Access";
        }
        $conn->close();
    }
?>