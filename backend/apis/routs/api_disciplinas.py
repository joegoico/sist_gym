from fastapi import APIRouter, HTTPException
from backend.apis.basic_models import Disciplina
from backend.apis.routs.api_gimnasios import gimnasios  # Assuming Gimnasio is defined in api_gimnasios.py
from typing import List, Optional

router = APIRouter()

disciplinas = [
    # Gimnasio 1
    Disciplina(id_disciplina=1,nombre="Disciplina 1A",descripcion="Descripción de Disciplina 1A",GIMNASIO_id_gimnasio=1),
    Disciplina(id_disciplina=2,nombre="Disciplina 1B",descripcion="Descripción de Disciplina 1B",GIMNASIO_id_gimnasio=1),
    Disciplina(id_disciplina=3,nombre="Disciplina 1C",descripcion="Descripción de Disciplina 1C",GIMNASIO_id_gimnasio=1),
    # Gimnasio 2
    Disciplina(id_disciplina=4,nombre="Disciplina 2A",descripcion="Descripción de Disciplina 2A",GIMNASIO_id_gimnasio=2),
    Disciplina(id_disciplina=5,nombre="Disciplina 2B",descripcion="Descripción de Disciplina 2B",GIMNASIO_id_gimnasio=2),
    Disciplina(id_disciplina=6,nombre="Disciplina 2C",descripcion="Descripción de Disciplina 2C",GIMNASIO_id_gimnasio=2),
    # Gimnasio 3
    Disciplina(id_disciplina=7,nombre="Disciplina 3A",descripcion="Descripción de Disciplina 3A",GIMNASIO_id_gimnasio=3),
    Disciplina(id_disciplina=8,nombre="Disciplina 3B",descripcion="Descripción de Disciplina 3B",GIMNASIO_id_gimnasio=3),
    Disciplina(id_disciplina=9,nombre="Disciplina 3C",descripcion="Descripción de Disciplina 3C",GIMNASIO_id_gimnasio=3),
    # Gimnasio 4
    Disciplina(id_disciplina=10,nombre="Disciplina 4A",descripcion="Descripción de Disciplina 4A",GIMNASIO_id_gimnasio=4),
    Disciplina(id_disciplina=11,nombre="Disciplina 4B",descripcion="Descripción de Disciplina 4B",GIMNASIO_id_gimnasio=4),
    Disciplina(id_disciplina=12,nombre="Disciplina 4C",descripcion="Descripción de Disciplina 4C",GIMNASIO_id_gimnasio=4),
    # Gimnasio 5
    Disciplina(id_disciplina=13,nombre="Disciplina 5A",descripcion="Descripción de Disciplina 5A",GIMNASIO_id_gimnasio=5),
    Disciplina(id_disciplina=14,nombre="Disciplina 5B",descripcion="Descripción de Disciplina 5B",GIMNASIO_id_gimnasio=5),
    Disciplina(id_disciplina=15,nombre="Disciplina 5C",descripcion="Descripción de Disciplina 5C",GIMNASIO_id_gimnasio=5),
]


@router.get("/disciplinas/{gym_id}", response_model=List[Disciplina])
async def get_disciplinas(gym_id: int):
    """Obtiene todas las disciplinas de un gimnasio específico por gym_id."""
    existe = any(gimnasio.id_gimnasio == gym_id for gimnasio in gimnasios) 
    if not existe:
        raise HTTPException(status_code=404, detail="Gimnasio not found")
    else:
        if gym_id is not None:
            disciplinas_filtradas = list(filter(lambda d: d.GIMNASIO_id_gimnasio == gym_id, disciplinas))
            if not disciplinas_filtradas:
                raise HTTPException(status_code=404, detail="No se encontraron disciplinas para este gimnasio")
            return disciplinas_filtradas

@router.post("/disciplinas/")
async def create_disciplina(disciplina: Disciplina):
    existe = any(gimnasio.id_gimnasio == disciplina.GIMNASIO_id_gimnasio for gimnasio in gimnasios) 
    if not existe:
        raise HTTPException(status_code=404, detail="Gimnasio not found")
    else:
        disciplinas.append(disciplina)
    return disciplina

@router.put("/disciplinas/{id}")
async def update_disciplina(id: int, disciplina: Disciplina):
    for index, existing_disciplina in enumerate(disciplinas):
        if existing_disciplina.id_disciplina == id:
            disciplinas[index] = disciplina
            return disciplina
    raise HTTPException(status_code=404, detail="Disciplina not found")

@router.delete("/disciplinas/{id}")
async def delete_disciplina(id: int):
    for index, existing_disciplina in enumerate(disciplinas):
        if existing_disciplina.id_disciplina == id:
            del disciplinas[index]
            return {"detail": "Disciplina deleted"}
    raise HTTPException(status_code=404, detail="Disciplina not found")
