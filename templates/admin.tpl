<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>Admin Dashboard</title>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.css" rel="stylesheet" />
</head>
<body class="min-h-screen flex flex-col justify-center items-center bg-gray-100">
<div class="max-w-screen-xl w-full p-4 flex flex-col items-center">
    <!-- Title and Logout container -->
    <div class="w-full flex justify-between items-center mb-8">
        <!-- Title -->
        <h1 class="text-3xl font-bold text-center text-gray-900">Dashboard Overview</h1>
        <!-- Logout button -->
        <button type="button" onclick="logout()" class="focus:outline-none text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 me-2 dark:bg-red-600 dark:hover:bg-red-700 dark:focus:ring-red-900">Logout</button>
    </div>

    <!-- Cards container -->
    <div class="flex flex-wrap justify-center gap-4">
        <!-- Users Card -->
        <div class="w-96 h-64 bg-white border border-gray-200 rounded-lg shadow-lg p-6 flex flex-col justify-between">
            <h5 class="text-2xl font-bold tracking-tight text-gray-900 dark:text-white">Users</h5>
            <p class="text-lg font-normal text-gray-700 dark:text-gray-400"><?=$numero_utenti?></p>
            <a href="index.php?action=visitUsers" class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                Visit Users
                <svg class="ml-2 w-3.5 h-3.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 10">
                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M1 5h12m0 0L9 1m4 4L9 9"/>
                </svg>
            </a>
        </div>

        <!-- Feedback Card -->
        <div class="w-96 h-64 bg-white border border-gray-200 rounded-lg shadow-lg p-6 flex flex-col justify-between">
            <h5 class="text-2xl font-bold tracking-tight text-gray-900 dark:text-white">Feedback</h5>
            <p class="text-lg font-normal text-gray-700 dark:text-gray-400"><?=$numero_feedback?></p>
            <a href="index.php?action=feedback" class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                Visit Feedback
                <svg class="ml-2 w-3.5 h-3.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 10">
                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M1 5h12m0 0L9 1m4 4L9 9"/>
                </svg>
            </a>
        </div>

        <!-- Survey Card -->
        <div class="w-96 h-64 bg-white border border-gray-200 rounded-lg shadow-lg p-6 flex flex-col justify-between">
            <h5 class="text-2xl font-bold tracking-tight text-gray-900 dark:text-white">Surveys</h5>
            <p class="text-lg font-normal text-gray-700 dark:text-gray-400"><?=$numero_survey?></p>
            <a href="index.php?action=viewSurvey" class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                Visit Surveys
                <svg class="ml-2 w-3.5 h-3.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 10">
                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M1 5h12m0 0L9 1m4 4L9 9"/>
                </svg>
            </a>
        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>
<script>
    function logout() {
        window.location.href = 'index.php?action=logout';
    }
</script>
</body>
</html>
