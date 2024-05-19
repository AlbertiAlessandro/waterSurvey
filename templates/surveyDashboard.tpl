<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestione Questionari</title>
    <link rel="stylesheet" href="styles.css">
    <style>
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

        @media (max-width: 600px) {
            .navbar {
                flex-direction: column;
            }

            .back-link, .user-profile {
                margin-bottom: 10px;
            }
        }

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
            flex: 1 1 300px;
            background-color: #e7e7e7;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.15);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: 3px solid transparent;
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
            font-size: 14px;
        }

        .completato {
            color: green;
            font-weight: bold;
        }

        .non-completato {
            color: red;
            font-weight: bold;
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
</head>
<body>
<nav class="navbar">
    <div class="user-profile">
        <img src="user-profile.jpg" alt="Profilo Utente" class="profile-pic">
        <span>Nome Utente</span>
    </div>
</nav>
<div class="container">
    <h1>Dashboard Survey</h1>
    <div class="card-container">
        <?php
        // Ottieni le informazioni dei questionari
        $informazioni = \Model\QuestionarioRepository::listAll();

        if (is_array($informazioni) && count($informazioni) > 0):
        foreach ($informazioni as $informazione):
        $completato = \Model\QuestionarioRepository::isCompleted($informazione['id']);
        ?>
        <div class="card style">
            <h2><?= htmlspecialchars($informazione['nome']) ?></h2>
            <p><?= htmlspecialchars($informazione['descrizione']) ?></p>
            <p><?= htmlspecialchars($informazione['creatore']) ?></p>
            <p class="<?= $completato ? 'completato' : 'non-completato' ?>">
                <?= $completato ? 'Completato' : 'Non Completato' ?>
            </p>
            <a href="index.php?action=survey&id=<?= $informazione['id'] ?>"><button>Vai al Survey</button></a>
        </div>
        <?php
            endforeach;
        endif;
        ?>
    </div>
</div>
</body>
</html>
