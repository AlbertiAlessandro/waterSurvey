<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestione Questionari</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* Stili esistenti qui... */

        .navbar {
            background-color: #007BFF; /* Blu */
            color: white;
            display: flex;
            justify-content: space-between;
            padding: 10px 20px;
            align-items: center;
        }

        .back-link {
            color: white;
            text-decoration: none;
            font-size: 16px;
        }

        .user-profile {
            display: flex;
            align-items: center;
        }

        .profile-pic {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 10px;
        }

        /* Aggiornamento delle query di media per la navbar */
        @media (max-width: 600px) {
            .navbar {
                flex-direction: column;
            }

            .back-link, .user-profile {
                margin-bottom: 10px;
            }
        }


        /* Reset di base e stili per il body */
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            line-height: 1.6;
        }

        .container {
            width: 80%;
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .card-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .card {
            flex: 1 1 300px; /* Cresce per riempire lo spazio ma non più piccolo di 300px */
            background-color: #e7e7e7;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.15);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: 3px solid transparent; /* Predefinito senza colore */
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }

        .card h2 {
            color: #007BFF;
            margin-top: 0;
        }

        .card p {
            margin: 5px 0;
        }

        .style {
            border-color: black;
        }

        @media (max-width: 600px) {
            .container {
                width: 95%;
                padding: 10px;
            }

            .card {
                flex-basis: 100%;
            }
        }

    </style>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<nav class="navbar">
    <a href="#" class="back-link">&larr; Indietro</a>
    <div class="user-profile">
        <img src="user-profile.jpg" alt="Profilo Utente" class="profile-pic">
        <span>Nome Utente</span>
    </div>
</nav>
<div class="container">
    <h1>Gestione Questionari</h1>
    <div class="card-container">
        <div class="card style">
            <h2>Matematica Base</h2>
            <p>Difficoltà: Facile</p>
            <p>Domande: 10</p>
        </div>
        <div class="card style">
            <h2>Storia Moderna</h2>
            <p>Difficoltà: Media</p>
            <p>Domande: 15</p>
        </div>
        <div class="card style">
            <h2>Scienze Avanzate</h2>
            <p>Difficoltà: Difficile</p>
            <p>Domande: 20</p>
        </div>
        <!-- Altre card possono essere aggiunte qui -->
    </div>
</div>
</body>
</html>