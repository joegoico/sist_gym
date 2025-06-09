from pydantic import BaseModel
from typing import Optional, List
class DisciplinaBase(BaseModel):
    nombre: str
    descripcion: str
    INSTITUCION_id_institucion: int

class DisciplinaCreate(DisciplinaBase):
    pass

class DisciplinaUpdate(DisciplinaBase):
    pass

class DisciplinaRead(DisciplinaBase):
    id_disciplina: int
    descripcion: Optional[str] = None
    precios: List[str] = []  # IDs of precios

    class Config:
        orm_mode = True
        allow_population_by_field_name = True
        allow_population_by_alias = True

