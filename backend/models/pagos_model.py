from pydantic import BaseModel
from datetime import date

class PagoModel(BaseModel):
    alumno_id_alumno: int
    fecha_pago: date
    descuento: bool
    cargo_adicional: bool
    PRECIO_id_precio: int

    class Config:
        allow_population_by_field_name = True
        allow_population_by_alias = True

class PagoCreate(PagoModel):
    pass

class PagoUpdate(PagoModel):
    pass

class PagoRead(PagoModel):
    id_pago: int

    class Config:
        orm_mode = True
        allow_population_by_field_name = True
        allow_population_by_alias = True
    
