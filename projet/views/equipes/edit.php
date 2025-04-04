<!DOCTYPE html>
<html>
<head>
    <title>Modifier une Équipe</title>
    <link rel="stylesheet" type="text/css" href="assets/style.css">
</head>
<body>
    <header>
        <h1>Modifier une Équipe</h1>
    </header>
    <div class="container">
        <form method="POST" action="index.php?page=equipes&action=update">
            <input type="hidden" name="id" value="<?= $equipe['num_equipe'] ?>">
            <input type="text" name="nom_equipe" value="<?= $equipe['nom_equipe'] ?>" required>
            <input type="text" name="num_pays" value="<?= $equipe['num_pays'] ?>" required>
            <button type="submit">Mettre à jour</button>
        </form>
        <div class="buttons">
            <a href="index.php?page=equipes">Retour</a>
        </div>
    </div>
</body>
</html>