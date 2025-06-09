from pydantic import BaseModel, EmailStr, Field
from typing import List, Optional

class AlumnoBase(BaseModel):
    nombre: str
    apellido: str
    correo_electronico: EmailStr = Field(..., alias="correo_electronico")
    DISCIPLINA_id_disciplina: int
    INSTITUCION_id_institucion: int

    class Config:
        allow_population_by_field_name = True
        allow_population_by_alias = True

class AlumnoCreate(AlumnoBase):
    pass

class AlumnoUpdate(AlumnoBase):
    pass

class AlumnoRead(AlumnoBase):
    id_alumno: int
    descripcion: Optional[str] = None
    pagos_realizados: List[str] = []  # IDs of pagos

    class Config:
        orm_mode = True
        allow_population_by_field_name = True
        allow_population_by_alias = True