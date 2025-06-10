from pydantic import BaseModel, field_validator
from datetime import date, datetime
from typing import Optional

class PagoCreate(BaseModel):
    alumno_id_alumno: int
    fecha_pago: date
    descuento: bool
    cargo_adicional: bool
    PRECIO_id_precio: int

    @field_validator('fecha_pago', mode='before')
    def parse_fecha_pago(cls, value):
        # Si es string intenta analizarlo
        if isinstance(value, str):
            print("fecha_pago: ", datetime.strptime(value, "%d/%m/%Y").date())
            # Primero intenta con el formato DD/MM/YYYY
            try:
                return datetime.strptime(value, "%d/%m/%Y").date()
            except ValueError:
                # Si falla, intenta con el formato ISO YYYY-MM-DD
                try:
                    return date.fromisoformat(value)
                except ValueError:
                    raise ValueError("fecha_pago debe estar en formato DD/MM/YYYY o YYYY-MM-DD")
        # Si ya es un objeto date o compatible, se retorna directamente
        return value

    class Config:
        validate_by_name = True
        allow_population_by_alias = True
        # Este encoder se utilizará para la serialización a JSON
        json_encoders = {
            date: lambda v: v.isoformat()
        }

# Puedes definir también modelos para actualizar o leer, heredando de PagoCreate o adaptando el campo:
class PagoUpdate(BaseModel):
    fecha_pago: Optional[date] = None
    descuento: Optional[bool] = None
    cargo_adicional: Optional[bool] = None
    PRECIO_id_precio: Optional[int] = None

    @field_validator('fecha_pago', mode='before')
    def parse_fecha_pago(cls, value):
        if value is None:
            return value
        if isinstance(value, str):
            try:
                return datetime.strptime(value, "%d/%m/%Y").date()
            except ValueError:
                try:
                    return date.fromisoformat(value)
                except ValueError:
                    raise ValueError("fecha_pago debe estar en formato DD/MM/YYYY o YYYY-MM-DD")
        return value

    class Config:
        validate_by_name = True
        allow_population_by_alias = True
        json_encoders = {
            date: lambda v: v.isoformat()
        }

class PagoRead(PagoCreate):
    id_pago: int

    class Config:
        from_attributes = True
        validate_by_name = True
        allow_population_by_alias = True
        json_encoders = {
            date: lambda v: v.isoformat()
        }