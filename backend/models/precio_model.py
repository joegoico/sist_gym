from pydantic import BaseModel

class PrecioBase(BaseModel):
    cant_dias: int
    monto: float
    DISCIPLINA_id_disciplina: int

    class Config:
        allow_population_by_field_name = True
        allow_population_by_alias = True

class PrecioCreate(PrecioBase):
    pass

class PrecioUpdate(PrecioBase):
    pass

class PrecioRead(PrecioBase):
    id_precio: int

    class Config:
        orm_mode = True
        allow_population_by_field_name = True
        allow_population_by_alias = True
