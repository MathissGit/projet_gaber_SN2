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
            <h1>Gestion des Équipes</h1>
        </div>
    </header>
    <div class="container">
        <h2>Liste des Équipes</h2>
        <table>
            <tr>
                <th>ID</th>
                <th>Nom</th>
                <th>Pays</th>
            </tr>
            <?php foreach ($equipes as $equipe): ?>
                <tr>
                    <td><?= $equipe['num_equipe'] ?></td>
                    <td><?= $equipe['nom_equipe'] ?></td>
                    <td><?= $equipe['num_pays'] ?></td>
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