<?php
class Coureur {
    private $conn;
    private $table = 'coureur';

    public function __construct($db) {
        $this->conn = $db;
    }

    // Récupérer tous les coureurs
    public function getAll() {
        $query = "SELECT * FROM " . $this->table;
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // Ajouter un coureur
    public function create($data) {
        $query = "INSERT INTO " . $this->table . " (nom_coureur, num_pays, DN_coureur) VALUES (:nom_coureur, :num_pays, :DN_coureur)";
        $stmt = $this->conn->prepare($query);
        return $stmt->execute($data);
    }

    // Mettre à jour un coureur
    public function update($id, $data) {
        $query = "UPDATE " . $this->table . " SET nom_coureur = :nom_coureur, num_pays = :num_pays, DN_coureur = :DN_coureur WHERE num_coureur = :id";
        $stmt = $this->conn->prepare($query);
        $data['id'] = $id;
        return $stmt->execute($data);
    }

    // Supprimer un coureur
    public function delete($id) {
        $query = "DELETE FROM " . $this->table . " WHERE num_coureur = :id";
        $stmt = $this->conn->prepare($query);
        return $stmt->execute(['id' => $id]);
    }

    // Récupérer un coureur par ID
    public function getById($id) {
        $query = "SELECT * FROM " . $this->table . " WHERE num_coureur = :id";
        $stmt = $this->conn->prepare($query);
        $stmt->execute(['id' => $id]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
}