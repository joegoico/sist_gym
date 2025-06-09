from fastapi import APIRouter, HTTPException
from typing import List
from backend.services.alumno_service import AlumnoService
from backend.models.alumno_model import AlumnoRead, AlumnoCreate, AlumnoUpdate

router = APIRouter(prefix="/alumnos", tags=["alumnos"])
service = AlumnoService()

@router.get("/", response_model=List[AlumnoRead])
def list_alumnos():
    return service.get_alumnos()

@router.get("/institucion/{institucion_id}", response_model=List[AlumnoRead])
def list_by_institucion(institucion_id: int):
    return service.get_alumnos_by_institucion(institucion_id)

@router.post("/", response_model=AlumnoRead, status_code=201)
def create_alumno(alumno: AlumnoCreate):
    return service.create_alumno(alumno)

@router.put("/{alumno_id}", response_model=AlumnoRead)
def update_alumno(alumno_id: int, alumno: AlumnoUpdate):
    return service.update_alumno(alumno_id, alumno)

@router.delete("/{alumno_id}")
def delete_alumno(alumno_id: int):
    return service.delete_alumno(alumno_id)
