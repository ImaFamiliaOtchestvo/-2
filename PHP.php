<?php
// display_comments.php
$page = $_GET['page'];
$dbh = $conn->prepare("SELECT * FROM comments WHERE page = :page");
$dbh->execute(["page" => $page]);
$comments = $dbh->fetchAll(PDO::FETCH_ASSOC);

foreach ($comments as $comment) {
    echo "<div class='comment'>";
    echo "<h3>" . htmlspecialchars($comment['user']) . "</h3>";
    echo "<p>" . htmlspecialchars($comment['comment']) . "</p>";
    echo "</div>";
}

$conn = null;
?>