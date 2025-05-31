from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from backend.apis.routs import api_disciplinas, api_precios, api_gastos, api_gimnasios, api_alumnos, api_pagos

app = FastAPI()

# Configuración de CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # En producción, especifica los orígenes permitidos
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(api_disciplinas.router)
app.include_router(api_precios.router)
app.include_router(api_gastos.router)
app.include_router(api_gimnasios.router)
app.include_router(api_alumnos.router)
app.include_router(api_pagos.router)
