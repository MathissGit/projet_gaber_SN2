<!DOCTYPE html>
<html>

<head>
    <title>Gestion des Équipes - Tour de France</title>
    <link rel="stylesheet" type="text/css" href="assets/style.css">
</head>

<body>
    <header>
        <div class="header-content">
            <img src="assets/images/logo.png" alt="Logo Tour de France" class="logo">
            <h1>Gestion des Étapes</h1>
        </div>
    </header>
    <div class="container">
        <h2>Liste des Étapes</h2>
        <table border="1">
            <tr>
                <th>Numéro</th>
                <th>Nom</th>
                <th>Distance</th>
                <th>Date</th>
            </tr>
            <?php foreach ($etapes as $etape): ?>
                <tr>
                    <td><?= $etape['num_etape'] ?></td>
                    <td><?= $etape['type_etape'] ?></td>
                    <td><?= $etape['kilometrage_etape'] ?></td>
                    <td><?= $etape['date_etape'] ?></td>
                </tr>
            <?php endforeach; ?>
        </table>

        <div class="buttons">
            <a href="index.php?page=home">Retour</a>
        </div>

    </div>
    <footer>
        <p>&copy; 2023 Gestion du Tour de France. Tous droits réservés.</p>
    </footer>
</body>

</html>