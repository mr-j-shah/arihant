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
        if($_SERVER["REQUEST_METHOD"]=='GET'){
            $info = array();
            $sql="SELECT COUNT(id) as NumofAcc FROM `account` WHERE remAmount>0";
            $result = $conn->query($sql) or die("Error in Selecting " . mysqli_error($conn));
    	    if ($result->num_rows > 0) {    
                while($row=$result->fetch_assoc()){
    			    $info["NumofAcc"]=$row["NumofAcc"];
    		    }
    	    } 
    	    else{
    	        $info["NumofAcc"]=0;
    	    }
    	    $sql="SELECT COUNT(id) as NumofClientActive FROM `client` WHERE remainingamount>0";
            $result = $conn->query($sql) or die("Error in Selecting " . mysqli_error($conn));
    	    if ($result->num_rows > 0) {    
                while($row=$result->fetch_assoc()){
    			    $info["NumofClientActive"]=$row["NumofClientActive"];
    		    }
    	    } 
    	    else{
    	        $info["NumofClientActive"]=0;
    	    }
    	    $sql="SELECT COUNT(id) as NumofClient FROM `client`";
            $result = $conn->query($sql) or die("Error in Selecting " . mysqli_error($conn));
    	    if ($result->num_rows > 0) {    
                while($row=$result->fetch_assoc()){
    			    $info["NumofClient"]=$row["NumofClient"];
    		    }
    	    } 
    	    else{
    	        $info["NumofClient"]=0;
    	    }
    	    $sql="SELECT SUM(remAmount) as AmountInMarcket FROM `account`";
            $result = $conn->query($sql) or die("Error in Selecting " . mysqli_error($conn));
    	    if ($result->num_rows > 0) {    
                while($row=$result->fetch_assoc()){
    			    $info["AmountInMarcket"]=$row["AmountInMarcket"];
    		    }
    	    } 
    	    else{
    	        $info["AmountInMarcket"]=0;
    	    }
    	    $sql="SELECT SUM(collectionamount) as collectionToday FROM `collection` WHERE date = CURRENT_DATE";
            $result = $conn->query($sql) or die("Error in Selecting " . mysqli_error($conn));
    	    if ($result->num_rows > 0) {    
                while($row=$result->fetch_assoc()){
    			    $info["collectionToday"]=$row["collectionToday"];
    		    }
    	    } 
    	    else{
    	        $info["collectionToday"]=0;
    	    }
    	    echo json_encode($info);
        }
    }
?>