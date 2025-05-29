from fastapi import APIRouter, HTTPException
from typing import List, Optional
from backend.apis.basic_models import Cuota  # Assuming Precio is defined in basic_models.py

router = APIRouter()

cuotas: List[Cuota] = [
    # Para la disciplina 1
    Cuota(id_cuota=1,  DISCIPLINA_id_disciplina=1,  cantidad_dias=30, monto=100.0),
    Cuota(id_cuota=2,  DISCIPLINA_id_disciplina=1,  cantidad_dias=60, monto=180.0),

    # Para la disciplina 2
    Cuota(id_cuota=3,  DISCIPLINA_id_disciplina=2,  cantidad_dias=30, monto=110.0),
    Cuota(id_cuota=4,  DISCIPLINA_id_disciplina=2,  cantidad_dias=60, monto=190.0),

    # Para la disciplina 3
    Cuota(id_cuota=5,  DISCIPLINA_id_disciplina=3,  cantidad_dias=30, monto=120.0),
    Cuota(id_cuota=6,  DISCIPLINA_id_disciplina=3,  cantidad_dias=60, monto=200.0),

    # Para la disciplina 4
    Cuota(id_cuota=7,  DISCIPLINA_id_disciplina=4,  cantidad_dias=30, monto=130.0),
    Cuota(id_cuota=8,  DISCIPLINA_id_disciplina=4,  cantidad_dias=60, monto=210.0),

    # Para la disciplina 5
    Cuota(id_cuota=9,  DISCIPLINA_id_disciplina=5,  cantidad_dias=30, monto=140.0),
    Cuota(id_cuota=10, DISCIPLINA_id_disciplina=5,  cantidad_dias=60, monto=220.0),

    # Para la disciplina 6
    Cuota(id_cuota=11, DISCIPLINA_id_disciplina=6,  cantidad_dias=30, monto=150.0),
    Cuota(id_cuota=12, DISCIPLINA_id_disciplina=6,  cantidad_dias=60, monto=230.0),

    # Para la disciplina 7
    Cuota(id_cuota=13, DISCIPLINA_id_disciplina=7,  cantidad_dias=30, monto=160.0),
    Cuota(id_cuota=14, DISCIPLINA_id_disciplina=7,  cantidad_dias=60, monto=240.0),

    # Para la disciplina 8
    Cuota(id_cuota=15, DISCIPLINA_id_disciplina=8,  cantidad_dias=30, monto=170.0),
    Cuota(id_cuota=16, DISCIPLINA_id_disciplina=8,  cantidad_dias=60, monto=250.0),

    # Para la disciplina 9
    Cuota(id_cuota=17, DISCIPLINA_id_disciplina=9,  cantidad_dias=30, monto=180.0),
    Cuota(id_cuota=18, DISCIPLINA_id_disciplina=9,  cantidad_dias=60, monto=260.0),

    # Para la disciplina 10
    Cuota(id_cuota=19, DISCIPLINA_id_disciplina=10, cantidad_dias=30, monto=190.0),
    Cuota(id_cuota=20, DISCIPLINA_id_disciplina=10, cantidad_dias=60, monto=270.0),

    # Para la disciplina 11
    Cuota(id_cuota=21, DISCIPLINA_id_disciplina=11, cantidad_dias=30, monto=200.0),
    Cuota(id_cuota=22, DISCIPLINA_id_disciplina=11, cantidad_dias=60, monto=280.0),

    # Para la disciplina 12
    Cuota(id_cuota=23, DISCIPLINA_id_disciplina=12, cantidad_dias=30, monto=210.0),
    Cuota(id_cuota=24, DISCIPLINA_id_disciplina=12, cantidad_dias=60, monto=290.0),

    # Para la disciplina 13
    Cuota(id_cuota=25, DISCIPLINA_id_disciplina=13, cantidad_dias=30, monto=220.0),
    Cuota(id_cuota=26, DISCIPLINA_id_disciplina=13, cantidad_dias=60, monto=300.0),

    # Para la disciplina 14
    Cuota(id_cuota=27, DISCIPLINA_id_disciplina=14, cantidad_dias=30, monto=230.0),
    Cuota(id_cuota=28, DISCIPLINA_id_disciplina=14, cantidad_dias=60, monto=310.0),

    # Para la disciplina 15
    Cuota(id_cuota=29, DISCIPLINA_id_disciplina=15, cantidad_dias=30, monto=240.0),
    Cuota(id_cuota=30, DISCIPLINA_id_disciplina=15, cantidad_dias=60, monto=320.0)
]


@router.get("/precios/{gym_id}")
async def get_precios(gym_id: int):
    """Obtiene todos los precios de un gimnasio específico por gym_id."""
    precios_filtrados = list(filter(lambda p: p.DISCIPLINA_id_disciplina == gym_id, cuotas))
    if not precios_filtrados:
        raise HTTPException(status_code=404, detail="No se encontraron precios para este gimnasio")
    return precios_filtrados

@router.get("/precios/{id}")
async def get_precio(id: int):
    for precio in cuotas:
        if precio.id_cuota == id:
            return precio
    raise HTTPException(status_code=404, detail="Precio not found")

@router.post("/precios/")
async def create_precio(precio: Cuota):
    cuotas.append(precio)
    return precio

@router.put("/precios/{id}")
async def update_precio(id: int, precio: Cuota):
    for index, existing_precio in enumerate(cuotas):
        if existing_precio.id_cuota == id:
            cuotas[index] = precio
            return precio
    raise HTTPException(status_code=404, detail="Precio not found")

@router.delete("/precios/{id}")
async def delete_precio(id: int):
    for index, existing_precio in enumerate(cuotas  ):
        if existing_precio.id_cuota == id:
            del cuotas[index]
            return {"detail": "Precio deleted"}
    raise HTTPException(status_code=404, detail="Precio not found")
