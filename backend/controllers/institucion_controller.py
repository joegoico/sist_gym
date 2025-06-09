from fastapi import APIRouter, HTTPException
from backend.apis.basic_models import Gimnasio

router = APIRouter()

gimnasios = [
    Gimnasio(id_gimnasio=1, nombre="Gimnasio Powerhouse"),
    Gimnasio(id_gimnasio=2, nombre="Gimnasio Vitality"),
    Gimnasio(id_gimnasio=3, nombre="Gimnasio Pro Fitness"),
    Gimnasio(id_gimnasio=4, nombre="Gimnasio Elite Workout"),
    Gimnasio(id_gimnasio=5, nombre="Gimnasio Dynamic Energy"),
]

@router.get("/gimnasios/{id}")
async def get_gimnasio(id: int):
    for gimnasio in gimnasios:
        if gimnasio.id_gimnasio == id:
            return gimnasio
    raise HTTPException(status_code=404, detail="Gimnasio not found")

@router.post("/gimnasios/")
async def create_gimnasio(gimnasio: Gimnasio):
    gimnasios.append(gimnasio)
    return gimnasio

@router.put("/gimnasios/{id}")
async def update_gimnasio(id: int, gimnasio: Gimnasio):
    for index, existing_gimnasio in enumerate(gimnasios):
        if existing_gimnasio.id_gimnasio == id:
            gimnasios[index] = gimnasio
            return gimnasio
    raise HTTPException(status_code=404, detail="Gimnasio not found")

@router.delete("/gimnasios/{id}")
async def delete_gimnasio(id: int):
    for index, existing_gimnasio in enumerate(gimnasios):
        if existing_gimnasio.id_gimnasio == id:
            del gimnasios[index]
            return {"detail": "Gimnasio deleted"}
    raise HTTPException(status_code=404, detail="Gimnasio not found")
