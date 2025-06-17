from fastapi import APIRouter
from backend.models.deudor_model import DeudorCreate, DeudorUpdate
from backend.services.deudor_service import DeudorService

service = DeudorService()

router = APIRouter(prefix="/deudor", tags=["deudor"])


@router.get("/institucion/{institucion_id}")
def get_deudores(institucion_id: int):
    return service.get_deudores(institucion_id)

@router.get("/{id}")
def get_by_id(id: int):
    return service.get_by_id(id)

@router.post("/")
def create(deudor: DeudorCreate):
    return service.create(deudor)

@router.put("/{id}")
def update(id: int, deudor: DeudorUpdate):
    return service.update(id, deudor)

@router.delete("/{id}")
def delete(id: int):
    return service.delete(id)
