from typing import Literal, Optional
from pydantic import BaseModel
from backend.interfaces.criterio_deuda import (
    CriterioDeuda,
    DeudaFechaFija,
    DeudaPorVencimiento,
)

# Modelo que representa un registro de la base de datos
class CriterioDeudaDB(BaseModel):
    tipo_criterio: Literal["fecha_fija", "vencimiento"]
    dia: Optional[int] = None
    institucion_id_institucion: int

class CriterioDeudaCreate(BaseModel):
    tipo_criterio: Literal["fecha_fija", "vencimiento"]
    dia: Optional[int] = None
    institucion_id_institucion: int

class CriterioDeudaUpdate(BaseModel):
    tipo_criterio: Optional[Literal["fecha_fija", "vencimiento"]] = None
    dia: Optional[int] = None

class CriterioDeudaRead(BaseModel):
    id_criterio: int
    tipo_criterio: Literal["fecha_fija", "vencimiento"]
    dia: Optional[int] = None

    class Config:
        from_attributes = True


def construir_criterio(data: CriterioDeudaDB) -> CriterioDeuda:
    if data.tipo_criterio == "fecha_fija":
        if data.dia is None:
            raise ValueError("El criterio 'fecha_fija' requiere un día")
        return DeudaFechaFija(data.dia)
    elif data.tipo_criterio == "vencimiento":
        return DeudaPorVencimiento()
    else:
        raise ValueError(f"Criterio desconocido: {data.tipo_criterio}")
