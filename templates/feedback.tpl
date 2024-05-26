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
        <figure class="flex flex-col items-center p-4 bg-white rounded-lg shadow-sm dark:bg-gray-800">
            <blockquote class="max-w-2xl text-gray-500 dark:text-gray-400 text-center">
                <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Very easy this was to integrate</h3>
                <p class="my-4">If you care for your time, I hands down would go with this."</p>
            </blockquote>
            <figcaption class="flex items-center">
                <img class="rounded-full w-9 h-9" src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/karen-nelson.png" alt="profile picture">
                <div class="ml-3 text-left">
                    <div class="font-medium dark:text-white">Bonnie Green</div>
                    <div class="text-sm text-gray-500 dark:text-gray-400">Developer at Open AI</div>
                </div>
            </figcaption>
        </figure>
        <figure class="flex flex-col items-center p-4 bg-white rounded-lg shadow-sm dark:bg-gray-800">
            <blockquote class="max-w-2xl text-gray-500 dark:text-gray-400 text-center">
                <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Solid foundation for any project</h3>
                <p class="my-4">Designing with Figma components that can be easily translated to the utility classes of Tailwind CSS is a huge timesaver!"</p>
            </blockquote>
            <figcaption class="flex items-center">
                <img class="rounded-full w-9 h-9" src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/roberta-casas.png" alt="profile picture">
                <div class="ml-3 text-left">
                    <div class="font-medium dark:text-white">Roberta Casas</div>
                    <div class="text-sm text-gray-500 dark:text-gray-400">Lead designer at Dropbox</div>
                </div>
            </figcaption>
        </figure>
        <figure class="flex flex-col items-center p-4 bg-white rounded-lg shadow-sm dark:bg-gray-800">
            <blockquote class="max-w-2xl text-gray-500 dark:text-gray-400 text-center">
                <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Mindblowing workflow</h3>
                <p class="my-4">Aesthetically, the well designed components are beautiful and will undoubtedly level up your next application."</p>
            </blockquote>
            <figcaption class="flex items-center">
                <img class="rounded-full w-9 h-9" src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/jese-leos.png" alt="profile picture">
                <div class="ml-3 text-left">
                    <div class="font-medium dark:text-white">Jese Leos</div>
                    <div class="text-sm text-gray-500 dark:text-gray-400">Software Engineer at Facebook</div>
                </div>
            </figcaption>
        </figure>
        <figure class="flex flex-col items-center p-4 bg-white rounded-lg shadow-sm dark:bg-gray-800">
            <blockquote class="max-w-2xl text-gray-500 dark:text-gray-400 text-center">
                <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Efficient Collaborating</h3>
                <p class="my-4">You have many examples that can be used to create a fast prototype for your team."</p>
            </blockquote>
            <figcaption class="flex items-center">
                <img class="rounded-full w-9 h-9" src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/joseph-mcfall.png" alt="profile picture">
                <div class="ml-3 text-left">
                    <div class="font-medium dark:text-white">Joseph McFall</div>
                    <div class="text-sm text-gray-500 dark:text-gray-400">CTO at Google</div>
                </div>
            </figcaption>
        </figure>
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
