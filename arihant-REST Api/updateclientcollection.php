<?php
    $sql1 = "SELECT  `days` , `remAmount` FROM `account` WHERE accountno = '$accountno'";
    $updateresult = $conn->query($sql1) or die("Error in Selecting " . mysqli_error($conn));
    while($value=$updateresult->fetch_assoc()){
        $data[]=$value;
    }
    $days = $data[0]["days"];
    $rmamount = $data[0]["remAmount"];
    $days-=1;
    $rmamount-=$collectionamount;
    $sql="UPDATE `account` SET `days`='$days',`remAmount`='$rmamount' WHERE accountno = '$accountno'";
    $result = $conn->query($sql) or die("Error in Selecting " . mysqli_error($conn));
    
    $sql1 = "SELECT  `remainingamount` FROM `client` WHERE id = '$id'";
    
    $updateresult = $conn->query($sql1) or die("Error in Selecting " . mysqli_error($conn));
    while($value=$updateresult->fetch_assoc()){
        $data1[]=$value;
    }
    
    $rmamount = $data1[0]["remainingamount"];
    $rmamount-=$collectionamount;
    $sql="UPDATE `client` SET `remainingamount`='$rmamount' WHERE id = '$id'";
    $result = $conn->query($sql) or die("Error in Selecting " . mysqli_error($conn));
?>