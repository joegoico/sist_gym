from fastapi import HTTPException
from backend.repositories.alumno_repository import AlumnoRepository
from backend.models.alumno_model import AlumnoCreate, AlumnoUpdate

class AlumnoService:
    def __init__(self):
        self.repo = AlumnoRepository()

    def get_alumnos(self):
        try:
            return self.repo.get_all()
        except Exception as e:
            raise HTTPException(status_code=500, detail=str(e))

    def get_alumnos_by_institucion(self, institucion_id: int):
        try:
            return self.repo.get_by_institucion(institucion_id)
        except Exception as e:
            raise HTTPException(status_code=500, detail=str(e))

    def create_alumno(self, alumno: AlumnoCreate):
        try:
            return self.repo.create(alumno)
        except Exception as e:
            raise HTTPException(status_code=500, detail=str(e))

    def update_alumno(self, alumno_id: int, alumno: AlumnoUpdate):
        try:
            updated = self.repo.update(alumno_id, alumno)
            if not updated:
                raise HTTPException(status_code=404, detail="Alumno no encontrado")
            return updated
        except HTTPException:
            raise
        except Exception as e:
            raise HTTPException(status_code=500, detail=str(e))

    def delete_alumno(self, alumno_id: int):
        try:
            deleted = self.repo.delete(alumno_id)
            if not deleted:
                raise HTTPException(status_code=404, detail="Alumno no encontrado")
            return {"detail": "Alumno eliminado correctamente"}
        except HTTPException:
            raise
        except Exception as e:
            raise HTTPException(status_code=500, detail=str(e))