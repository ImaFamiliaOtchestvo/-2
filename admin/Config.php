<?php
// config.php
$SITE_ROOT = dirname(__FILE__);
$uploaddir = $SITE_ROOT . '/style/img/upload/';
$root = 'style/img/upload/';

$conn = new PDO('mysql:host=localhost; dbname=test', 'root', '');
?>