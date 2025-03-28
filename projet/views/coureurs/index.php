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
            <h1>Gestion des Coureurs</h1>
        </div>
    </header>
    <div class="container">
    <h1>Liste des Coureurs</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Nom</th>
            <th>Pays</th>
            <th>Date de Naissance</th>
        </tr>
        <?php foreach ($coureurs as $coureur): ?>
            <tr>
                <td><?= $coureur['num_coureur'] ?></td>
                <td><?= $coureur['nom_coureur'] ?></td>
                <td><?= $coureur['num_pays'] ?></td>
                <td><?= $coureur['DN_coureur'] ?></td>
            </tr>
        <?php endforeach; ?>
    </table>
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