from fastapi import HTTPException
from backend.repositories.pagos_repository import PagoRepository
from backend.models.pagos_model import PagoCreate, PagoUpdate, PagoRead

class PagoService:
    def __init__(self):
        self.repo = PagoRepository()

    def get_by_id_pago(self, pago_id: int):
        try:
            return self.repo.get_by_id(pago_id)
        except Exception as e:
            raise HTTPException(status_code=500, detail=str(e))

    def get_pagos_by_alumno(self, alumno_id: int):
        try:
            return self.repo.get_by_alumno(alumno_id)
        except Exception as e:
            raise HTTPException(status_code=500, detail=str(e))

    def create_pago(self, pago: PagoCreate):
        try:
            created = self.repo.create(pago)
            if not created:
                raise HTTPException(status_code=400, detail="Error al crear el pago")
            return created
        except Exception as e:
            raise HTTPException(status_code=500, detail=str(e))

    def update_pago(self, pago_id: int, pago: PagoUpdate):
        try:
            updated = self.repo.update(pago_id, pago)
            if not updated:
                raise HTTPException(status_code=404, detail="Pago no encontrado")
            return updated
        except Exception as e:
            raise HTTPException(status_code=500, detail=str(e))

    def delete_pago(self, pago_id: int):
        try:
            deleted = self.repo.delete(pago_id)
            if not deleted:
                raise HTTPException(status_code=404, detail="Pago no encontrado")
            return {"detail": "Pago eliminado correctamente"}
        except Exception as e:
            raise HTTPException(status_code=500, detail=str(e))
        
