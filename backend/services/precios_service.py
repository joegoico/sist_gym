from backend.repositories.precios_repository import PrecioRepository
from fastapi import HTTPException
from backend.models.precio_model import PrecioCreate, PrecioUpdate

class PrecioService:
    def __init__(self):
        self.repo = PrecioRepository()

    def get_precio_by_id(self, precio_id: int):
        try:
            return self.repo.get_by_id(precio_id)
        except Exception as e:
            raise HTTPException(status_code=500, detail=str(e))
        
    def get_precios_by_disciplina(self, disciplina_id: int):
        try:
            return self.repo.get_by_disciplina(disciplina_id)
        except Exception as e:
            raise HTTPException(status_code=500, detail=str(e))
        
    def create_precio(self, precio: PrecioCreate):
        try:
            return self.repo.create(precio)
        except Exception as e:
            raise HTTPException(status_code=500, detail=str(e))
        
    def update_precio(self, precio_id: int, precio: PrecioUpdate):
        try:
            updated = self.repo.update(precio_id, precio)
            if not updated:
                raise HTTPException(status_code=404, detail="Precio no encontrado")
            return updated
        except Exception as e:
            raise HTTPException(status_code=500, detail=str(e))
        
    def delete_precio(self, precio_id: int):
        try:
            deleted = self.repo.delete(precio_id)
            if not deleted:
                raise HTTPException(status_code=404, detail="Precio no encontrado")
            return {"detail": "Precio eliminado correctamente"}
        except Exception as e:
            raise HTTPException(status_code=500, detail=str(e))
