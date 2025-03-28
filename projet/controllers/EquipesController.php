<?php
require_once 'models/Equipe.php';

class EquipesController {
    public function index() {
        $database = new Database();
        $db = $database->getConnection();

        $equipe = new Equipe($db);
        $equipes = $equipe->getAll();

        require 'views/equipes/index.php';
    }
}