from pydantic import BaseModel
from typing import Optional, List, Dict, Any

class Pago(BaseModel):
    id_pago: int
    ALUMNO_id_alumno: int
    fecha: str
    monto: float
    desc: bool

class Cuota(BaseModel):
    id_cuota: int
    DISCIPLINA_id_disciplina: int
    cantidad_dias: int
    monto: float

class Disciplina(BaseModel):
    id_disciplina: int
    nombre: str
    descripcion: str
    GIMNASIO_id_gimnasio: int

class Gasto(BaseModel):
    id_gasto: int
    titulo: str
    descripcion: Optional[str] = None
    fecha: str
    monto: float
    GIMNASIO_id_gimnasio: int

class Alumno(BaseModel):
    id_alumno: int
    nombre: str
    apellido: str
    email: Optional[str] = None
    GIMNASIO_id_gimnasio: int
    pagos_realizados: List[Pago] = []

class Deudor(BaseModel):
    id_deudor: int
    ALUMNO_id_alumno: int
    monto_deuda: float
    fechas_deudas: List[str] = []
    descripcion: Optional[str] = None

class Gimnasio(BaseModel):
    id_gimnasio: int
    nombre: str
    