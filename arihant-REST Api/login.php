<?php
    header("Access-Control-Allow-Headers: Authorization, Content-Type");
    header("Access-Control-Allow-Origin: *");
    header('content-type: application/json; charset=utf-8');
    header("Access-Control-Allow-Headers: X-Requested-With, Content-Type, Origin, Cache-Control, Pragma, Authorization, Accept, Accept-Encoding");
    include("include/config.php");
    if ($conn->connect_error) {
        die("Connection not Possible");
    }
    else {
        $_POST= json_decode(file_get_contents('php://input'),true);
        if ($_SERVER["REQUEST_METHOD"]=='POST') {
            if (isset($_POST["username"]) && isset($_POST["password"])) {
                function validate($data){
                    $data = trim($data);
                    $data = stripslashes($data);
                    $data = htmlspecialchars($data);
                    return $data;
                }
                $username=validate($_POST["username"]);
                $password=validate($_POST["password"]);
                if (empty($username) && empty($password)) {
                    echo "Not Valid";
                }
                else {
                    $sql = "SELECT * FROM user_table WHERE email='$username' AND password='$password'";
                    $result = $conn->query($sql) or die("Error in Selecting " . mysqli_error($conn));
                    if ($result) {    
                        $row = $result->fetch_assoc();
                        if ($row["email"] === $username) {
                            if ($row["password"] === $password) {
                                $info = array("name"=>$row["name"],"email"=>$row["email"],"status"=>"success");
                                echo  json_encode($info);
                            }
                            else {
                                $info = array("status"=>"Wrong Password");
                                echo  json_encode($info);
                            }
                        }
                        else {
                            $info = array("status"=>"User Not Found");
                                echo  json_encode($info);
                        }
                    } else {
                        die("Error in Fetching data");	
                    }                    
                }
            }
            else {
                echo"Unauther access";
            }
        }
        else {
            echo"Unauther access";
        }
    }
?>