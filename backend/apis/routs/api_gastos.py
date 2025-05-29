from fastapi import APIRouter, HTTPException

router = APIRouter()

gastos = []

@router.get("/gastos/{gym_id}")
async def get_gastos(gym_id: int):
    """Obtiene todos los gastos de un gimnasio específico por gym_id."""
    gastos_filtrados = list(filter(lambda g: g.GIMNASIO_id_gimnasio == gym_id, gastos))
    if not gastos_filtrados:
        raise HTTPException(status_code=404, detail="No se encontraron gastos para este gimnasio")

    return gastos_filtrados

@router.get("/gastos/{id}")
async def get_gasto(id: int):
    for gasto in gastos:
        if gasto.id_gasto == id:
            return gasto
    raise HTTPException(status_code=404, detail="Gasto not found")

@router.post("/gastos/")
async def create_gasto(gasto: dict, gym_id: int):
    # Check if the gym_id matches the gym_id in the gasto object
    if gasto.get("GIMNASIO_id_gimnasio") != gym_id:
        raise HTTPException(status_code=400, detail="Gym ID mismatch")
    gastos.append(gasto)
    return gasto

@router.put("/gastos/{id}")
async def update_gasto(id: int, gasto: dict):
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
