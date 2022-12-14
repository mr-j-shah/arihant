<?php 
    header("Access-Control-Allow-Headers: Authorization, Content-Type");
    header("Access-Control-Allow-Origin: *");
    header('content-type: application/json; charset=utf-8');
    header("Access-Control-Allow-Headers: X-Requested-With, Content-Type, Origin, Cache-Control, Pragma, Authorization, Accept, Accept-Encoding");
    include("include/config.php");
    $_POST = json_decode(file_get_contents('php://input'),TRUE);
    if ($conn->connect_error) {
        die("Connection Failed". $conn->connect_error);
    }
    else{
        if ($_SERVER["REQUEST_METHOD"]=='POST') 
        {
            $id = $_POST["id"];
            $sql = "SELECT `penalty` FROM `client` WHERE id = '$id'";
            echo $sql;
            $response = $conn->query($sql) or die("Error in Selecting " . mysqli_error($conn));
            if ($result) {    
                while($row=$result->fetch_assoc()){
			        $info[]=$row;
		        }
	        } else {<?php 
                header("Access-Control-Allow-Headers: Authorization, Content-Type");
                header("Access-Control-Allow-Origin: *");
                header('content-type: application/json; charset=utf-8');
                header("Access-Control-Allow-Headers: X-Requested-With, Content-Type, Origin, Cache-Control, Pragma, Authorization, Accept, Accept-Encoding");
                include("include/config.php");
               
                if ($conn->connect_error) {
                    die("Connection Failed". $conn->connect_error);
                }
                else{
                     $_POST = json_decode(file_get_contents('php://input'),TRUE);
                     if($_SERVER["REQUEST_METHOD"]=='POST' && isset($_POST["id"])){
                        $id = $_POST["id"];
                        $sql = "SELECT `penalty` FROM `client` WHERE id = '$id'";
                        $updateresult = $conn->query($sql) or die("Error in Selecting " . mysqli_error($conn));
                        while($value=$updateresult->fetch_assoc()){
                             $data[]=$value;
                        }
                        $penalty = $data[0]["penalty"];
                        if(isset($penalty)){
                            $penalty += 1;
                            $sql = "UPDATE `client` SET `penalty`='$penalty' WHERE id = '$id'";
                            $updateresult = $conn->query($sql) or die("Error in Selecting " . mysqli_error($conn));
                            if($updateresult){
                                echo "Success";
                            }
                            else{
                                echo "Error";
                            }
                        }
                        else{
                            echo "Error";
                        }
                     }
                     else{
                        echo "Error";
                    }
                }
            ?>
		        $info[] ="Sorry";	
	        }
	        echo json_encode($info);
        }
    }
?>