<?php
require_once 'models/Etape.php';

class EtapesController {
    public function index() {
        $database = new Database();
        $db = $database->getConnection();

        $etape = new Etape($db);
        $etapes = $etape->getAll();

        require 'views/etapes/index.php';
    }
}