from backend.repositories.deuda_repository import DeudaRepository
from fastapi import HTTPException
from backend.models.deuda_model import DeudaCreate, DeudaUpdate

class DeudaService:
    def __init__(self):
        self.repo = DeudaRepository()

    def get_deudas_by_deudor(self, deudor_id: int):
        try:
            deudas = self.repo.get_by_deudor(deudor_id)
            if not deudas:
                raise HTTPException(status_code=404, detail="No se encontraron deudas")
            return deudas
        except HTTPException:
            raise
        except Exception as e:
            raise HTTPException(status_code=500, detail=str(e))
        
    def get_deuda_by_id(self, id: int):
        try:
            deuda = self.repo.get_by_id(id)
            if not deuda:
                raise HTTPException(status_code=404, detail="Deuda no encontrada")
            return deuda
        except HTTPException:
            raise
        except Exception as e:
            raise HTTPException(status_code=500, detail=str(e))
        
    def create_deuda(self, deuda: DeudaCreate):
        try:
            created_deuda = self.repo.create(deuda)
            if not created_deuda:
                raise HTTPException(status_code=400, detail="Error al crear la deuda")
            return created_deuda
        except HTTPException:
            raise
        except Exception as e:
            raise HTTPException(status_code=500, detail=str(e))
        
    def update_deuda(self, id: int, deuda: DeudaUpdate):
        try:
            updated_deuda = self.repo.update(id, deuda)
            if not updated_deuda:
                raise HTTPException(status_code=400, detail="Error al actualizar la deuda")
            return updated_deuda
        except HTTPException:
            raise
        except Exception as e:
            raise HTTPException(status_code=500, detail=str(e))
        
    def delete_deuda(self, id: int):
        try:
            deleted_deuda = self.repo.delete(id)
            if not deleted_deuda:
                raise HTTPException(status_code=400, detail="Error al eliminar la deuda")
            return deleted_deuda
        except HTTPException:
            raise
        except Exception as e:
            raise HTTPException(status_code=500, detail=str(e))
        
        
        
