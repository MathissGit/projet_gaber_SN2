<?php
class Equipe {
    private $conn;
    private $table = 'equipe';

    public function __construct($db) {
        $this->conn = $db;
    }

    // Récupérer toutes les équipes
    public function getAll() {
        $query = "SELECT * FROM " . $this->table;
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // Ajouter une équipe
    public function create($data) {
        $query = "INSERT INTO " . $this->table . " (nom_equipe, num_pays) VALUES (:nom_equipe, :num_pays)";
        $stmt = $this->conn->prepare($query);
        return $stmt->execute($data);
    }

    // Mettre à jour une équipe
    public function update($id, $data) {
        $query = "UPDATE " . $this->table . " SET nom_equipe = :nom_equipe, num_pays = :num_pays WHERE num_equipe = :id";
        $stmt = $this->conn->prepare($query);
        $data['id'] = $id;
        return $stmt->execute($data);
    }

    // Supprimer une équipe
    public function delete($id) {
        $query = "DELETE FROM " . $this->table . " WHERE num_equipe = :id";
        $stmt = $this->conn->prepare($query);
        return $stmt->execute(['id' => $id]);
    }

    // Récupérer une équipe par ID
    public function getById($id) {
        $query = "SELECT * FROM " . $this->table . " WHERE num_equipe = :id";
        $stmt = $this->conn->prepare($query);
        $stmt->execute(['id' => $id]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
}