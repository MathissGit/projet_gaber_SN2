<?php
require_once 'models/Coureur.php';

class CoureursController {
    public function index() {
        $database = new Database();
        $db = $database->getConnection();

        $coureur = new Coureur($db);
        $coureurs = $coureur->getAll();

        require 'views/coureurs/index.php';
    }
}