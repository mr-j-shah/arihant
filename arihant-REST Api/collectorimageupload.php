<?php 
$return["error"] = false;
$return["msg"] = "";
$return["success"] = false;
//array to return

if(isset($_FILES["file"])){
    $target_dir = "files/"; 
    $filename = $_FILES["file"]["name"]; 
    $savefile = "$target_dir/$filename";
    
    if(move_uploaded_file($_FILES["file"]["tmp_name"], $savefile)) {
        $return["error"] = false;
        $return["success"] = true;
        $return["msg"] = "Success";
        
    }else{
        $return["error"] = true;
        $return["msg"] =  "Error during saving file.";
    }
}else{
    $return["error"] = true;
    $return["msg"] =  "No file is sublitted.";
}

header('Content-Type: application/json');
// tell browser that its a json data
echo json_encode($return);
//converting array to JSON string
?>