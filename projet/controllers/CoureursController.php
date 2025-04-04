<?php
require_once 'models/Coureur.php';

class CoureursController {
    private $model;

    public function __construct() {
        $database = new Database();
        $db = $database->getConnection();
        $this->model = new Coureur($db);
    }

    // Afficher tous les coureurs
    public function index() {
        $coureurs = $this->model->getAll();
        require 'views/coureurs/index.php';
    }

    // Ajouter un coureur
    public function create() {
        $this->model->create([
            'nom_coureur' => $_POST['nom_coureur'],
            'num_pays' => $_POST['num_pays'],
            'DN_coureur' => $_POST['DN_coureur']
        ]);
        header('Location: index.php?page=coureurs');
    }

    // Supprimer un coureur
    public function delete() {
        $this->model->delete($_POST['id']);
        header('Location: index.php?page=coureurs');
    }

    // Afficher le formulaire de modification
    public function edit() {
        $coureur = $this->model->getById($_GET['id']);
        require 'views/coureurs/edit.php';
    }

    // Mettre à jour un coureur
    public function update() {
        $this->model->update($_POST['id'], [
            'nom_coureur' => $_POST['nom_coureur'],
            'num_pays' => $_POST['num_pays'],
            'DN_coureur' => $_POST['DN_coureur']
        ]);
        header('Location: index.php?page=coureurs');
    }
}