# MongoDB  - Esercitazione (Indici)

## $text

## Restaurants
1.	Creare un indice di testo sul campo nome
2.	Cercare i ristoranti che hanno il termine “baker” nel nome; verificare i risultati
        
        db.restaurants.find({$text: {$search: "baker" }})

3.	Cercare i ristoranti che hanno il termine “bake” nel nome; verificare i risultati

## YelpBusiness
4.	Creare un indice di testo sul campo categories
5.	Contare i business che utilizzano il termine “service”
6.	Contare i business che utilizzano il termine “services”
7.	Contare i business che utilizzano i termini “professional” o “service”
8.	Contare i business che utilizzano i termini “professional” e “service”
9.	Contare i business che utilizzano il termine “professional” senza “service”
