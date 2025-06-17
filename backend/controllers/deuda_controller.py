from fastapi import APIRouter
from backend.services.deuda_service import DeudaService
from backend.models.deuda_model import DeudaCreate, DeudaUpdate, DeudaRead
from typing import List

router = APIRouter(prefix="/deuda", tags=["deuda"])

service = DeudaService()

@router.get("/deudor/{deudor_id}", response_model=List[DeudaRead])
async def get_deudas_by_deudor(deudor_id: int):
    return service.get_deudas_by_deudor(deudor_id)

@router.get("/{id}", response_model=DeudaRead)
async def get_deuda_by_id(id: int):
    return service.get_deuda_by_id(id)

@router.post("/", status_code=201)
async def create_deuda(deuda: DeudaCreate):
    return service.create_deuda(deuda)

@router.put("/{id}", status_code=200)
async def update_deuda(id: int, deuda: DeudaUpdate):
    return service.update_deuda(id, deuda)

@router.delete("/{id}", status_code=200)
async def delete_deuda(id: int):
    return service.delete_deuda(id)


