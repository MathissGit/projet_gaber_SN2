<?php
require_once 'models/Etape.php';

class EtapesController {
    private $model;

    public function __construct() {
        $database = new Database();
        $db = $database->getConnection();
        $this->model = new Etape($db);
    }

    // Afficher toutes les étapes
    public function index() {
        $etapes = $this->model->getAll();
        require 'views/etapes/index.php';
    }

    // Ajouter une étape
    public function create() {
        $this->model->create([
            'type_etape' => $_POST['type_etape'],
            'kilometrage_etape' => $_POST['kilometrage_etape'],
            'date_etape' => $_POST['date_etape']
        ]);
        header('Location: index.php?page=etapes');
    }

    // Supprimer une étape
    public function delete() {
        $this->model->delete($_POST['id']);
        header('Location: index.php?page=etapes');
    }

    // Afficher le formulaire de modification
    public function edit() {
        $etape = $this->model->getById($_GET['id']);
        require 'views/etapes/edit.php';
    }

    // Mettre à jour une étape
    public function update() {
        $this->model->update($_POST['id'], [
            'type_etape' => $_POST['type_etape'],
            'kilometrage_etape' => $_POST['kilometrage_etape'],
            'date_etape' => $_POST['date_etape']
        ]);
        header('Location: index.php?page=etapes');
    }
}