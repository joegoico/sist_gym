from fastapi import APIRouter
from typing import List
from backend.services.ajuste_service import AjusteService
from backend.models.ajuste_model import AjusteRead, AjusteCreate, AjusteUpdate

router = APIRouter(prefix="/ajuste", tags=["ajuste"])
service = AjusteService()

@router.get("/{ajuste_id}", response_model=AjusteRead)
async def get_ajuste(ajuste_id: int):
    return service.get_ajuste_by_id(ajuste_id)

@router.get("/institucion/{institucion_id}", response_model=List[AjusteRead])
async def get_ajustes_by_institucion(institucion_id: int):
    return service.get_ajustes_by_institucion(institucion_id)

@router.post("/", response_model=AjusteRead)
async def create_ajuste(ajuste: AjusteCreate):
    return service.create_ajuste(ajuste)

@router.put("/{ajuste_id}", response_model=AjusteRead)
async def update_ajuste(ajuste_id: int, ajuste: AjusteUpdate):
    return service.update_ajuste(ajuste_id, ajuste)

@router.delete("/{ajuste_id}")
async def delete_ajuste(ajuste_id: int):
    return service.delete_ajuste(ajuste_id) 