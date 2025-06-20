from fastapi import HTTPException
from backend.repositories.criterioDeuda_repository import CriterioDeudaRepository
from backend.models.criterioDeuda_model import CriterioDeudaCreate, CriterioDeudaUpdate

class CriterioDeudaService:
    def __init__(self):
        self.repo = CriterioDeudaRepository()

    def create(self, criterio: CriterioDeudaCreate):
        return self.repo.create(criterio)

    def get_by_id(self, criterio_id: int):
        criterio = self.repo.get_by_id(criterio_id)
        if not criterio:
            raise HTTPException(status_code=404, detail="Criterio no encontrado")
        return criterio

    def update(self, criterio_id: int, criterio: CriterioDeudaUpdate):
        updated = self.repo.update(criterio_id, criterio)
        if not updated:
            raise HTTPException(status_code=404, detail="Criterio no encontrado")
        return updated[0]

    def delete(self, criterio_id: int):
        eliminado = self.repo.delete(criterio_id)
        if not eliminado:
            raise HTTPException(status_code=404, detail="Criterio no encontrado")
        return {"detail": "Criterio eliminado"}
