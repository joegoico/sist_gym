from fastapi import APIRouter, HTTPException
from typing import List, Optional
from backend.apis.basic_models import Pago  # Assuming Precio is defined in basic_models.py
from backend.apis.routs.api_alumnos import alumnos  # Assuming Alumno is defined in api_alumnos.py

router = APIRouter()

pagos: List[Pago] = [
    # Alumno 1
    Pago(id_pago=1,  ALUMNO_id_alumno=1,  fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=2,  ALUMNO_id_alumno=1,  fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 2
    Pago(id_pago=3,  ALUMNO_id_alumno=2,  fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=4,  ALUMNO_id_alumno=2,  fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 3
    Pago(id_pago=5,  ALUMNO_id_alumno=3,  fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=6,  ALUMNO_id_alumno=3,  fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 4
    Pago(id_pago=7,  ALUMNO_id_alumno=4,  fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=8,  ALUMNO_id_alumno=4,  fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 5
    Pago(id_pago=9,  ALUMNO_id_alumno=5,  fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=10, ALUMNO_id_alumno=5,  fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 6
    Pago(id_pago=11, ALUMNO_id_alumno=6,  fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=12, ALUMNO_id_alumno=6,  fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 7
    Pago(id_pago=13, ALUMNO_id_alumno=7,  fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=14, ALUMNO_id_alumno=7,  fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 8
    Pago(id_pago=15, ALUMNO_id_alumno=8,  fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=16, ALUMNO_id_alumno=8,  fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 9
    Pago(id_pago=17, ALUMNO_id_alumno=9,  fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=18, ALUMNO_id_alumno=9,  fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 10
    Pago(id_pago=19, ALUMNO_id_alumno=10, fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=20, ALUMNO_id_alumno=10, fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 11
    Pago(id_pago=21, ALUMNO_id_alumno=11, fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=22, ALUMNO_id_alumno=11, fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 12
    Pago(id_pago=23, ALUMNO_id_alumno=12, fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=24, ALUMNO_id_alumno=12, fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 13
    Pago(id_pago=25, ALUMNO_id_alumno=13, fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=26, ALUMNO_id_alumno=13, fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 14
    Pago(id_pago=27, ALUMNO_id_alumno=14, fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=28, ALUMNO_id_alumno=14, fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 15
    Pago(id_pago=29, ALUMNO_id_alumno=15, fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=30, ALUMNO_id_alumno=15, fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 16
    Pago(id_pago=31, ALUMNO_id_alumno=16, fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=32, ALUMNO_id_alumno=16, fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 17
    Pago(id_pago=33, ALUMNO_id_alumno=17, fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=34, ALUMNO_id_alumno=17, fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 18
    Pago(id_pago=35, ALUMNO_id_alumno=18, fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=36, ALUMNO_id_alumno=18, fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 19
    Pago(id_pago=37, ALUMNO_id_alumno=19, fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=38, ALUMNO_id_alumno=19, fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 20
    Pago(id_pago=39, ALUMNO_id_alumno=20, fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=40, ALUMNO_id_alumno=20, fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 21
    Pago(id_pago=41, ALUMNO_id_alumno=21, fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=42, ALUMNO_id_alumno=21, fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 22
    Pago(id_pago=43, ALUMNO_id_alumno=22, fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=44, ALUMNO_id_alumno=22, fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 23
    Pago(id_pago=45, ALUMNO_id_alumno=23, fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=46, ALUMNO_id_alumno=23, fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 24
    Pago(id_pago=47, ALUMNO_id_alumno=24, fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=48, ALUMNO_id_alumno=24, fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 25
    Pago(id_pago=49, ALUMNO_id_alumno=25, fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=50, ALUMNO_id_alumno=25, fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 26
    Pago(id_pago=51, ALUMNO_id_alumno=26, fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=52, ALUMNO_id_alumno=26, fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 27
    Pago(id_pago=53, ALUMNO_id_alumno=27, fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=54, ALUMNO_id_alumno=27, fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 28
    Pago(id_pago=55, ALUMNO_id_alumno=28, fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=56, ALUMNO_id_alumno=28, fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 29
    Pago(id_pago=57, ALUMNO_id_alumno=29, fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=58, ALUMNO_id_alumno=29, fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 30
    Pago(id_pago=59, ALUMNO_id_alumno=30, fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=60, ALUMNO_id_alumno=30, fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 31
    Pago(id_pago=61, ALUMNO_id_alumno=31, fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=62, ALUMNO_id_alumno=31, fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 32
    Pago(id_pago=63, ALUMNO_id_alumno=32, fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=64, ALUMNO_id_alumno=32, fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 33
    Pago(id_pago=65, ALUMNO_id_alumno=33, fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=66, ALUMNO_id_alumno=33, fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 34
    Pago(id_pago=67, ALUMNO_id_alumno=34, fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=68, ALUMNO_id_alumno=34, fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 35
    Pago(id_pago=69, ALUMNO_id_alumno=35, fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=70, ALUMNO_id_alumno=35, fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 36
    Pago(id_pago=71, ALUMNO_id_alumno=36, fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=72, ALUMNO_id_alumno=36, fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 37
    Pago(id_pago=73, ALUMNO_id_alumno=37, fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=74, ALUMNO_id_alumno=37, fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 38
    Pago(id_pago=75, ALUMNO_id_alumno=38, fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=76, ALUMNO_id_alumno=38, fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 39
    Pago(id_pago=77, ALUMNO_id_alumno=39, fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=78, ALUMNO_id_alumno=39, fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 40
    Pago(id_pago=79, ALUMNO_id_alumno=40, fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=80, ALUMNO_id_alumno=40, fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 41
    Pago(id_pago=81, ALUMNO_id_alumno=41, fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=82, ALUMNO_id_alumno=41, fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 42
    Pago(id_pago=83, ALUMNO_id_alumno=42, fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=84, ALUMNO_id_alumno=42, fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 43
    Pago(id_pago=85, ALUMNO_id_alumno=43, fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=86, ALUMNO_id_alumno=43, fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 44
    Pago(id_pago=87, ALUMNO_id_alumno=44, fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=88, ALUMNO_id_alumno=44, fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 45
    Pago(id_pago=89, ALUMNO_id_alumno=45, fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=90, ALUMNO_id_alumno=45, fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 46
    Pago(id_pago=91, ALUMNO_id_alumno=46, fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=92, ALUMNO_id_alumno=46, fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 47
    Pago(id_pago=93, ALUMNO_id_alumno=47, fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=94, ALUMNO_id_alumno=47, fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 48
    Pago(id_pago=95, ALUMNO_id_alumno=48, fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=96, ALUMNO_id_alumno=48, fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 49
    Pago(id_pago=97, ALUMNO_id_alumno=49, fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=98, ALUMNO_id_alumno=49, fecha="2025-02-01", monto=110.0, desc=True),
    
    # Alumno 50
    Pago(id_pago=99, ALUMNO_id_alumno=50, fecha="2025-01-01", monto=100.0, desc=False),
    Pago(id_pago=100, ALUMNO_id_alumno=50, fecha="2025-02-01", monto=110.0, desc=True)
]


@router.get("/pagos/{id_alumno}", response_model=List[Pago])
async def get_pagos(id_alumno: int ):
    """Obtiene todos los pagos de un alumno específico por id_alumno."""
    existe = any(alumno.id_alumno == id_alumno for alumno in alumnos)
    if not existe:
        raise HTTPException(status_code=404, detail="Alumno not found")
    else:
        pagos_filtrados = list(filter(lambda p: p.ALUMNO_id_alumno == id_alumno, pagos))
        if not pagos_filtrados:
            raise HTTPException(status_code=404, detail="No se encontraron pagos para este alumno")
        return pagos_filtrados

    raise HTTPException(status_code=404, detail="Alumno not found")


@router.post("/pagos/")
async def create_pago(pago: Pago):
    existe = any(alumno.id_alumno == pago.ALUMNO_id_alumno for alumno in alumnos)
    if not existe:
        raise HTTPException(status_code=404, detail="Alumno not found")
    else:
        pagos.append(pago)
    return pago

@router.put("/pagos/{id}")
async def update_pago(id: int, pago: Pago):
    for index, existing_pago in enumerate(pagos):
        if existing_pago.id_pago == id:
            pagos[index] = pago
            return pago
    raise HTTPException(status_code=404, detail="Pago not found")

@router.delete("/pagos/{id}")
async def delete_pago(id: int):
    for index, existing_pago in enumerate(pagos):
        if existing_pago.id_pago == id:
            del pagos[index]
            return {"detail": "Pago deleted"}
    raise HTTPException(status_code=404, detail="Pago not found")
