from fastapi import APIRouter
from typing import List
from backend.services.disciplina_service import DisciplinaService
from backend.models.disciplina_model import DisciplinaRead, DisciplinaCreate, DisciplinaUpdate

router = APIRouter(prefix="/disciplina", tags=["disciplina"])
service = DisciplinaService()

@router.get("/institucion/{institucion_id}", response_model=List[DisciplinaRead])
def get_disciplinas_by_institucion(institucion_id: int):
    print("info institucion_id: ", institucion_id)
    return service.get_disciplinas_by_institucion(institucion_id)

@router.get("/{disciplina_id}", response_model=DisciplinaRead)
def get_disciplina_by_id(disciplina_id: int):
    return service.get_disciplina_by_id(disciplina_id)

@router.post("/", response_model=DisciplinaRead)
def create_disciplina(disciplina: DisciplinaCreate):
    return service.create_disciplina(disciplina)

@router.put("/{disciplina_id}", response_model=DisciplinaRead)
def update_disciplina(disciplina_id: int, disciplina: DisciplinaUpdate):
    return service.update_disciplina(disciplina_id, disciplina)

@router.delete("/{disciplina_id}")
def delete_disciplina(disciplina_id: int):
    return service.delete_disciplina(disciplina_id)
