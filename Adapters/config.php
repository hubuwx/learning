<?php
try{
 $db = new PDO('mysql:host=localhost;dbname=e-learning;charset=utf8', 'root', '');
$db->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}
catch(PDOException $e)
    {
    echo $db . "<br>" . $e->getMessage();
    }
?>