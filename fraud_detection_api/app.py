from flask import Flask, request, jsonify
import joblib
import numpy as np
import os

app = Flask(__name__)
MODEL_FILE = 'fraud_detection_model.pkl'

# Chargement du modèle au démarrage
if os.path.exists(MODEL_FILE):
    try:
        model = joblib.load(MODEL_FILE)
        print(f"✅ Modèle chargé : {MODEL_FILE}")
    except Exception as e:
        print(f"❌ Erreur lors du chargement : {e}")
        model = None
else:
    print(f"⚠️ Fichier introuvable : {MODEL_FILE}")
    model = None

@app.route('/predict', methods=['POST'])
def predict():
    # Vérification que le modèle est prêt
    if not model:
        return jsonify({'error': 'Model not loaded'}), 500
    
    try:
        data = request.json
        # Extraction des features (montant, cat, heure, lieu...)
        # Assure-toi que l'ordre correspond à celui de l'entraînement !
        features = np.array([data['features']])
        
        # Prédiction
        prediction = model.predict(features)
        probability = model.predict_proba(features)[0][1]

        return jsonify({
            'is_fraud': bool(prediction[0]),
            'fraud_score': float(probability)
        })
    except Exception as e:
        return jsonify({'error': str(e)}), 400

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)