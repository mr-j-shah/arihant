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
                $sql="SELECT SUM(collectionamount) as total, date FROM `collection` WHERE date >= curdate() - INTERVAL 5 day GROUP BY date";
    
                $result = $conn->query($sql) or die("Error in Selecting " . mysqli_error($conn));
    	        if ($result->num_rows > 0) {    
                    while($row=$result->fetch_assoc()){
    			        $info[]=$row;
    		        }
    	        } else {
    		        $info = array();	
    	        }
    	        $return[0]=$info;
    	        $info = array();
    	        $sql="SELECT SUM(collectionamount) as collectionToday,email FROM `collection` WHERE date = CURRENT_DATE GROUP by email";
                $result = $conn->query($sql) or die("Error in Selecting " . mysqli_error($conn));
    	        if ($result->num_rows > 0) {    
                    while($row=$result->fetch_assoc()){
    			        $info[]=$row;
    		        }
    	        } else {
    		        $info = array();	
    	        }
    	        $return[1]=$info;
    	        
    	        $info = array();
    	        $sql="SELECT SUM(amount) as total, doc as date FROM `account` WHERE doc >= curdate() - INTERVAL 5 day GROUP BY doc";
                $result = $conn->query($sql) or die("Error in Selecting " . mysqli_error($conn));
    	        if ($result->num_rows > 0) {    
                    while($row=$result->fetch_assoc()){
    			        $info[]=$row;
    		        }
    	        } else {
    		        $info = array();	
    	        }
    	        $return[2]=$info;
    	        echo json_encode($return);
        }
        else{
            echo "Unauther Access";
        }
        $conn->close();
    }
?>