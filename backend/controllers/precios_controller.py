from fastapi import APIRouter, HTTPException
from typing import List, Optional
from backend.models.precio_model import PrecioRead, PrecioCreate, PrecioUpdate    
from backend.services.precios_service import PrecioService
# Assuming Disciplina is defined in api_disciplinas.py

router = APIRouter(
    prefix="/precio",
    tags=["precio"]
)

service = PrecioService()

@router.get("/{id}", response_model=PrecioRead)
async def get_precio(id: int):
    return service.get_precio_by_id(id)

@router.get("/disciplina/{disciplina_id}", response_model=List[PrecioRead])
async def get_precios(disciplina_id: int):
    return service.get_precios_by_disciplina(disciplina_id)


@router.post("/", response_model=PrecioRead)
async def create_precio(precio: PrecioCreate):
    return service.create_precio(precio)

@router.put("/{id}", response_model=PrecioRead)
async def update_precio(id: int, precio: PrecioUpdate):
    return service.update_precio(id, precio)

@router.delete("/{id}")
async def delete_precio(id: int):
    return service.delete_precio(id)
