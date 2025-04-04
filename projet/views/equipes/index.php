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
                <th>Actions</th>
            </tr>
            <?php foreach ($equipes as $equipe): ?>
                <tr>
                    <td><?= $equipe['num_equipe'] ?></td>
                    <td><?= $equipe['nom_equipe'] ?></td>
                    <td><?= $equipe['num_pays'] ?></td>
                    <td>
                        <!-- Formulaire pour supprimer une équipe -->
                        <form method="POST" action="index.php?page=equipes&action=delete" style="display:inline;">
                            <input type="hidden" name="id" value="<?= $equipe['num_equipe'] ?>">
                            <button type="submit">Supprimer</button>
                        </form>
                        <!-- Lien pour modifier une équipe -->
                        <a href="index.php?page=equipes&action=edit&id=<?= $equipe['num_equipe'] ?>">Modifier</a>
                    </td>
                </tr>
            <?php endforeach; ?>
        </table>

        <h2>Ajouter une Équipe</h2>
        <!-- Formulaire pour ajouter une équipe -->
        <form method="POST" action="index.php?page=equipes&action=create">
            <input type="text" name="nom_equipe" placeholder="Nom de l'équipe" required>
            <input type="text" name="num_pays" placeholder="Pays" required>
            <button type="submit">Ajouter</button>
        </form>

        <div class="buttons">
            <a href="index.php?page=home">Retour</a>
        </div>
    </div>
    <footer>
        <p>&copy; 2023 Gestion du Tour de France. Tous droits réservés.</p>
    </footer>
</body>
</html>