<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Регистрация</title>
</head>
<body>

<div class="container" style="width:400px;margin-top:20%;">
    <h1>Регистрация</h1>
    <form method="POST" action="registration.php">
        <div class="mb-3">
            <label for="login" class="form-label">Логин</label>
            <input type="text" name="login" class="form-control" id="login" required>
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" name="email" class="form-control" id="email" required>
        </div>
        <div class="mb-3">
            <label for="pass" class="form-label">Пароль</label>
            <input type="password" name="pass" class="form-control" id="pass" required>
        </div>
        <button type="submit" class="btn btn-primary">Зарегистрироваться</button>
    </form>
</div>

</body>
</html>