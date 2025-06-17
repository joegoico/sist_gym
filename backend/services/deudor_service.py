from fastapi import HTTPException
from backend.models.deudor_model import DeudorCreate, DeudorUpdate
from backend.repositories.deudor_repository import DeudorRepository

class DeudorService:
    def __init__ (self):
        self.repo = DeudorRepository()

    def get_deudores(self, institucion_id: int):
        try:
            deudores = self.repo.get_deudores(institucion_id)
            if not deudores:
                raise HTTPException(status_code=404, detail="No se encontraron deudores")
            return deudores
        except HTTPException:
            raise

    def get_by_id(self, id_: int):
        try:
            deudor = self.repo.get_by_id(id_)
            if not deudor:
                raise HTTPException(status_code=404, detail="Deudor no encontrado")
            return deudor
        except HTTPException:
            raise 
        except Exception as e:
            raise HTTPException(status_code=500, detail=str(e))
    

    def create(self, deudor: DeudorCreate):
        try:
            created = self.repo.create(deudor)
            if not created:
                raise HTTPException(status_code=400, detail="Error al crear el deudor")
            return created
        except HTTPException:
            raise
        except Exception as e:
            raise HTTPException(status_code=500, detail=str(e))

    def update(self, id_: int, deudor: DeudorUpdate):
        try:
            updated = self.repo.update(id_, deudor)
            if not updated:
                raise HTTPException(status_code=404, detail="Deudor no encontrado")
            return updated[0]
        except HTTPException:
            raise
        except Exception as e:
            raise HTTPException(status_code=500, detail=str(e))

    def delete(self, id_: int):
        try:
            deleted = self.repo.delete(id_)
            if not deleted:
                raise HTTPException(status_code=404, detail="Deudor no encontrado")
            return deleted[0]
        except HTTPException:
            raise
        except Exception as e:
            raise HTTPException(status_code=500, detail=str(e))
