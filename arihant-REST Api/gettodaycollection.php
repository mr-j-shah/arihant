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
        if ($_SERVER["REQUEST_METHOD"]=='POST' && isset($_POST["email"]) && isset($_POST["date"])) 
        {

            $email = $_POST["email"];
            $usersql = "SELECT * FROM user_table WHERE email='$email'";
            $updateresult = $conn->query($usersql) or die("Error in Selecting " . mysqli_error($conn));
            while($value=$updateresult->fetch_assoc()){
    			 $data[]=$value;
    		}
            if( $data[0]["email"]===$email )
            {
    	        $sql="SELECT * FROM `collection` WHERE id = '$id' AND email = '$email'";
    
                $result = $conn->query($sql) or die("Error in Selecting " . mysqli_error($conn));
    	        if ($result) {    
                    while($row=$result->fetch_assoc()){
    			        $info[]=$row;
    		        }
    	        } else {
    		        $info[] ="Sorry";	
    	        }
    	        echo json_encode($info);
    	       ////echo "Authenticat";
            }
            else{
                echo "Unauther Access";
            }
        }
        else{
            echo "Unauther Access";
        }
        $conn->close();
    }
?>