from fastapi import APIRouter, HTTPException
from typing import List, Optional
from backend.models.pagos_model import PagoRead, PagoCreate, PagoUpdate
from backend.services.pagos_service import PagoService

router = APIRouter(
    prefix="/pago",
    tags=["pago"]
)

service = PagoService()


@router.get("/ {id_alumno}", response_model=List[PagoRead])
async def get_pagos(id_alumno: int ):
    return service.get_pagos_by_alumno(id_alumno)


@router.post("/")
async def create_pago(pago: PagoCreate):
    return service.create_pago(pago)

@router.put("/{id}")
async def update_pago(id: int, pago: PagoUpdate):
    return service.update_pago(id, pago)

@router.delete("/{id}")
async def delete_pago(id: int):
    return service.delete_pago(id)


