# MongoDB  - Esercitazione (Indici)

## $text

## Restaurants
1.	Creare un indice di testo sul campo nome

        db.restaurants.createIndex({name: "text"})


2.	Cercare i ristoranti che hanno il termine “baker” nel nome; verificare i risultati
        
        db.restaurants.find({$text: {$search: "baker" }})

3.	Cercare i ristoranti che hanno il termine “bake” nel nome; verificare i risultati

        db.restaurants.find({$text: {$search: "bake"}})

## YelpBusiness
4.	Creare un indice di testo sul campo categories

        db.yelpbusiness.createIndex({categories: "text"})

5.	Contare i business che utilizzano il termine “service”

        db.yelpbusiness.find({$text: {$search: "service"}})


6.	Contare i business che utilizzano il termine “services”

        db.yelpbusiness.find({$text: {$search: "services"}})


7.	Contare i business che utilizzano i termini “professional” o “service”

        db.yelpbusiness.find({$text: {$search: "professional service"}})

8.	Contare i business che utilizzano i termini “professional” e “service”

        db.yelpbusiness.find({$text: {$search: "\"professional service\""}})

9.	Contare i business che utilizzano il termine “professional” senza “service”

        db.yelpbusiness.find({$text: {$search: "professional -service"}})

        db.vaccini.createIndex({
            TITLE: "text",
            CONTENT: "text"
        }, {
            weights: {
                TITLE: 2,
                CONTENT: 1
            },
            name: "TextIndex"
        })