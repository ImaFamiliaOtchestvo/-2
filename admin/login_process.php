<?php
// config.php
$SITE_ROOT = dirname(__FILE__);
$uploaddir = $SITE_ROOT . '/style/img/upload/';
$root = 'style/img/upload/';

$conn = new PDO('mysql:host=localhost; dbname=test', 'root', '');

// login_process.php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST["login"]) && isset($_POST["pass"])) {
        $login = $_POST["login"];
        $pass = $_POST["pass"];

        // Получение пользователя из базы данных
        $stmt = $conn->prepare("SELECT * FROM users WHERE login = :login");
        $stmt->execute(["login" => $login]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        // Проверка пароля
        if ($user && password_verify($pass, $user['pass'])) {
            // Начинаем сессию
            session_start();

            // Сохраняем информацию о пользователе в сессии
            $_SESSION['login'] = $user['login'];
            $_SESSION['email'] = $user['email'];

            // Перенаправляем пользователя на главную страницу
            header("Location: /");
            exit;
        } else {
            echo "Неверный логин или пароль. Пожалуйста, попробуйте еще раз.";
        }
    }
}
?>