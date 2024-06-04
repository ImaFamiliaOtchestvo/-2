<?php
$conn = new PDO('mysql:host=localhost; dbname=test', 'root', '');

// Получение идентификатора страницы из GET-параметра
$page_id = $_GET['page_id'];

// Получение комментариев для текущей страницы из базы данных
$stmt = $conn->prepare("SELECT * FROM comments WHERE page_id = :page_id ORDER BY created_at DESC");
$stmt->execute(["page_id" => $page_id]);
$comments = $stmt->fetchAll(PDO::FETCH_ASSOC);

foreach ($comments as $comment) {
    echo '<div class="comment">';
    echo '<h3>' . htmlspecialchars($comment['username']) . '</h3>';
    echo '<p>' . nl2br(htmlspecialchars($comment['comment_text'])) . '</p>';
    echo '</div>';
}
?>

<style>
.comment p {
    color: white;
}
.comment h3{
    color: #ff6600;
}
</style>