from backend.models.institucion_model import InstitucionCreate, InstitucionUpdate, InstitucionRead
from fastapi import HTTPException
from backend.repositories.institucion_repository import InstitucionRepository

class InstitucionService:
    def __init__(self):
        self.repo = InstitucionRepository()

    def get_institucion_by(self, institucion_id: int):
        try:
            institucion = self.repo.get_by_id(institucion_id)
            if not institucion:
                raise HTTPException(status_code=404, detail="No se encontro la institucion")
            return institucion
        except HTTPException:
            raise
        except Exception as e:
            raise HTTPException(status_code=500, detail=str(e))
        
    def create(self, institucion: InstitucionCreate):
        try:
            created = self.repo.create(institucion)
            if not created:
                raise HTTPException(status_code=400, detail="No se pudo crear la institucion")
            return created
        except HTTPException:
            raise
        except Exception as e:
            raise HTTPException(status_code=500, detail=str(e))
        
    def update(self, institucion_id: int, institucion: InstitucionUpdate):
        try:
            updated = self.repo.update(institucion_id, institucion)
            if not updated:
                raise HTTPException(status_code=400, detail="No se pudo actualizar la institucion")
            return updated  
        except HTTPException:
            raise
        except Exception as e:
            raise HTTPException(status_code=500, detail=str(e))
        
    def delete(self, institucion_id: int):
        try:
            deleted = self.repo.delete(institucion_id)
            if not deleted:
                raise HTTPException(status_code=400, detail="No se pudo eliminar la institucion")
            return {"message": "Institucion eliminada correctamente"}
        except HTTPException:
            raise
        except Exception as e:
            raise HTTPException(status_code=500, detail=str(e))
