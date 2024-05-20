<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Verifica Codice</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            width: 300px;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h1 {
            font-size: 24px;
            margin-bottom: 20px;
            color: #333;
        }

        input[type="text"], input[type="password"] {
            margin-bottom: 15px;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: calc(100% - 16px);
        }

        button, input[type='submit'] {
            margin-bottom: 10px;
            padding: 8px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: calc(100% - 16px);
        }

        button:hover {
            background-color: #0056b3;
        }

        #result {
            margin-top: 10px;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Verifica Codice</h1>
        <p>Inserisci il codice che hai ricevuto nella mail</p>
        <form id="codeForm" method='post' action='index.php?action=resetpassword'>
            <input name='code' id="codeInput" type="text" placeholder="Codice" required>
            <input name='email' value='<?=$email?>' hidden>
            <input type='submit'>
        </form>
        <button type="button" onclick="reloadPage()">Riinvia Mail</button>
        <button type="button" onclick="goBack()">Back</button>
    </div>

    <script>
        function reloadPage() {
            location.reload();
        }
        function goBack() {
            window.location.href = 'index.php';
        }
    </script>
</body>
</html>
