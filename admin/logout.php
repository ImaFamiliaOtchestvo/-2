<?
if (isset($_COOKIE["login"])){
    setcookie("login", "", time()-3600);
}
if (isset($_COOKIE["isAdmin"])){
    setcookie("isAdmin", "", time()-3600);
}
if (isset($_COOKIE["rolename"])){
    setcookie("rolename", "", time()-3600);
}
if (isset($_COOKIE["file"])){
    setcookie("file", "", time()-3600);
}
if (isset($_COOKIE["isAdmin"])){
    setcookie("Theme", "", time()-3600);
}
header("Location: /")


?>