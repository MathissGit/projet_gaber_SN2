<!DOCTYPE html>
<html>
<head>
    <title>Gestion des Coureurs - Tour de France</title>
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
        <h2>Liste des Coureurs</h2>
        <table>
            <tr>
                <th>ID</th>
                <th>Nom</th>
                <th>Pays</th>
                <th>Date de Naissance</th>
                <th>Actions</th>
            </tr>
            <?php foreach ($coureurs as $coureur): ?>
                <tr>
                    <td><?= $coureur['num_coureur'] ?></td>
                    <td><?= $coureur['nom_coureur'] ?></td>
                    <td><?= $coureur['num_pays'] ?></td>
                    <td><?= $coureur['DN_coureur'] ?></td>
                    <td>
                        <!-- Formulaire pour supprimer un coureur -->
                        <form method="POST" action="index.php?page=coureurs&action=delete" style="display:inline;">
                            <input type="hidden" name="id" value="<?= $coureur['num_coureur'] ?>">
                            <button type="submit">Supprimer</button>
                        </form>
                        <!-- Lien pour modifier un coureur -->
                        <a href="index.php?page=coureurs&action=edit&id=<?= $coureur['num_coureur'] ?>">Modifier</a>
                    </td>
                </tr>
            <?php endforeach; ?>
        </table>

        <h2>Ajouter un Coureur</h2>
        <!-- Formulaire pour ajouter un coureur -->
        <form method="POST" action="index.php?page=coureurs&action=create">
            <input type="text" name="nom_coureur" placeholder="Nom du coureur" required>
            <input type="text" name="num_pays" placeholder="Pays" required>
            <input type="date" name="DN_coureur" placeholder="Date de naissance" required>
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