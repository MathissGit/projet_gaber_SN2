<?php
require_once 'config/database.php';
require_once 'controllers/CoureursController.php';
require_once 'controllers/EquipesController.php';
require_once 'controllers/EtapesController.php';

$page = $_GET['page'] ?? 'home';
$action = $_GET['action'] ?? null;

switch ($page) {
    case 'home':
        require 'views/home.php';
        break;
    case 'coureurs':
        $controller = new CoureursController();
        if ($action === 'create') {
            $controller->create();
        } elseif ($action === 'delete') {
            $controller->delete();
        } elseif ($action === 'edit') {
            $controller->edit();
        } elseif ($action === 'update') {
            $controller->update();
        } else {
            $controller->index();
        }
        break;
    case 'equipes':
        $controller = new EquipesController();
        if ($action === 'create') {
            $controller->create();
        } elseif ($action === 'delete') {
            $controller->delete();
        } elseif ($action === 'edit') {
            $controller->edit();
        } elseif ($action === 'update') {
            $controller->update();
        } else {
            $controller->index();
        }
        break;
    case 'etapes':
        $controller = new EtapesController();
        if ($action === 'create') {
            $controller->create();
        } elseif ($action === 'delete') {
            $controller->delete();
        } elseif ($action === 'edit') {
            $controller->edit();
        } elseif ($action === 'update') {
            $controller->update();
        } else {
            $controller->index();
        }
        break;
    default:
        echo "Page non trouvée.";
        break;
}