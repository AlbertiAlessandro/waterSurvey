<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Survey Interattivo</title>

    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.css" rel="stylesheet" />

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
            margin-bottom: 20px;
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

        .form-group {
            margin-bottom: 20px;
        }
    </style>
</head>
<body onload="start()">
<div class="container">
    <h1>Create survey</h1>
    <form id="surveyForm" method="post" action="index.php?action=addsurvey" onsubmit="return controllo()">
        <div class="form-group">
            <label for="title">
                <input required type="text" name="titolo" placeholder="Insert the title" class="w-full p-2 border rounded-lg shadow-sm focus:ring focus:ring-blue-500 focus:outline-none">
            </label>
        </div>
        <div class="form-group">
            <label for="descrizione">
                <input required type="text" name="descrizione" placeholder="Insert the description" class="w-full p-2 border rounded-lg shadow-sm focus:ring focus:ring-blue-500 focus:outline-none">
            </label>
        </div>
        <button data-modal-target="popup-modal" data-modal-toggle="popup-modal" class="w-full block text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800" type="submit">Submit replies</button>
    </form>
</div>
<div class="container items-center">
    <button onclick="add(1)" type="button" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800">Add open question</button>
    <button onclick="add(2)" type="button" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800">Add close question</button>
    <button onclick="add(3)" type="button" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800">Add autovalutation</button>
</div>

<script>
    function start(){
        localStorage.clear();
    }

    function add(type) {
        const form = document.getElementById('surveyForm');
        const lastDiv = document.querySelector('.container.items-center');

        if (type === 1) {
            const number = localStorage.getItem('open') ? parseInt(localStorage.getItem('open')) + 1 : 1;
            const openQuestion = document.createElement('input');
            openQuestion.type = 'text';
            openQuestion.name = 'open_question' + number;
            openQuestion.placeholder = 'Insert the open question';
            openQuestion.className = 'w-full p-2 border rounded-lg shadow-sm focus:ring focus:ring-blue-500 focus:outline-none my-2';
            openQuestion.required = true;
            form.insertBefore(openQuestion, form.lastElementChild);
            localStorage.setItem('open', number);
        } else if (type === 2) {
            const number = localStorage.getItem('close') ? parseInt(localStorage.getItem('close')) + 1 : 1;
            const closeQuestionDiv = document.createElement('div');
            closeQuestionDiv.className = 'close-question-div my-2';
            const closeQuestion = document.createElement('input');
            closeQuestion.type = 'text';
            closeQuestion.name = 'close_question' + number;
            closeQuestion.placeholder = 'Insert the close question';
            closeQuestion.className = 'w-full p-2 border rounded-lg shadow-sm focus:ring focus:ring-blue-500 focus:outline-none my-2';
            closeQuestion.required = true;
            closeQuestionDiv.appendChild(closeQuestion);
            form.insertBefore(closeQuestionDiv, form.lastElementChild);
            localStorage.setItem('close', number);

            const optionButton = document.createElement('button');
            optionButton.type = 'button';
            optionButton.id = 'optionButton';
            optionButton.innerText = 'Add option';
            optionButton.className = 'text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800';
            optionButton.onclick = function () {
                addOption(closeQuestionDiv, number);
            };
            lastDiv.appendChild(optionButton);
            addOption(closeQuestionDiv, number);
            addOption(closeQuestionDiv, number);
        } else if (type === 3) {
            const number = localStorage.getItem('auto') ? parseInt(localStorage.getItem('auto')) + 1 : 1;
            const autovalutation = document.createElement('input');
            autovalutation.type = 'text';
            autovalutation.name = 'autovalutation' + number;
            autovalutation.placeholder = 'Insert the autovalutation';
            autovalutation.className = 'w-full p-2 border rounded-lg shadow-sm focus:ring focus:ring-blue-500 focus:outline-none my-2';
            autovalutation.required = true;
            form.insertBefore(autovalutation, form.lastElementChild);
            localStorage.setItem('auto', number);
        }
    }

    function addOption(closeQuestionDiv, number) {
        const optionInput = document.createElement('input');
        optionInput.type = 'text';
        optionInput.name = 'option' + number + (closeQuestionDiv.children.length - 1);
        optionInput.placeholder = 'Insert the option';
        optionInput.className = 'w-full p-2 border rounded-lg shadow-sm focus:ring focus:ring-blue-500 focus:outline-none my-2';
        optionInput.required = true;
        closeQuestionDiv.appendChild(optionInput);
    }

    function controllo(){
        if (document.getElementById('surveyForm').children.length > 3) {
            return true;
        }
        alert('Devi aggiungere almeno una domanda al survey');
        return false;
    }
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>

</body>
</html>
