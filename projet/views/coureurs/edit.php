<!DOCTYPE html>
<html>
<head>
    <title>Modifier un Coureur</title>
    <link rel="stylesheet" type="text/css" href="assets/style.css">
</head>
<body>
    <header>
        <h1>Modifier un Coureur</h1>
    </header>
    <div class="container">
        <form method="POST" action="index.php?page=coureurs&action=update">
            <input type="hidden" name="id" value="<?= $coureur['num_coureur'] ?>">
            <input type="text" name="nom_coureur" value="<?= $coureur['nom_coureur'] ?>" required>
            <input type="text" name="num_pays" value="<?= $coureur['num_pays'] ?>" required>
            <input type="date" name="DN_coureur" value="<?= $coureur['DN_coureur'] ?>" required>
            <button type="submit">Mettre à jour</button>
        </form>
        <div class="buttons">
            <a href="index.php?page=coureurs">Retour</a>
        </div>
    </div>
</body>
</html>