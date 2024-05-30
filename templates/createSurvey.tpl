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

    </style>
</head>
<body onload="start()">
<div class="container">
    <h1>Create survey</h1>
    <form id="surveyForm" method="post" action="index.php?action=addsurvey" onsubmit="return controllo()">
        <button data-modal-target="popup-modal"  data-modal-toggle="popup-modal" class="w-full block text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800" type="submit">Submit replies</button>
    <div>
    <label for="title">
        <input required type="text" name="titolo" placeholder="Insert the title" class="w-full p-2 border rounded-lg shadow-sm focus:ring focus:ring-blue-500 focus:outline-none">
    </label>
    </div>
    <div>
    <label for="title">
        <input required type="text" name="descrizione" placeholder="Insert the description" class="w-full p-2 border rounded-lg shadow-sm focus:ring focus:ring-blue-500 focus:outline-none">
    </label>
    </div>
</form>
</div>
<div class="container items-center">
    <button onclick="add(1)" type="button" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800">Add open question</button>
    <button onclick="add(2)" type="button" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800">Add close question</button>
    <button onclick="add(3)" type="button" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800">Add autovalutation</button>
</div>
       <!--  <?php foreach ($domande as $domanda): ?>
        <div class="question">
            <p class="w-full text-3xl font-semibold leading-normal text-gray-900 dark:text-white"><?php echo htmlspecialchars($domanda['domanda']); ?></p>

            <div class="options">
                <?php if ($domanda['tipo'] == 2): ?>
                 Campo di testo per domande a risposta aperta 
                <label>
                    <input  type="text" name="question<?php echo $domanda['id']; ?>" placeholder="Inserisci una risposta" class="w-full p-2 border rounded-lg shadow-sm focus:ring focus:ring-blue-500 focus:outline-none">
                </label>
                <?php elseif ($domanda['tipo'] == 3): ?>
                 Scala scorrevole per autovalutazione 
                <div class="relative mb-6">
                    <input id="range-<?php echo $domanda['id']; ?>" name="question<?php echo $domanda['id']; ?>" type="range" min="0" max="8" value="4" class="w-full h-2 bg-gray-200 rounded-lg appearance-none cursor-pointer dark:bg-gray-700">
                    <span class="text-sm text-gray-500 dark:text-gray-400 absolute start-0 -bottom-6">Min (0)</span>
                    <span class="text-sm text-gray-500 dark:text-gray-400 absolute left-1/2 -translate-x-1/2 -bottom-6">Medium (4)</span>
                    <span class="text-sm text-gray-500 dark:text-gray-400 absolute end-0 -bottom-6">Max (8)</span>
                </div>
                <?php elseif (isset($opzioni[$domanda['id']])): ?>
                 Radio buttons per domande a risposta chiusa non scorrevoli 
                <?php foreach ($opzioni[$domanda['id']] as $opzione): ?>
                <label>
                    <input required id="default-radio-1" type="radio" value="<?php echo htmlspecialchars($opzione['risposta']); ?>" name="question<?php echo $domanda['id']; ?>" class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
                    <?php echo htmlspecialchars($opzione['risposta']); ?>
                </label><br>
                <?php endforeach; ?>
                <?php else: ?>
                 Messaggio di debug: nessuna risposta trovata per la domanda corrente 
                <p>Error: No answer found for question ID <?php echo htmlspecialchars($domanda['id']); ?></p>
                <?php endif; ?>
            </div>
        </div>
        <?php endforeach; ?>
        <button data-modal-target="popup-modal" data-modal-toggle="popup-modal" class="w-full block text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800" type="submit">Submit replies</button>
    </form>
</div> -->


<script>
    function start(){
        localStorage.clear()
    }
    function add(type) {
            const form = document.getElementById('surveyForm');
            const lastDiv = document.querySelector('.container.items-center');
            const totalnumber=document.getElementById('surveyForm').children.length-2;
            
            const optionButton = document.getElementById('optionButton');
            if (optionButton) {
                optionButton.remove();
            }

            if (type === 1) {
                if(localStorage.getItem('open')==null){
                var number=1
                }
                else{
                    number=localStorage.getItem('open')
                }
                // Add open question
                const openQuestion = document.createElement('input');
                openQuestion.type = 'text';
                openQuestion.name = 'open_question'+number;
                openQuestion.placeholder = 'Insert the open question';
                openQuestion.className = 'w-full p-2 border rounded-lg shadow-sm focus:ring focus:ring-blue-500 focus:outline-none';
                openQuestion.required=true,
                form.appendChild(openQuestion);
                number++;
                localStorage.setItem('open',number)
            } else if (type === 2) {
                const closeQuestionDiv = document.createElement('div');
                closeQuestionDiv.className = 'close-question-div';
                if(localStorage.getItem('close')==null){
                var number=1
                }
                else{
                    number=localStorage.getItem('close')
                }
                // Add close question input
                const closeQuestion = document.createElement('input');
                closeQuestion.type = 'text';
                closeQuestion.name = 'close_question'+number;
                closeQuestion.placeholder = 'Insert the close question';
                closeQuestion.className = 'w-full p-2 border rounded-lg shadow-sm focus:ring focus:ring-blue-500 focus:outline-none';
                closeQuestion.required=true
                closeQuestionDiv.appendChild(closeQuestion);
                
                // Append the div to the form
                form.appendChild(closeQuestionDiv);
                number++;
                localStorage.setItem('close',number)
                // Add option button
                const optionButton = document.createElement('button');
                optionButton.type = 'button';
                optionButton.id = 'optionButton';
                optionButton.innerText = 'Add option';
                optionButton.className = 'text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800';
                optionButton.onclick = function () {
                    addOption(closeQuestionDiv,number);
                };
                lastDiv.appendChild(optionButton);
                addOption(closeQuestionDiv,number);
                addOption(closeQuestionDiv,number);
            } else if (type === 3) {
                // Add autovalutation
                if(localStorage.getItem('auto')==null){
                var number=1
                }
                else{
                    number=localStorage.getItem('auto')
                }
                const autovalutation = document.createElement('input');
                autovalutation.type = 'text';
                autovalutation.name = 'autovalutation'+number;
                autovalutation.placeholder = 'Insert the autovalutation';
                autovalutation.className = 'w-full p-2 border rounded-lg shadow-sm focus:ring focus:ring-blue-500 focus:outline-none';
                autovalutation.required=true
                form.appendChild(autovalutation);
                number++;
                localStorage.setItem('close',number)
            }
        }

        function addOption(closeQuestionDiv,numero) {
            const number=closeQuestionDiv.children.length-1
            numero=numero-1;
            const optionInput = document.createElement('input');
            optionInput.type = 'text';
            optionInput.name = 'option'+numero+number;
            optionInput.placeholder = 'Insert the option';
            optionInput.className = 'w-full p-2 border rounded-lg shadow-sm focus:ring focus:ring-blue-500 focus:outline-none';
            optionInput.required=true;
            closeQuestionDiv.appendChild(optionInput);
        }
    
    function controllo(){
        const number=document.getElementById('surveyForm').children.length-3;

        if(number>0){
            return true
        }
        alert('Devi aggiungere almeno una domanda al survey')
        return false
    }
    
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>

</body>
</html>