from flask import Flask, render_template
import mysql.connector

app = Flask(__name__)

# Configurazione del database con le tue credenziali specifiche
db_config = {
    'host': 'localhost',
    'user': 'admin_corsi_aziendali',
    'password': 'admin',
    'database': 'corsi_aziendali'
}

def get_db_connection():
    """Stabilisce la connessione al database MySQL [cite: 58]"""
    return mysql.connector.connect(**db_config)

# 1. Home Page: Presentazione dell'azienda [cite: 40, 57]
@app.route('/')
def index():
    return render_template('index.html')

# 2. Pagina Corsi: Recupera tutti i corsi per mostrare le card [cite: 41, 57]
@app.route('/corsi')
def lista_corsi():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    
    # Query per ottenere i dati necessari alle card [cite: 17, 26]
    cursor.execute("SELECT id, nome, categoria, livello, durata_ore, descrizione FROM corsi")
    elenco_corsi = cursor.fetchall()
    
    cursor.close()
    conn.close() # La connessione viene chiusa dopo la query [cite: 58]
    return render_template('corsi.html', corsi=elenco_corsi)

# 3. Pagina Dettaglio: Recupera un corso specifico e le sue sessioni [cite: 42, 57]
@app.route('/corsi/<int:id>')
def dettaglio_corso(id):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    
    # Recupera i dettagli completi del corso [cite: 35]
    cursor.execute("SELECT * FROM corsi WHERE id = %s", (id,))
    corso = cursor.fetchone()
    
    # Recupera le sessioni programmate per questo corso [cite: 36, 53]
    cursor.execute("SELECT * FROM date_corsi WHERE corso_id = %s", (id,))
    sessioni = cursor.fetchall()
    
    cursor.close()
    conn.close() # La connessione viene chiusa dopo la query [cite: 58]
    
    return render_template('dettaglio.html', corso=corso, sessioni=sessioni)

if __name__ == '__main__':
    app.run(debug=True)