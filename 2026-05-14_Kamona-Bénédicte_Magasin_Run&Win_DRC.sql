--1
SELECT 
      p.nom_produit,
      v2.nom_ville,
      v.date_vente,
      v.quantite_vendue   
FROM ventes v 
INNER JOIN produits p 
ON v.id_produit=p.id_produit
INNER JOIN magasins m 
ON v.id_magasin=m.id_magasin
INNER JOIN villes v2 
ON m.id_ville = v2.id_ville;


--2
SELECT 
      p.nom_produit,
      p.prix,
      v.quantite_vendue,
      v2.nom_ville AS ville
FROM ventes v 
INNER JOIN produits p 
      ON v.id_produit = p.id_produit 
INNER JOIN magasins m 
      ON v.id_magasin  =  m.id_magasin 
INNER JOIN villes v2 
      ON m.id_ville =  v2.id_ville 
WHERE v2.nom_ville  IN ('Bukavu', 'Bukavu');




--3
SELECT 
     p.nom_produit,
     SUM(v.quantite_vendue) AS total_vendu
FROM ventes v 
INNER JOIN produits p 
      ON v.id_produit = p.id_produit 
INNER JOIN categories c 
      ON p.id_categorie = c.id_categorie 
INNER JOIN magasins m 
      ON v.id_magasin = m.id_magasin 
INNER JOIN villes v2 
      ON m.id_ville = v2.id_ville
WHERE v2.nom_ville = 'Lubumbashi'
 AND c.nom_categorie = 'Running'
GROUP BY p.nom_produit;


--4
SELECT 
     m.nom_magasin,
     v2.nom_ville,
     SUM(v.quantite_vendue * p.prix) AS chiffre_affaires_total
FROM ventes v 
INNER JOIN produits p 
     ON v.id_produit = p.id_produit 
INNER JOIN magasins m 
     ON v.id_magasin = m.id_magasin 
INNER JOIN villes v2 
     ON m.id_ville = v2.id_ville 
GROUP BY m.nom_magasin, v2.nom_ville
ORDER BY chiffre_affaires_total DESC;




--5
SELECT DISTINCT
      v2.nom_ville,
      c.nom_categorie
FROM ventes v 
INNER JOIN produits p 
     ON v.id_produit = p.id_produit 
INNER JOIN categories c 
     ON p.id_categorie = c.id_categorie 
INNER JOIN magasins m 
     ON v.id_magasin = m.id_magasin 
INNER JOIN villes v2 
     ON m.id_ville = v2.id_ville;