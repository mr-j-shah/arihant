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
              
            $sql="SELECT user_table.name,user_table.email,user_table.mobile,user_table.address,user_table.image,SUM(collection.collectionamount) AS dailyCollAmount FROM collection RIGHT JOIN user_table ON collection.email = user_table.email GROUP BY collection.email";
            $result = $conn->query($sql) or die("Error in Selecting " . mysqli_error($conn));
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