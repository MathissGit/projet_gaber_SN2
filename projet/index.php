<?php
require_once 'config/database.php';
require_once 'controllers/CoureursController.php';
require_once 'controllers/EquipesController.php';
require_once 'controllers/EtapesController.php';

$page = $_GET['page'] ?? 'home';

switch ($page) {
    case 'home':
        require 'views/home.php';
        break;
    case 'coureurs':
        $controller = new CoureursController();
        $controller->index();
        break;
    case 'equipes':
        $controller = new EquipesController();
        $controller->index();
        break;
    case 'etapes':
        $controller = new EtapesController();
        $controller->index();
        break;
    default:
        echo "Page non trouvée.";
        break;
}