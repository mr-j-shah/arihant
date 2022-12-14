<?php
    $sql = "SELECT  `days` , `remainingamount` FROM `client` WHERE id = '$id'";
    $updateresult = $conn->query($sql) or die("Error in Selecting " . mysqli_error($conn));
    while($value=$updateresult->fetch_assoc()){
        $data[]=$value;
    }
    $days = $data[0]["days"];
    $rmamount = $data[0]["remainingamount"];
    $days-=1;
    $rmamount-=$collectionamount;
    $sql="UPDATE `client` SET `days`='$days',`remainingamount`='$rmamount' WHERE id = '$id'";
    $result = $conn->query($sql) or die("Error in Selecting " . mysqli_error($conn));
?>