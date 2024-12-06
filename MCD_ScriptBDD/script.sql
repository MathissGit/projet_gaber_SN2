CREATE TABLE Pays(
   num_pays VARCHAR(3),
   nom_pays VARCHAR(100) NOT NULL,
   PRIMARY KEY(num_pays)
);

CREATE TABLE Equipe(
   num_equipe VARCHAR(3),
   nom_equipe VARCHAR(100) NOT NULL,
   gap_tot_sec_equipe TIME,
   num_pays VARCHAR(3) NOT NULL,
   PRIMARY KEY(num_equipe),
   FOREIGN KEY(num_pays) REFERENCES Pays(num_pays)
);

CREATE TABLE Ville(
   num_ville INT,
   nom_ville VARCHAR(100) NOT NULL,
   num_pays VARCHAR(3) NOT NULL,
   PRIMARY KEY(num_ville),
   FOREIGN KEY(num_pays) REFERENCES Pays(num_pays)
);

CREATE TABLE Coureur(
   num_coureur INT,
   prenom_coureur VARCHAR(100) NOT NULL,
   nom_coureur VARCHAR(100) NOT NULL,
   age_coureur INT NOT NULL,
   DN_coureur DATE NOT NULL,
   bonif_tot_coureur TIME,
   penalite_tot_coureur TIME,
   distance_tot_coureur DECIMAL(15,2) NOT NULL,
   annee_coureur DATE NOT NULL,
   nbr_etape_coureur INT,
   tot_sec_coureur TIME NOT NULL,
   gap_sec_coureur TIME,
   num_equipe VARCHAR(3) NOT NULL,
   num_pays VARCHAR(3) NOT NULL,
   PRIMARY KEY(num_coureur),
   FOREIGN KEY(num_equipe) REFERENCES Equipe(num_equipe),
   FOREIGN KEY(num_pays) REFERENCES Pays(num_pays)
);

CREATE TABLE Etape(
   num_etape INT,
   date_etape DATE NOT NULL,
   kilometrage_etape DECIMAL(15,2) NOT NULL,
   type_etape VARCHAR(100) NOT NULL,
   repos_transfert LOGICAL NOT NULL,
   num_coureur INT NOT NULL,
   num_ville INT NOT NULL,
   num_ville_1 INT NOT NULL,
   PRIMARY KEY(num_etape),
   FOREIGN KEY(num_coureur) REFERENCES Coureur(num_coureur),
   FOREIGN KEY(num_ville) REFERENCES Ville(num_ville),
   FOREIGN KEY(num_ville_1) REFERENCES Ville(num_ville)
);

CREATE TABLE participer(
   num_etape INT,
   num_coureur INT,
   temps_coureur TIME NOT NULL,
   bonification_coureur TIME,
   penalite_coureur TIME,
   PRIMARY KEY(num_etape, num_coureur),
   FOREIGN KEY(num_etape) REFERENCES Etape(num_etape),
   FOREIGN KEY(num_coureur) REFERENCES Coureur(num_coureur)
);
