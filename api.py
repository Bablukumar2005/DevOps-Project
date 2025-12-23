from fastapi import FastAPI
from pydantic import BaseModel
import pandas as pd
import joblib

app = FastAPI()

model = joblib.load("rf_model.pkl")

class InsuranceInput(BaseModel):
    age: int
    sex: int
    bmi: float
    children: int
    smoker: int
    region: int

@app.post("/predict")
def predict(data: InsuranceInput):

    input_df = pd.DataFrame([[
        data.age,
        data.sex,
        data.bmi,
        data.children,
        data.smoker,
        data.region
    ]], columns=["age","sex","bmi","children","smoker","region"])

    prediction = model.predict(input_df)[0]

    return {"prediction": round(float(prediction), 2)}
