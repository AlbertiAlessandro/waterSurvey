<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f2f2f2;
}

.title {
    text-align: center;
    margin-top: 50px;
    color: #007bff;
}

.container {
    width: 300px; /* Lunghezza desiderata */
    margin: 0 auto; /* Centrare il container */
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.subtitle {
    text-align: center;
    margin-bottom: 20px;
    color: #666;
}

form {
    display: flex;
    flex-direction: column;
}

input[type="text"],
input[type="password"],
input[type="email"]{
    margin-bottom: 15px;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
    width: calc(100% - 10px); /* Larghezza meno il margine */
}

input[type="submit"] {
    margin-bottom: 15px;
    padding: 8px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color: #0056b3;
}

    </style>
</head>
<body>
    <h1 class="title">Registrazione</h1>
    <div class="container">
        <form action="index.php?action=insert_user" method="post">
            <input name="username" type="text" placeholder="Username">
            <input name="password" type="password" placeholder="Password">
            <input name="nome" type="text" placeholder="Nome">
            <input name="cognome" type="text" placeholder="Cognome">
            <input name="email" type="email" placeholder="Email">
            <input type="submit">
        </form>
        <button onclick='change()'>back</button>
    </div>
</body>
<script>
function change(){
window.location.href='index.php'
}
</script>
</html>
