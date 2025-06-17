from pydantic import BaseModel
from typing import Optional
from datetime import date

class DeudaBase(BaseModel):
    fecha_reg_deuda: date
    monto: float
    dias: int
    disciplina_id_disciplina: int
    precio_id_precio: int

class DeudaCreate(DeudaBase):
    deudor_id_deudor: int

class DeudaUpdate(DeudaBase):
    fecha_reg_deuda: Optional[date] = None
    monto: Optional[float] = None
    dias: Optional[int] = None
    disciplina_id_disciplina: Optional[int] = None
    precio_id_precio: Optional[int] = None


class DeudaRead(DeudaBase):
    pass