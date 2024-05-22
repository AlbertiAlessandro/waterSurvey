<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Survey Interattivo</title>

    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.css"  rel="stylesheet" />

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

        .options {
            margin-bottom: 20px;
            position: relative;
            width: 100%;
        }

        input[type="range"] {
            -webkit-appearance: none;
            width: 100%;
            height: 20px;
            background: #d3d3d3;
            border-radius: 10px;
            outline: none;
            opacity: 0.7;
            -webkit-transition: .2s;
            transition: opacity .2s;
        }

        input[type="range"]::-webkit-slider-thumb {
            -webkit-appearance: none;
            appearance: none;
            width: 20px;
            height: 20px;
            background: #007BFF;
            border-radius: 50%;
            cursor: pointer;
            position: relative;
            z-index: 2;
        }

        input[type="range"]::-moz-range-thumb {
            width: 20px;
            height: 20px;
            background: #007BFF;
            border-radius: 50%;
            cursor: pointer;
            position: relative;
            z-index: 2;
        }

        .range-value {
            position: absolute;
            bottom: -25px;
            transform: translateX(-50%);
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
                <?php elseif ($domanda['tipo'] == 3): ?>
                <!-- Scala scorrevole per domande a risposta chiusa -->
                <div class="options">
                    <input type="range" name="question<?php echo $domanda['id']; ?>" min="1" max="7" value="1">
                    <span class="range-value">1</span>
                </div>
                <?php elseif (isset($opzioni[$domanda['id']])): ?>
                <!-- Radio buttons per domande a risposta chiusa non scorrevoli -->
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
        <button data-modal-target="popup-modal" data-modal-toggle="popup-modal" class="block text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800" type="button">Invia Risposte</button>
    </form>
</div>


<div id="popup-modal" tabindex="-1" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
    <div class="relative p-4 w-full max-w-md max-h-full">
        <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
            <button type="button" class="absolute top-3 end-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white" data-modal-hide="popup-modal">
                <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
                </svg>
                <span class="sr-only">Close modal</span>
            </button>
            <div class="p-4 md:p-5 text-center">
                <svg class="mx-auto mb-4 text-gray-400 w-12 h-12 dark:text-gray-200" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20">
                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 11V6m0 8h.01M19 10a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z"/>
                </svg>
                <h3 class="mb-5 text-lg font-normal text-gray-500 dark:text-gray-400">Are you sure you want to submit your answers?</h3>
                <button id="confirm-submit" type="button" class="text-white bg-green-600 hover:bg-green-800 focus:ring-4 focus:outline-none focus:ring-green-300 dark:focus:ring-green-800 font-medium rounded-lg text-sm inline-flex items-center px-5 py-2.5 text-center">
                    Yes, I'm sure
                </button>
                <button data-modal-hide="popup-modal" type="button" class="py-2.5 px-5 ms-3 text-sm font-medium text-gray-900 focus:outline-none bg-white rounded-lg border border-gray-200 hover:bg-gray-100 hover:text-blue-700 focus:z-10 focus:ring-4 focus:ring-gray-100 dark:focus:ring-gray-700 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700">No, cancel</button>
            </div>
        </div>
    </div>
</div>

<script>
    document.querySelectorAll('input[type="range"]').forEach(function(input) {
        var rangeValue = document.createElement('span');
        rangeValue.classList.add('range-value');
        input.parentElement.appendChild(rangeValue);

        input.addEventListener('input', function() {
            var value = input.value;
            var min = input.min || 1;
            var max = input.max || 100;
            var percent = ((value - min) / (max - min)) * 100;
            rangeValue.textContent = value;
            rangeValue.style.left = percent + '%';
        });
    });

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


    document.querySelector('[data-modal-toggle="popup-modal"]').addEventListener('click', function() {
        document.getElementById('popup-modal').classList.remove('hidden');
    });

    document.querySelectorAll('[data-modal-hide="popup-modal"]').forEach(function(el) {
        el.addEventListener('click', function() {
            document.getElementById('popup-modal').classList.add('hidden');
        });
    });

    document.getElementById('confirm-submit').addEventListener('click', function() {
        window.location.href = 'index.php?action=finish&id=<?= $id_survey?>';
    });
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>

</body>
</html>