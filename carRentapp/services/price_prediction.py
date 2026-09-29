import joblib
import pandas as pd

from pathlib import Path
from django.conf import settings


MODEL_PATH = (
    Path(settings.BASE_DIR)
    / "ml_models"
    / "rental_price_model.pkl"
)

model = joblib.load(MODEL_PATH)


def predict_rental_price(
    brand,
    model_name,
    manufacturing_year,
    vehicle_type,
    fuel_type,
    transmission,
    seats,
    mileage,
    condition,
    location,
    rental_duration,
    month,
    demand_score,
    available_vehicles,
):
    data = pd.DataFrame([{
        "Brand": brand,
        "Model": model_name,
        "Manufacturing_Year": manufacturing_year,
        "Vehicle_Type": vehicle_type,
        "Fuel_Type": fuel_type,
        "Transmission": transmission,
        "Seats": seats,
        "Mileage_KMPL": mileage,
        "Condition": condition,
        "Location": location,
        "Rental_Duration_Days": rental_duration,
        "Month": month,
        "Demand_Score": demand_score,
        "Available_Vehicles": available_vehicles,
    }])

    prediction = model.predict(data)

    return round(float(prediction[0]), 2)