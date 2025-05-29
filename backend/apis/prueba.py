from fastapi import FastAPI
from backend.apis.routs import api_disciplinas, api_precios, api_gastos, api_gimnasios, api_alumnos

app = FastAPI()

app.include_router(api_disciplinas.router)
app.include_router(api_precios.router)
app.include_router(api_gastos.router)
app.include_router(api_gimnasios.router)
app.include_router(api_alumnos.router)
