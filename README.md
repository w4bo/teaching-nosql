# NoSQL in Action!

[![build](https://github.com/w4bo/nodejs-nosql/actions/workflows/build.yml/badge.svg)](https://github.com/w4bo/nodejs-nosql/actions/workflows/build.yml)

NoSQL exercises against document, graph, and columnar NoSQL databases.

## Setting up the software stack

- Cassandra: https://s3.amazonaws.com/datastaxtraining/VM/DS220-vm-Jul2015.zip
- Neo4j: https://neo4j.com/artifact.php?name=neo4j-desktop-offline-1.3.11-setup.exe
- MongoDB: https://fastdl.mongodb.org/windows/mongodb-windows-x86_64-4.4.3-signed.msi
	- Robo3T (workbench di MongoDB): https://download.studio3t.com/robomongo/windows/robo3t-1.4.2-windows-x86_64-8650949.exe
	- MongoDB Database Tools (import/export di MongoDB): https://fastdl.mongodb.org/tools/db/mongodb-database-tools-windows-x86_64-100.3.0.zip

Dataset MongoDB in allegato

## Calendar

- Lecture 01: Introduction to NoSQL databases
- Lecture 02: Cassandra
- Lecture 03: Test + Cassandra
- Lecture 04: Cassandra + Neo4J
- Lecture 05: Neo4J
- Lecture 06: Neo4J + MongoDB Find
- Lecture 07: Test Cassandra + MongoDB Find
- Lecture 08: Test Neo4J + MongoDB Find
- Lecture 09: MongoDB Find / Aggregate
- Lecture 10: Test MongoDB + Redis + Real datasets

## MongoDB

### Find
1.	Creare un oggetto JSON con le seguenti caratteristiche e validarlo su https://jsonlint.com/

    nome (stringa)
    indirizzo (oggetto) composto da:
        via (stringa)
        civico (numero)
    età (numero)
    interessi (array di stringhe)
    film preferiti (array di oggetti)
    ogni oggetto ha un campo “titolo” (stringa)

#### Restaurants

1.	Visualizzare tutti i ristoranti.
2.	Visualizzare quartiere (borough) e tipo di cucina (cuisine) di tutti i ristoranti.
3.	Visualizzare quartiere (borough) e tipo di cucina (cuisine) di tutti i ristoranti, ma senza _id.
4.	Visualizzare quartiere (borough), tipo di cucina (cuisine) e via (address.street) di tutti i ristoranti.
5.	Visualizzare i ristoranti il cui zipcode è 11225
6.	Visualizzare i ristoranti il cui tipo di cucina è Hamburgers
7.	Visualizzare i ristoranti il cui tipo di cucina NON è Hamburgers
8.	Visualizzare i ristoranti il cui tipo di cucina è tra Hamburgers, Bakery o Irish
9.	Visualizzare i ristoranti il cui tipo di cucina NON è tra Hamburgers, Bakery o Irish
10.	Visualizzare i ristoranti il cui tipo di cucina non esiste

####  YelpBusiness

11.	Visualizzare tutti i business che hanno ricevuto almeno 10 recensioni (review_count) E si trovano in Arizona o in Nevada (state = NV o AZ)
12.	Visualizzare tutti i business che hanno ricevuto almeno 10 recensioni (review_count) O si trovano in Arizona o in Nevada (state = NV o AZ)
13.	Visualizzare tutti i business che hanno Grocery tra le categorie
14.	Visualizzare tutti i business che hanno Grocery E Barbeque tra le categorie
15.	Visualizzare tutti i business che hanno Grocery O Barbeque tra le categorie
16.	Visualizzare tutti i business che hanno SOLAMENTE Grocery E Barbeque tra le categorie
17.	Visualizzare tutti i business che hanno 5 categorie
18.	Visualizzare tutti i business che hanno 5 categorie e la quinta categoria è Food
19.	Visualizzare le prime due categorie di ogni business
20.	Visualizzare unicamente le categorie dei business del Nevada
21.	Visualizzare i valori distinti del campo city
22.	Visualizzare i valori distinti del campo city nello stato del Nevada
23.	Visualizzare i valori distinti dell’array categories

#### Games
24.	Visualizzare le partite disputate nel 2010. (1239 risultati) – slide 8
        - Formato data: "anno-mese-giorno"
25.	Visualizzare le partite in cui una delle squadre ha totalizzato almeno 160 punti. (6 risultati)
26.	Visualizzare le partite in cui la squadra di casa ha perso. (12197 risultati)
27.	Visualizzare le partite in cui ha giocato Michael Jordan. (990 risultati)
28.	Visualizzare le partite in cui Michael Jordan ha segnato più di 60 punti. (4 risultati)
29.	Visualizzare le prime 10 partite memorizzate nella collection. (10 risultati)
30.	Visualizzare le prime 10 partite in ordine di data. (10 risultati)
31.	Visualizzare le prime 10 partite del 2010 in ordine di data. (10 risultati)
32.	Visualizzare le seconde 10 partite (dalla 11° del 2010 in ordine di data) . (10 risultati)

#### Esercizi aggiuntivi

33.	[Restaurants] Visualizzare i ristoranti che hanno ricevuto almeno un punteggio (grades.score) maggiore di 10
34.	[Restaurants] Visualizzare i ristoranti che hanno ricevuto almeno un punteggio (grades.score) maggiore di 10 nel 2014
35.	[Yelpbusiness] Contare i business di categoria Yoga che hanno ricevuto almeno 4 di punteggio (stars) e che sono aperti (is_open=1)
36.	[Games] Visualizzare le partite in cui la squadra di casa ha perso pur totalizzando più di 120 punti
37.	[Games] Visualizzare l’elenco distinto di date in cui una delle squadre ha totalizzato almeno 160 punti
38.	[Games] Visualizzare le partite in cui una delle due squadre ha sbagliato tutti i tiri liberi (box.team.ft=0) pur avendone provati almeno 10 (box.team.fta>=10)

