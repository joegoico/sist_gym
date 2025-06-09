from fastapi import HTTPException
from backend.repositories.disciplina_repository import DisciplinaRepository
from backend.models.disciplina_model import DisciplinaCreate, DisciplinaUpdate

class DisciplinaService:
    def __init__(self):
        self.repo = DisciplinaRepository()

    def get_disciplinas_by_institucion(self, institucion_id: int):
        try:
            print("info institucion_id: ", institucion_id)
            return self.repo.get_by_institucion(institucion_id)
        except Exception as e:
            raise HTTPException(status_code=500, detail=str(e))
    
    def get_disciplina_by_id(self, disciplina_id: int):
        try:
            return self.repo.get_by_id(disciplina_id)
        except Exception as e:
            raise HTTPException(status_code=500, detail=str(e))

    def create_disciplina(self, disciplina: DisciplinaCreate):
        try:
            return self.repo.create(disciplina)
        except Exception as e:
            raise HTTPException(status_code=500, detail=str(e))

    def update_disciplina(self, disciplina_id: int, disciplina: DisciplinaUpdate):
        try:
            return self.repo.update(disciplina_id, disciplina)
        except Exception as e:
            raise HTTPException(status_code=500, detail=str(e))

    def delete_disciplina(self, disciplina_id: int):
        try:
            return self.repo.delete(disciplina_id)
        except Exception as e:
            raise HTTPException(status_code=500, detail=str(e))
