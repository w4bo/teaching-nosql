# MongoDB  - Esercitazione (Create, Update, Delete)
Per questa esercitazione, utilizzare la collection "classe". Non è necessario crearla (viene creata automaticamente da MongoDB all’inserimento di un documento).

## Create

Creare e inserire nella collezione un documento personale con i seguenti dati
- nome
- cognome
- età
- interessi: un array con almeno 2 valori di tipo stringa
- cittàVisitate: un array con almeno 3 valori tipo oggetti, ciascuno dei quali contiene:
- nome
- stato
- un campo a piacere

Ad esempio:
    {
        nome: "Mario",
        cognome: "Rossi",
        età: 28,
        interessi: ["calcetto", "viaggiare", "serie tv"],
        cittàVisitate: [
            { nome: "Cesena", stato: "Italia" },
            { nome: "Parigi", stato: "Francia" },
            { nome: "San Francisco", stato: "USA"}
        ],
        colorePreferito: "Giallo"
    }

## Update

NB: ricordarsi di impostare l’opzioni multi: true nei casi in cui si vogliono aggiornare più documenti.
1.	Inserire in TUTTI i documenti un campo "crediti", inizializzato a 0
2.	Incrementare di 1 il valore dei propri crediti
3.	Cercare i documenti in cui è specificato "calcio" tra gli interessi
4.	Diminuire di 1 i crediti di tali documenti
5.	Cercare i documenti in cui è specificato "viaggi" o "viaggiare" tra gli interessi
6.	Aumentare di 1 i crediti di tali documenti
7.	Cercare i documenti in cui l’età è maggiore di 40
8.	Aumentare di 1 i crediti di tali documenti
9.	Cercare i documenti in cui esiste un campo che corrisponde al proprio campo a piacere
10.	Aumentare di 1 i crediti di tali documenti
11.	Rimuovere il proprio campo a piacere da tutti i documenti
12.	Usare il $push per aggiungere un campo "numeri" con valore 4 in tutti i documenti
13.	Usare il $push per aggiungere i valori 8, 15 e 16 al campo "numeri" in tutti i documenti
14.	Usare il $push per aggiungere i valori 23 e 42 solo al proprio documento
15.	Usare l’$addToSet per aggiungere i valori 23 e 42 a tutti i documenti 
16.	Verificare che il proprio documento non contenga numeri ripetuti
17.	Estrarre il primo valore dall’array numeri del proprio documento
18.	Estrarre l’ultimo valore dall’array numeri del proprio documento
19.	Estrarre i valori compresi tra 8 e 23 dall’array numeri di tutti i documenti
20.	Impostare a 2017 il campo "anno" nel primo elemento dell’array cittàVisitate nel proprio documento
21.	Impostare un campo "sede" con valore true nell’elemento dell’array cittàVisitate che contiene il campo "nome" valorizzato con "Cesena"
22.	Aggiungere il valore "MongoDB" all’array interessi nel proprio documento usando l’opzione upsert
23.	Aggiungere il valore "MongoDB" all’array interessi del documento con nome "Bill" usando l’opzione upsert

## Delete
24.	Rimuovere tutti i documenti in cui l’array numeri è vuoto. 