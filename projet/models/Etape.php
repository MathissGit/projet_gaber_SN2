<?php
class Etape {
    private $conn;
    private $table = 'etape';

    public function __construct($db) {
        $this->conn = $db;
    }

    // Récupérer toutes les étapes
    public function getAll() {
        $query = "SELECT * FROM " . $this->table;
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // Ajouter une étape
    public function create($data) {
        $query = "INSERT INTO " . $this->table . " (type_etape, kilometrage_etape, date_etape) VALUES (:type_etape, :kilometrage_etape, :date_etape)";
        $stmt = $this->conn->prepare($query);
        return $stmt->execute($data);
    }

    // Mettre à jour une étape
    public function update($id, $data) {
        $query = "UPDATE " . $this->table . " SET type_etape = :type_etape, kilometrage_etape = :kilometrage_etape, date_etape = :date_etape WHERE num_etape = :id";
        $stmt = $this->conn->prepare($query);
        $data['id'] = $id;
        return $stmt->execute($data);
    }

    // Supprimer une étape
    public function delete($id) {
        $query = "DELETE FROM " . $this->table . " WHERE num_etape = :id";
        $stmt = $this->conn->prepare($query);
        return $stmt->execute(['id' => $id]);
    }

    // Récupérer une étape par ID
    public function getById($id) {
        $query = "SELECT * FROM " . $this->table . " WHERE num_etape = :id";
        $stmt = $this->conn->prepare($query);
        $stmt->execute(['id' => $id]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
}