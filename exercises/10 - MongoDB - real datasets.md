# VACCINI

1. Visualizzare la distribuzione mensile dei dati (quanti documenti per ogni mese)

1. Trovare le 10 città col maggior volume di dati

1. Trovare le 10 città col miglior sentiment medio. Visualizzare anche il volume di dati

1. Migliorare la query precedente proponendo una misura che moltiplichi il sentiment medio per il volume di dati

1. Visualizzare la distribuzione dei dati per canale (CHANNELMEDIATYPE)

1. Suddividere il testo in parole

		db.vaccini.aggregate([
			{$project: {
				parole: {
					$split: [{ $toLower: '$CONTENT' }, ' ']
				}
			}}
		])

1. Trovare le parole più utilizzate

1. Trovare le 10 parole più utilizzate con sentiment positivo/negativo

1. Creare un indice di testo sui campi CONTENT e TITLE, con pesi 1 e 2 rispettivamente

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

1. Contare i post in cui si parla di bambini. Tornano i conti rispetto a quanto trovato con la query precedente?

1. Contare i post in cui si parla di autismo e calcolare il sentiment medio

1. Contare i post in cui si parla di Burioni e calcolare il sentiment medio

1. Cercare i post in cui si parla di autismo e di Burioni e (manualmente) verificare se il valore di SENTIMENT_CRAWLER è corretto rispetto al testo del CONTENT

1. Trovare gli hashtag più utilizzati


## POLITICA

1. Quali sono stati i partiti più "chiacchierati" nel giorno delle elezioni?

1. Hashtag più utilizzati?