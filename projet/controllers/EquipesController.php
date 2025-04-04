<?php
require_once 'models/Equipe.php';

class EquipesController {
    private $model;

    public function __construct() {
        $database = new Database();
        $db = $database->getConnection();
        $this->model = new Equipe($db);
    }

    // Afficher toutes les équipes
    public function index() {
        $equipes = $this->model->getAll();
        require 'views/equipes/index.php';
    }

    // Ajouter une équipe
    public function create() {
        $this->model->create([
            'nom_equipe' => $_POST['nom_equipe'],
            'num_pays' => $_POST['num_pays']
        ]);
        header('Location: index.php?page=equipes');
    }

    // Supprimer une équipe
    public function delete() {
        $this->model->delete($_POST['id']);
        header('Location: index.php?page=equipes');
    }

    // Afficher le formulaire de modification
    public function edit() {
        $equipe = $this->model->getById($_GET['id']);
        require 'views/equipes/edit.php';
    }

    // Mettre à jour une équipe
    public function update() {
        $this->model->update($_POST['id'], [
            'nom_equipe' => $_POST['nom_equipe'],
            'num_pays' => $_POST['num_pays']
        ]);
        header('Location: index.php?page=equipes');
    }
}