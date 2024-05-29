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
            <!--
            <div class="flex items-center mb-4">
                <img class="w-10 h-10 rounded-full" src="<?= $f['image']; ?>" alt="<?= $f['username']; ?> image">

                <div class="ml-4">
                    <h5 class="text-2xl font-bold tracking-tight text-gray-900"><?= $f['username']; ?></h5>
                    <p class="text-sm font-medium text-gray-500"><?= $f['email']; ?></p>
                </div>
            </div>
            -->
            <p class="text-2xl font-extrabold text-center text-gray-900 dark:text-white"><?= $informazione['nome']; ?></p>
            <p class="text-1xl font-medium text-gray-900 dark:text-white">Users who carried out this survey: <?= $informazione['descrizione']; ?></p>
            <a href="index.php?action=viewSurvey&id=<?= $f['informazioni']['id']; ?>" class="inline-flex items-center mt-4 px-3 py-2 text-sm font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                View Survey Details
                <svg class="ml-2 w-3.5 h-3.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 10">
                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M1 5h12m0 0L9 1m4 4L9 9"/>
                </svg>
            </a>
        </div>
        <?php endforeach; ?>
    </div>
    <button onclick='change()' class="w-full text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mt-4 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800">Back</button>

</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>
</body>

<script>
    function change() {
        window.location.href = 'index.php';
    }
</script>
</html>