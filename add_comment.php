<?php
session_start();

// Проверка авторизации пользователя
if (!isset($_SESSION['login'])) {
    $response = array('success' => false, 'message' => 'Только авторизованные пользователи могут оставлять комментарии.');
    echo json_encode($response);
    exit;
}

$conn = new PDO('mysql:host=localhost; dbname=test', 'root', '');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST["comment"]) && isset($_POST["page_id"])) {
        $username = $_SESSION['login'];
        $comment = $_POST["comment"];
        $page_id = $_POST["page_id"];

        // Добавление комментария в базу данных
        $stmt = $conn->prepare("INSERT INTO comments (username, comment_text, page_id) VALUES (:username, :comment, :page_id)");
        $stmt->execute([
            "username" => $username,
            "comment" => $comment,
            "page_id" => $page_id
        ]);

        // Возврат успешного ответа
        $response = array('success' => true);
        echo json_encode($response);
        exit;
    }
}
?>