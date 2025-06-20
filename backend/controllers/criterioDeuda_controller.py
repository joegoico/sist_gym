from fastapi import APIRouter
from backend.models.criterioDeuda_model import CriterioDeudaCreate, CriterioDeudaRead, CriterioDeudaUpdate
from backend.services.criterioDeuda_service import CriterioDeudaService

router = APIRouter(prefix="/criterio", tags=["criterio deuda"])
service = CriterioDeudaService()

@router.post("/", response_model=CriterioDeudaRead, status_code=201)
def create(criterio: CriterioDeudaCreate):
    return service.create(criterio)

@router.get("/{id}", response_model=CriterioDeudaRead)
def get_criterio(id: int):
    return service.get_by_id(id)

@router.put("/{id}", response_model=CriterioDeudaRead)
def update(id: int, criterio: CriterioDeudaUpdate):
    return service.update(id, criterio)

@router.delete("/{id}")
def delete(id: int):
    return service.delete(id)
