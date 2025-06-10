from fastapi import HTTPException
from backend.repositories.disciplina_repository import DisciplinaRepository
from backend.models.disciplina_model import DisciplinaCreate, DisciplinaUpdate

class DisciplinaService:
    def __init__(self):
        self.repo = DisciplinaRepository()

    def get_disciplinas_by_institucion(self, institucion_id: int):
        try:
            disciplinas = self.repo.get_by_institucion(institucion_id)
            if not disciplinas:
                raise HTTPException(status_code=404, detail="No se encontraron disciplinas")
            return disciplinas
        except HTTPException:
            raise
        except Exception as e:
            raise HTTPException(status_code=500, detail=str(e))
    
    def get_disciplina_by_id(self, disciplina_id: int):
        try:
            disciplina = self.repo.get_by_id(disciplina_id)
            if not disciplina:
                raise HTTPException(status_code=404, detail="Disciplina no encontrada")
            return disciplina[0]
        except HTTPException:
            raise
        except Exception as e:
            raise HTTPException(status_code=500, detail=str(e))

    def create_disciplina(self, disciplina: DisciplinaCreate):
        try:
            return self.repo.create(disciplina)
        except Exception as e:
            raise HTTPException(status_code=500, detail=str(e))

    def update_disciplina(self, disciplina_id: int, disciplina: DisciplinaUpdate):
        try:
            disciplina_updated = self.repo.update(disciplina_id, disciplina)
            if not disciplina_updated:
                raise HTTPException(status_code=404, detail="Disciplina no encontrada")
            return disciplina_updated[0]
        except HTTPException:
            raise
        except Exception as e:
            raise HTTPException(status_code=500, detail=str(e))

    def delete_disciplina(self, disciplina_id: int):
        try:
            disciplina_deleted = self.repo.delete(disciplina_id)
            if not disciplina_deleted:
                raise HTTPException(status_code=404, detail="Disciplina no encontrada")
            return {"detail": "Disciplina eliminada"}
        except HTTPException:
            raise
        except Exception as e:
            raise HTTPException(status_code=500, detail=str(e))
