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
        
        if ($_SERVER["REQUEST_METHOD"]=='GET') 
        {
              
            $sql="SELECT COUNT(id) as NumofAcc FROM `account` WHERE remAmount>0";
            $result = $conn->query($sql) or die("Error in Selecting " . mysqli_error($conn));
    	    if ($result->num_rows > 0) {    
                while($value=$updateresult->fetch_assoc()){
    			 $data[]=$value;
    		    }
    		    $info["NumofAcc"] = $data[0]["NumofAcc"];
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
