from fastapi import APIRouter, HTTPException
from typing import List, Optional
from backend.apis.basic_models import Gasto  # Assuming Gasto is defined in basic_models.py
from backend.apis.routs.api_gimnasios import gimnasios  # Assuming Gimnasio is defined in api_gimnasios.py

router = APIRouter()

gastos = []

@router.get("/gastos/{gym_id}", response_model=List[Gasto])
async def get_gastos(gym_id: int):
    """Obtiene todos los gastos de un gimnasio específico por gym_id."""
    existe = any(gimnasio.id_gimnasio == gym_id for gimnasio in gimnasios) 
    if not existe:
        raise HTTPException(status_code=404, detail="Gimnasio not found")
    else:
        if gym_id is not None:
            gastos_filtrados = list(filter(lambda g: g.GIMNASIO_id_gimnasio == gym_id, gastos))
            if not gastos_filtrados:
                raise HTTPException(status_code=404, detail="No se encontraron gastos para este gimnasio")
            return gastos_filtrados


@router.post("/gastos/")
async def create_gasto(gasto: Gasto):
    """Crea un nuevo gasto."""
    existe = any(gimnasio.id_gimnasio == gasto.GIMNASIO_id_gimnasio for gimnasio in gimnasios) 
    if not existe:
        raise HTTPException(status_code=404, detail="Gimnasio not found")
    else:
        gastos.append(gasto)
    return gasto

@router.put("/gastos/{id}")
async def update_gasto(id: int, gasto: Gasto):
    for index, existing_gasto in enumerate(gastos):
        if existing_gasto.id_gasto == id:
            gastos[index] = gasto
            return gasto
    raise HTTPException(status_code=404, detail="Gasto not found")

@router.delete("/gastos/{id}")
async def delete_gasto(id: int):
    for index, existing_gasto in enumerate(gastos):
        if existing_gasto.id_gasto == id:
            del gastos[index]
            return {"detail": "Gasto deleted"}
    raise HTTPException(status_code=404, detail="Gasto not found")
