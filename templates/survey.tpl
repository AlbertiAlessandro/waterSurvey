<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Survey Interattivo</title>
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
        <?php foreach ($domande as $domanda): ?>
        <div class="question">
            <h2><?php echo htmlspecialchars($domanda['domanda']); ?></h2>
            <div class="options">
                <?php if ($domanda['tipo'] == 2): ?>
                <!-- Campo di testo per domande a risposta aperta -->
                <label>
                    <input type="text" name="question<?php echo $domanda['id']; ?>" placeholder="Inserisci una risposta">
                </label>
                <?php elseif (isset($opzioni[$domanda['id']])): ?>
                <!-- Radio buttons per domande a risposta chiusa -->
                <?php foreach ($opzioni[$domanda['id']] as $opzione): ?>
                <label>
                    <input type="radio" name="question<?php echo $domanda['id']; ?>" value="<?php echo htmlspecialchars($opzione['risposta']); ?>">
                    <?php echo htmlspecialchars($opzione['risposta']); ?>
                </label><br>
                <?php endforeach; ?>
                <?php else: ?>
                <!-- Messaggio di debug: nessuna risposta trovata per la domanda corrente -->
                <p>Errore: Nessuna risposta trovata per la domanda ID <?php echo htmlspecialchars($domanda['id']); ?></p>
                <?php endif; ?>
            </div>
        </div>
        <?php endforeach; ?>
        <a href="index.php?action=finish&id=<?= $id_survey?>"><button type="submit" class="submit-btn">Invia Risposte</button></a>
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
        window.location.href = 'index.php'; // Modifica 'index.php' con l'URL della tua pagina iniziale
        
    };
</script>
</body>
</html>
