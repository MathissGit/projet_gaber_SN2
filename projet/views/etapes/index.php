<!DOCTYPE html>
<html>
<head>
    <title>Gestion des Étapes - Tour de France</title>
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
        <table>
            <tr>
                <th>ID</th>
                <th>Type</th>
                <th>Kilométrage</th>
                <th>Date</th>
                <th>Actions</th>
            </tr>
            <?php foreach ($etapes as $etape): ?>
                <tr>
                    <td><?= $etape['num_etape'] ?></td>
                    <td><?= $etape['type_etape'] ?></td>
                    <td><?= $etape['kilometrage_etape'] ?></td>
                    <td><?= $etape['date_etape'] ?></td>
                    <td>
                        <!-- Formulaire pour supprimer une étape -->
                        <form method="POST" action="index.php?page=etapes&action=delete" style="display:inline;">
                            <input type="hidden" name="id" value="<?= $etape['num_etape'] ?>">
                            <button type="submit">Supprimer</button>
                        </form>
                        <!-- Lien pour modifier une étape -->
                        <a href="index.php?page=etapes&action=edit&id=<?= $etape['num_etape'] ?>">Modifier</a>
                    </td>
                </tr>
            <?php endforeach; ?>
        </table>

        <h2>Ajouter une Étape</h2>
        <!-- Formulaire pour ajouter une étape -->
        <form method="POST" action="index.php?page=etapes&action=create">
            <input type="text" name="type_etape" placeholder="Type d'étape" required>
            <input type="text" name="kilometrage_etape" placeholder="Kilométrage" required>
            <input type="date" name="date_etape" placeholder="Date" required>
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