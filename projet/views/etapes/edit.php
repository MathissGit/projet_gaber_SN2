<!DOCTYPE html>
<html>
<head>
    <title>Modifier une Étape</title>
    <link rel="stylesheet" type="text/css" href="assets/style.css">
</head>
<body>
    <header>
        <h1>Modifier une Étape</h1>
    </header>
    <div class="container">
        <form method="POST" action="index.php?page=etapes&action=update">
            <input type="hidden" name="id" value="<?= $etape['num_etape'] ?>">
            <input type="text" name="type_etape" value="<?= $etape['type_etape'] ?>" required>
            <input type="text" name="kilometrage_etape" value="<?= $etape['kilometrage_etape'] ?>" required>
            <input type="date" name="date_etape" value="<?= $etape['date_etape'] ?>" required>
            <button type="submit">Mettre à jour</button>
        </form>
        <div class="buttons">
            <a href="index.php?page=etapes">Retour</a>
        </div>
    </div>
</body>
</html>