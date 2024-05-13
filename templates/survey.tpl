<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Survey Interattivo</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            padding: 10px;
        }

        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
            width: 50%;
            margin: 20px auto;
        }

        h1 {
            text-align: center;
        }

        .question {
            margin: 20px 0;
        }

        .question h2 {
            font-size: 20px;
        }

        .options input {
            margin-right: 10px;
        }

        .submit-btn {
            display: block;
            width: 100%;
            padding: 10px;
            border: none;
            background-color: #007BFF;
            color: white;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
        }

        .submit-btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Partecipa al Survey</h1>
    <form id="surveyForm" method="post">
        <div class="question">
            <h2>Quanto è importante l'innovazione tecnologica per te?</h2>
            <div class="options">
                <label><input type="radio" name="question1" value="Molto importante"> Molto importante</label><br>
                <label><input type="radio" name="question1" value="Importante"> Importante</label><br>
                <label><input type="radio" name="question1" value="Moderatamente importante"> Moderatamente importante</label><br>
                <label><input type="radio" name="question1" value="Poco importante"> Poco importante</label><br>
                <label><input type="radio" name="question1" value="Per niente importante"> Per niente importante</label>
            </div>
        </div>
        <div class="question">
            <h2>Quale sistema operativo preferisci?</h2>
            <div class="options">
                <label><input type="radio" name="question2" value="Windows"> Windows</label><br>
                <label><input type="radio" name="question2" value="MacOS"> MacOS</label><br>
                <label><input type="radio" name="question2" value="Linux"> Linux</label><br>
                <label><input type="radio" name="question2" value="Altro"> Altro</label>
            </div>
        </div>
        <button type="submit" class="submit-btn">Invia Risposte</button>
    </form>
</div>

<script>
    document.getElementById('surveyForm').onsubmit = function(event) {
        event.preventDefault();
        var formData = new FormData(event.target);
        var data = {};
        for (var pair of formData.entries()) {
            data[pair[0]] = pair[1];
        }
        console.log(data); // Per visualizzare le risposte nel console log del browser
        alert('Grazie per aver partecipato al survey!');
    };
</script>
</body>
</html>
