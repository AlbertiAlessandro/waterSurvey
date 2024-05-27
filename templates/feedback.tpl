<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Users</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body class="bg-gray-100 flex items-center justify-center h-screen">
<div class="w-full max-w-2xl h-96 overflow-y-auto bg-white border border-gray-200 rounded-lg shadow-sm dark:border-gray-700 dark:bg-gray-800 p-4">
    <div class="space-y-4">
        <?php
        foreach ($feedbackWithInformations as $f) {
            ?>
        <figure class="flex flex-col items-center p-4 bg-white rounded-lg shadow-sm dark:bg-gray-800">
            <blockquote class="max-w-2xl text-gray-500 dark:text-gray-400 text-center">
                <h3 class="text-lg font-semibold text-gray-900 dark:text-white">User Feedback</h3>
                <p class="my-4"><?php echo htmlspecialchars($f['risposta'], ENT_QUOTES, 'UTF-8'); ?></p>
            </blockquote>
            <figcaption class="flex items-center">
                <img class="rounded-full w-9 h-9" src="image/user.jpg" alt="profile picture">
                <div class="ml-3 text-left">
                    <div class="font-medium dark:text-white"><?php echo htmlspecialchars($f['username'], ENT_QUOTES, 'UTF-8'); ?></div>
                    <div class="text-sm text-gray-500 dark:text-gray-400">Position</div>
                </div>
            </figcaption>
        </figure>
        <?php
        }
        ?>
    </div>
    <button onclick='change()' class="w-full text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mt-4 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800">Back</button>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>
<script>
    function change() {
        window.location.href = 'index.php';
    }
</script>
</body>
</html>
