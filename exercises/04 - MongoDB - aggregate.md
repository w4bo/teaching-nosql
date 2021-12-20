# MongoDB  - Esercitazione (Aggregate)

## $project e $match

### Yelp business
1.	Restituire, per ogni business, un campo totalStars ottenuto moltiplicando stars per review_count
    ```
    db.yelpbusiness.aggregate([{
        $project: {
        "totalStars": { 
            $multiply: [ “$stars”, “$review_count” ]
        },
        "stars": 1,
        "review_count": 1
        }
    }])
    ```

2.	Restituire, per ogni business, un campo totalStars2 ottenuto moltiplicando stars per review_count e sottraendo il campo is_open al risultato
3.	Restituire, per ogni business, un campo isNevada che indichi se il business si trova o meno nello stato del Nevada (operatore $eq)
4.	Restituire, per i soli business che si trovano in Nevada, il campo totalStars come definito in query 1
5.	Restituire, per ogni business, un campo totalStars3 ottenuto moltiplicando stars per review_count se il business si trova nel Nevada, oppure dividendo stars per review_count in caso contrario (operatore $cond)

### Games
6.	Restituire (in campi separati) l’anno, il mese ed il giorno di ogni partita 
7.	Restituire un campo che indichi quanti anni fa è stata disputata ciascuna partita
(sottrarre l’anno di new Date() dall’anno della partita)
8.	Restituire un campo che indichi quanti giorni fa è stata disputata ciascuna partita
(sottrarre new Date() dalla data della partita e trasformare da millisecondi a giorni)
9.	Restituire, per ogni partita, un campo “team1” ed un campo “team2” che contengono rispettivamente il contenuto del primo e del secondo oggetto all’interno dell’array teams

    ```
    db.games.aggregate([{
        $project: {
            "team1": {$arrayElemAt: ["$teams", 0]},
            "team2": {$arrayElemAt: ["$teams", 1]}¬¬
        }
    },{
        $project: {
            "diffPunti": { 
            $abs: { 
                $subtract: ["$team1.score","$team2.score"] 
            }
        },
            "punti1": "$team1.score",
            "punti2": "$team2.score"
        } 
    }])
    ```

10. Data la query 9, restituire, per ogni partita, la differenza tra i punteggi delle due squadre (utilizzare l’operatore “$abs”)

    ```
    db.games.aggregate([{
        $project: {
            "team1": {$arrayElemAt: ["$teams", 0]},
            "team2": {$arrayElemAt: ["$teams", 1]}¬¬
        }
    },{
        $project: {
            "diffPunti": { 
            $abs: { 
                $subtract: ["$team1.score","$team2.score"] 
            }
        },
            "punti1": "$team1.score",
            "punti2": "$team2.score"
        } 
    }])
    ```

11.	Dalla query precedente, restituire anche un campo booleano che indichi se la partita si è conclusa con un punto di differenza (true) o con più punti di differenza (false)
12.	Data la query precedente, filtrare solo le partite in cui la differenza è di un unico punto
13.	Data la query precedente, filtrare solo le partite in cui la differenza è di un unico punto E in cui ha vinto la squadra di casa
Restaurants
14.	Restituire un unico campo “fullAddress” che metta insieme (nell’ordine indicato) i campi zipcode, street e building contenuti dentro ad address
15.	Restituire i primi 3 caratteri del campo borough
16.	Restituire i primi 3 caratteri del campo borough in lettere maiuscole

## $group e $sort

### Restaurants
17.	Raggruppare per borough
18.	Raggruppare per borough e contare i ristoranti
19.	Raggruppare per cuisine e contare i ristoranti; ordinare il risultato alfabeticamente
20.	Raggruppare per cuisine e contare i ristoranti; ordinare il risultato per numero decrescente di ristoranti

### Yelp-business
21.	Raggruppare per state e calcolare il punteggio medio (stars)
22.	Raggruppare per city e per state e calcolare il punteggio medio (stars)
23.	Raggruppare per state e calcolare il punteggio medio (stars) e la somma di review ricevute
24.	Raggruppare per city del Nevada e calcolare il punteggio medio (stars) e la somma di review ricevute
25.	Data la query 24, mantenere solo le city che hanno almeno 4.5 di punteggio medio
26.	Data la query 24, mantenere solo le city che hanno almeno 4.5 di punteggio medio E almeno 100 review
27.	Raggruppare per state ed individuare per ciascuno il punteggio più elevato
28.	Raggruppare per state ed individuare per ciascuno il punteggio più elevato, ma senza utilizzare l’operatore $max
29.	Raggruppare per state ed individuare per ciascuno l’elenco distinto di città (usando l’operatore $addToSet)

## $unwind

### Games
30.	Per ogni partita, creare un campo idPartita che indichi la data di svolgimento e le squadre che hanno giocato (ad esempio, “1985-10-25: Chicago Bulls vs Cleveland Cavaliers)
    - non richiede l’uso di $unwind
    - $dateToString: {format: "%Y-%m-%d", date: "$date"}
31.	Eseguire l’unwind dell’array teams
32.	Eseguire l’unwind dell’array teams e raggruppare per _ID della partita per ottenere il totale di punti segnati 
33.	Come la query precedente, ma raggruppare per idPartita (come definito in query 30)
34.	Eseguire l’unwind dell’array teams e raggruppare per anno per ottenere il totale di punti segnati
35.	Dalla query precedente, raggruppare per anno e squadra per ottenere il totale di punti segnati
36.	Dalla query precedente, ordinare per anno e punti segnati (decrescente) per ottenere le classifiche annuali
37.	Eseguire l’unwind dell’array box e dell’array players
38.	Dalla query precedente, raggruppare per player per ottenere il totale di punti segnati; ordinare il risultato per visualizzare per primi i migliori giocatori del’NBA

### Restaurants
39.	Eseguire l’unwind dell’array grades
40.	Dalla query 39, raggruppare per borough e ottenere lo score medio
41.	Dalla query 39, raggruppare per cuisine e ottenere lo score medio
42.	Ripetere la query 41 considerando solo i voti assegnati nel 2015
43.	Dalla query 39, raggruppare per anno e contare il numero di voti assegnati

## Esercizi conclusivi

### Yelp business
44.	Individuare i 10 	attributes più frequenti
45.	Individuare i 10 attributes più frequenti nello stato del Nevada
46.	Classificare gli stati in base al numero di business aperti che hanno un punteggio di 5 stelle
47.	Individuare le 5 categorie col punteggio medio più alto
48.	Elencare, per ogni state, le city in cui sono presenti dei business
49.	Sommare il numero di review per ogni state e per ogni city

### Restaurants
50.	Individuare, per ogni borough, il punteggio medio ricevuto di anno in anno; ordinare i risultati per borough e per anno
51.	Come la query precedente, ma considerare solamente i casi in cui grade = A

### Games
52.	Individuare la classifica delle squadre nell’anno 2010
53.	Individuare, per ogni anno, la classifica dei giocatori
54.	Dalla query precedente, mantenere per ogni anno il solo giocatore che ha totalizzato il punteggio maggiore
55.	Come la query precedente, ma calcolare il punteggio di ogni giocatore considerando i campi “fg” (“field goal” = tiro da 2 punti), “fg3” (tiro da 3 punti) e “ft” (“free throw” = tiro libero da 1 punto)
