<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Survey Admin</title>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            background-color: #f3f4f6; /* Light gray background */
        }
    </style>
</head>
<body>
<div class="container mx-auto p-4">
    <h1 class="text-3xl font-bold text-center text-gray-900 mb-8">Surveys Results</h1>
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
        <?php foreach ($informazioni as $informazione): ?>
        <div class="w-full bg-white border border-gray-200 rounded-lg shadow-lg p-6">
            <p class="text-2xl font-extrabold text-center text-gray-900 dark:text-white"><?= $informazione['nome']; ?></p>
            <p class="text-2xl font-bold text-gray-700 bg-blue-100 text-center p-4 rounded-lg"><?= $response[$informazione['id']]; ?></p>
            <p class="text-1xl font-medium text-gray-900 dark:text-white text-center">Users that completed this survey</p>
        </div>
        <?php endforeach; ?>
    </div>
    <button onclick='create()' class="w-full text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mt-4 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800">create Survey</button>
    <button onclick='change()' class="w-full text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mt-4 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800">Back</button>

</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>
</body>

<script>
    function change() {
        window.location.href = 'index.php';
    }
    function create() {
        window.location.href = 'index.php?action=pagecreate';
    }
</script>
</html>