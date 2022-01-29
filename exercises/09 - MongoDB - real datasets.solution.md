Distribuzione mensile dei dati
db.vaccini.aggregate([
    {$project: {
        "y": { "$year": "$DATE" },
        "m": { "$month": "$DATE" }
    }},
    {$group: {
        _id: { "y": "$y", "m": "$m" },
        cnt: { $sum: 1 }
    }},
	{$sort: {
		_id: 1
	}}
])

Trovare le 10 città col maggior volume di dati
db.vaccini.aggregate([
    {$group: {
        _id: "$CITY",
        cnt: { $sum: 1 }
    }},
	{$sort: {
		cnt: -1
	}}
])

Trovare le 10 città col miglior sentiment medio. Visualizzare anche il volume di dati
db.vaccini.aggregate([
    {$group: {
        _id: "$CITY",
        avgSent: { $avg: "$SENTIMENT_CRAWLER" },
        cnt: {$sum: 1}
    }},
	{$sort: {
		avgSent: -1
	}}
])

Migliorare la query precedente proponendo una misura che moltiplichi il sentiment medio per il volume di dati
db.vaccini.aggregate([
    {$group: {
        _id: "$CITY",
        avgSent: { $avg: "$SENTIMENT_CRAWLER" },
        cnt: {$sum: 1}
    }},
	{$project: {
		"avgSentWeighted": {
			$multiply: ["$avgSent", "$cnt"]
		}
	}},
	{$sort: {
		avgSentWeighted: -1
	}}
])

Visualizzare la distribuzione dei dati per canale
db.vaccini.aggregate([
    {$group: {
        _id: "$CHANNELMEDIATYPE",
        cnt: { $sum: 1 }
    }},
	{$sort: {
		cnt: -1
	}}
])

Suddividere il testo in parole
db.vaccini.aggregate([
	{$project: {
		parole: {
			$split: [{ $toLower: '$CONTENT' }, ' ']
		}
	}}
])

Trovare le parole più utilizzate
db.vaccini.aggregate([
	{$project: {
		parole: {
			$split: [{ $toLower: '$CONTENT' }, ' ']
		}
	}},
	{$unwind: '$parole'},
	{$group: {
		_id: '$parole',
		cnt: {$sum: 1}
	}},
	{$sort: {
		cnt: -1
	}},
	{$skip: 50}
])

Trovare le 10 parole più utilizzate con sentiment positivo/negativo
db.vaccini.aggregate([
	{$project: {
		parole: {
			$split: [{ $toLower: '$CONTENT' }, ' ']
		},
		SENTIMENT_CRAWLER: 1
	}},
	{$unwind: '$parole'},
	{$group: {
		_id: '$parole',
		cnt: {$sum: 1},
		avgSent: { $avg: '$SENTIMENT_CRAWLER'}
	}},
	{$match: {
		avgSent: { $ne: null }
	}},
	{$sort: {
		avgSent: -1
	}}
])

Creare un indice di testo sui campi CONTENT e TITLE, con pesi 1 e 2 rispettivamente
db.vaccini.createIndex({
	TITLE: "text",
    CONTENT: "text"
},{
    weights: {
		TITLE: 2,
		CONTENT: 1
    },
    name: "TextIndex"
})

Contare i post in cui si parla di bambini
db.vaccini.aggregate([
	{$match: {
		$text: {$search: "bambini"}
	}},
	{$group: {
		_id: "Count",
		cnt: { $sum: 1 }
	}}
])

Tornano i conti rispetto a quanto trovato con la query precedente?

Contare i post in cui si parla di autismo e calcolare il sentiment medio
db.vaccini.aggregate([
	{$match: {
		$text: {$search: "autismo"}
	}},
	{$group: {
		_id: "Count",
		cnt: { $sum: 1 },
		avgSent: { $avg: '$SENTIMENT_CRAWLER'}
	}}
])

Contare i post in cui si parla di Burioni e calcolare il sentiment medio
db.vaccini.aggregate([
	{$match: {
		$text: {$search: "Burioni"}
	}},
	{$group: {
		_id: "Count",
		cnt: { $sum: 1 },
		avgSent: { $avg: '$SENTIMENT_CRAWLER'}
	}}
])

Cercare i post in cui si parla di autismo e di Burioni e (manualmente) verificare se il valore di SENTIMENT_CRAWLER è corretto rispetto al testo del CONTENT
db.vaccini.aggregate([
	{$match: {
		$text: {$search: "\"autismo\" \"burioni\""}
	}},
	{$group: {
		_id: "Count",
		cnt: { $sum: 1 }
	}}
])

Trovare gli hashtag più utilizzati
db.vaccini.aggregate([
	{$project: {
		hashtags: {
			$split: [{ $toLower: '$TW_HASHTAGS' }, ', ']
		}
	}},
	{$unwind: '$hashtags'},
	{$group: {
		_id: '$hashtags',
		cnt: {$sum: 1}
	}},
	{$sort: {
		cnt: -1
	}}
])

##

Quali sono stati i partiti più "chiacchierati" nel giorno delle elezioni?
db.politica.aggregate([
	{$project: {
		parole: {
			$split: [{ $toLower: '$CONTENT' }, ' ']
		}
	}},
	{$unwind: '$parole'},
	{$group: {
		_id: '$parole',
		cnt: {$sum: 1}
	}},
	{$sort: {
		cnt: -1
	}},
	{$skip: 50}
])

Hashtag più utilizzati?
db.politica.aggregate([
	{$project: {
		parole: {
			$split: [{ $toLower: '$CONTENT' }, ' ']
		}
	}},
	{$unwind: '$parole'},
        {$match: {
            'parole': {
                neq: null
            }
        }},
        {$project: {
            'ishashtag': {
                $eq: [{$substr: ['$parole',0,1]}, '#']
            },
            'parole': 1
        }},
        {$match: {
            'ishashtag': true
        }},
	{$group: {
		_id: '$parole',
		cnt: {$sum: 1}
	}},
	{$sort: {
		cnt: -1
	}},
	{$skip: 50}
])