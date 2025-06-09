from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from backend.controllers import alumnos_controller, disciplinas_controller, pagos_controller, precios_controller

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(alumnos_controller.router)
app.include_router(disciplinas_controller.router)
app.include_router(pagos_controller.router)
app.include_router(precios_controller.router)