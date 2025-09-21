VendiCoseSPA 🛍️
Questo repository contiene lo schema di un database per la gestione di un negozio fittizio, VendiCoseSPA. Il database è progettato per tracciare prodotti, magazzini, vendite e stock, con un sistema automatizzato per la gestione dell'inventario.

🎯 Obiettivo del Progetto
L'obiettivo principale del database è fornire una struttura per:

🛒 Gestire le vendite dei prodotti.

📦 Monitorare i livelli di stock in ogni magazzino.

📊 Ottenere un'analisi trimestrale sulle vendite per categoria.

⚠️ Verificare e gestire il rifornimento dei prodotti quando scendono sotto una soglia minima.

📋 Struttura del Database
Lo schema è composto da 7 tabelle che lavorano insieme per tenere traccia di tutte le operazioni.

Area: Definisce le diverse aree geografiche.

Magazzino: Collega ogni magazzino a un'area specifica.

Negozio: Collega ogni negozio a un magazzino di riferimento.

Categoria: Categorizza i prodotti e definisce una soglia minima di stock (Livello_StockLevel).

Prodotto: Contiene le informazioni di base sui prodotti (nome, costo, categoria).

StockLevel: Registra la quantità di ogni prodotto presente in ogni magazzino.

Vendite: Registra ogni singola transazione di vendita, incluse data e quantità.

🚀 Come Usare il Database
Crea il database e le tabelle:
Esegui l'intero script SQL nel tuo client per database. Questo creerà il database VendiCoseSPA con tutte le tabelle e i vincoli necessari.

Popola il database:
Lo script include già dei comandi INSERT per popolare le tabelle con dati fittizi di esempio.

Esegui le query:
Nel file SQL troverai anche delle query di esempio per:

Processare una vendita: Una transazione che aggiorna automaticamente il livello di stock del prodotto venduto.

Analizzare le vendite: Una query che calcola la media delle quantità vendute per ogni categoria, suddivisa per trimestre.

Verificare lo stock: Una query che individua i prodotti il cui stock è inferiore al livello di soglia impostato.

Rifornire il magazzino: Una transazione che riporta lo stock dei prodotti sotto la soglia al livello minimo prestabilito.

🔗 Relazioni tra le Tabelle
Le tabelle sono collegate tra loro da chiavi esterne per mantenere l'integrità dei dati:

Magazzino → Area (una Area può avere più Magazzino)

Negozio → Magazzino (un Magazzino può rifornire più Negozio)

Prodotto → Categoria (una Categoria può avere più Prodotto)

StockLevel → Prodotto, Magazzino, Categoria (unisce i dati di stock)

Vendite → Prodotto, Negozio (registra le vendite)
