<?php
// config.php
$SITE_ROOT = dirname(__FILE__);
$uploaddir = $SITE_ROOT . '/style/img/upload/';
$root = 'style/img/upload/';

$conn = new PDO('mysql:host=localhost; dbname=test', 'root', '');

// registration.php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST["login"]) && isset($_POST["email"]) && isset($_POST["pass"])) {
        // Подготовка и выполнение запроса для создания пользователя
        $stmt = $conn->prepare("INSERT INTO users (login, email, pass, role) VALUES (:login, :email, :pass, :role)");
        $stmt->execute([
            "login" => $_POST["login"],
            "email" => $_POST["email"],
            "pass" => password_hash($_POST["pass"], PASSWORD_DEFAULT), // Хеширование пароля
            "role" => 1 // Предполагаем, что роль по умолчанию - 1
        ]);

        // Проверка, был ли пользователь успешно добавлен в базу данных
        if ($stmt->rowCount() > 0) {
            // Начинаем сессию
            session_start();

            // Сохраняем информацию о пользователе в сессии
            $_SESSION['login'] = $_POST["login"];
            $_SESSION['email'] = $_POST["email"];

            // Перенаправляем пользователя на главную страницу
            header("Location: /");
            exit;
        } else {
            echo "Ошибка при создании аккаунта. Пожалуйста, попробуйте еще раз.";
        }
    }
}
?>