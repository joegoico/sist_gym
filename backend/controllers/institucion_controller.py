from fastapi import APIRouter
from backend.services.institucion_service import InstitucionService
from backend.models.institucion_model import InstitucionCreate, InstitucionRead, InstitucionUpdate


router = APIRouter(prefix="/institucion", tags=["institucion"])
service = InstitucionService()


@router.get("/{id}", response_model=InstitucionRead)
async def get_institucion(id: int):
    return service.get_institucion_by(id)


@router.post("/")
async def create_institucion(institucion: InstitucionCreate):
    return service.create(institucion)

@router.put("/{id}")
async def update_institucion(id: int, institucion: InstitucionUpdate):
    return service.update(id, institucion)

@router.delete("/{id}")
async def delete_institucion(id: int):
    return service.delete(id)

