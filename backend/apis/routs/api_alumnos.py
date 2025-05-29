from fastapi import APIRouter, HTTPException
from backend.apis.basic_models import Alumno,Disciplina,Pago
from typing import List

router = APIRouter()

alumnos = [
    # Gimnasio 1: alumnos 1 - 10
    Alumno(id_alumno=1,  nombre="Alumno1",  apellido="Apellido1",  email="alumno1@example.com",  GIMNASIO_id_gimnasio=1, pagos_realizados=[]),
    Alumno(id_alumno=2,  nombre="Alumno2",  apellido="Apellido2",  email="alumno2@example.com",  GIMNASIO_id_gimnasio=1, pagos_realizados=[]),
    Alumno(id_alumno=3,  nombre="Alumno3",  apellido="Apellido3",  email="alumno3@example.com",  GIMNASIO_id_gimnasio=1, pagos_realizados=[]),
    Alumno(id_alumno=4,  nombre="Alumno4",  apellido="Apellido4",  email="alumno4@example.com",  GIMNASIO_id_gimnasio=1, pagos_realizados=[]),
    Alumno(id_alumno=5,  nombre="Alumno5",  apellido="Apellido5",  email="alumno5@example.com",  GIMNASIO_id_gimnasio=1, pagos_realizados=[]),
    Alumno(id_alumno=6,  nombre="Alumno6",  apellido="Apellido6",  email="alumno6@example.com",  GIMNASIO_id_gimnasio=1, pagos_realizados=[]),
    Alumno(id_alumno=7,  nombre="Alumno7",  apellido="Apellido7",  email="alumno7@example.com",  GIMNASIO_id_gimnasio=1, pagos_realizados=[]),
    Alumno(id_alumno=8,  nombre="Alumno8",  apellido="Apellido8",  email="alumno8@example.com",  GIMNASIO_id_gimnasio=1, pagos_realizados=[]),
    Alumno(id_alumno=9,  nombre="Alumno9",  apellido="Apellido9",  email="alumno9@example.com",  GIMNASIO_id_gimnasio=1, pagos_realizados=[]),
    Alumno(id_alumno=10, nombre="Alumno10", apellido="Apellido10", email="alumno10@example.com", GIMNASIO_id_gimnasio=1, pagos_realizados=[]),

    # Gimnasio 2: alumnos 11 - 20
    Alumno(id_alumno=11, nombre="Alumno11", apellido="Apellido11", email="alumno11@example.com", GIMNASIO_id_gimnasio=2, pagos_realizados=[]),
    Alumno(id_alumno=12, nombre="Alumno12", apellido="Apellido12", email="alumno12@example.com", GIMNASIO_id_gimnasio=2, pagos_realizados=[]),
    Alumno(id_alumno=13, nombre="Alumno13", apellido="Apellido13", email="alumno13@example.com", GIMNASIO_id_gimnasio=2, pagos_realizados=[]),
    Alumno(id_alumno=14, nombre="Alumno14", apellido="Apellido14", email="alumno14@example.com", GIMNASIO_id_gimnasio=2, pagos_realizados=[]),
    Alumno(id_alumno=15, nombre="Alumno15", apellido="Apellido15", email="alumno15@example.com", GIMNASIO_id_gimnasio=2, pagos_realizados=[]),
    Alumno(id_alumno=16, nombre="Alumno16", apellido="Apellido16", email="alumno16@example.com", GIMNASIO_id_gimnasio=2, pagos_realizados=[]),
    Alumno(id_alumno=17, nombre="Alumno17", apellido="Apellido17", email="alumno17@example.com", GIMNASIO_id_gimnasio=2, pagos_realizados=[]),
    Alumno(id_alumno=18, nombre="Alumno18", apellido="Apellido18", email="alumno18@example.com", GIMNASIO_id_gimnasio=2, pagos_realizados=[]),
    Alumno(id_alumno=19, nombre="Alumno19", apellido="Apellido19", email="alumno19@example.com", GIMNASIO_id_gimnasio=2, pagos_realizados=[]),
    Alumno(id_alumno=20, nombre="Alumno20", apellido="Apellido20", email="alumno20@example.com", GIMNASIO_id_gimnasio=2, pagos_realizados=[]),

    # Gimnasio 3: alumnos 21 - 30
    Alumno(id_alumno=21, nombre="Alumno21", apellido="Apellido21", email="alumno21@example.com", GIMNASIO_id_gimnasio=3, pagos_realizados=[]),
    Alumno(id_alumno=22, nombre="Alumno22", apellido="Apellido22", email="alumno22@example.com", GIMNASIO_id_gimnasio=3, pagos_realizados=[]),
    Alumno(id_alumno=23, nombre="Alumno23", apellido="Apellido23", email="alumno23@example.com", GIMNASIO_id_gimnasio=3, pagos_realizados=[]),
    Alumno(id_alumno=24, nombre="Alumno24", apellido="Apellido24", email="alumno24@example.com", GIMNASIO_id_gimnasio=3, pagos_realizados=[]),
    Alumno(id_alumno=25, nombre="Alumno25", apellido="Apellido25", email="alumno25@example.com", GIMNASIO_id_gimnasio=3, pagos_realizados=[]),
    Alumno(id_alumno=26, nombre="Alumno26", apellido="Apellido26", email="alumno26@example.com", GIMNASIO_id_gimnasio=3, pagos_realizados=[]),
    Alumno(id_alumno=27, nombre="Alumno27", apellido="Apellido27", email="alumno27@example.com", GIMNASIO_id_gimnasio=3, pagos_realizados=[]),
    Alumno(id_alumno=28, nombre="Alumno28", apellido="Apellido28", email="alumno28@example.com", GIMNASIO_id_gimnasio=3, pagos_realizados=[]),
    Alumno(id_alumno=29, nombre="Alumno29", apellido="Apellido29", email="alumno29@example.com", GIMNASIO_id_gimnasio=3, pagos_realizados=[]),
    Alumno(id_alumno=30, nombre="Alumno30", apellido="Apellido30", email="alumno30@example.com", GIMNASIO_id_gimnasio=3, pagos_realizados=[]),

    # Gimnasio 4: alumnos 31 - 40
    Alumno(id_alumno=31, nombre="Alumno31", apellido="Apellido31", email="alumno31@example.com", GIMNASIO_id_gimnasio=4, pagos_realizados=[]),
    Alumno(id_alumno=32, nombre="Alumno32", apellido="Apellido32", email="alumno32@example.com", GIMNASIO_id_gimnasio=4, pagos_realizados=[]),
    Alumno(id_alumno=33, nombre="Alumno33", apellido="Apellido33", email="alumno33@example.com", GIMNASIO_id_gimnasio=4, pagos_realizados=[]),
    Alumno(id_alumno=34, nombre="Alumno34", apellido="Apellido34", email="alumno34@example.com", GIMNASIO_id_gimnasio=4, pagos_realizados=[]),
    Alumno(id_alumno=35, nombre="Alumno35", apellido="Apellido35", email="alumno35@example.com", GIMNASIO_id_gimnasio=4, pagos_realizados=[]),
    Alumno(id_alumno=36, nombre="Alumno36", apellido="Apellido36", email="alumno36@example.com", GIMNASIO_id_gimnasio=4, pagos_realizados=[]),
    Alumno(id_alumno=37, nombre="Alumno37", apellido="Apellido37", email="alumno37@example.com", GIMNASIO_id_gimnasio=4, pagos_realizados=[]),
    Alumno(id_alumno=38, nombre="Alumno38", apellido="Apellido38", email="alumno38@example.com", GIMNASIO_id_gimnasio=4, pagos_realizados=[]),
    Alumno(id_alumno=39, nombre="Alumno39", apellido="Apellido39", email="alumno39@example.com", GIMNASIO_id_gimnasio=4, pagos_realizados=[]),
    Alumno(id_alumno=40, nombre="Alumno40", apellido="Apellido40", email="alumno40@example.com", GIMNASIO_id_gimnasio=4, pagos_realizados=[]),

    # Gimnasio 5: alumnos 41 - 50
    Alumno(id_alumno=41, nombre="Alumno41", apellido="Apellido41", email="alumno41@example.com", GIMNASIO_id_gimnasio=5, pagos_realizados=[]),
    Alumno(id_alumno=42, nombre="Alumno42", apellido="Apellido42", email="alumno42@example.com", GIMNASIO_id_gimnasio=5, pagos_realizados=[]),
    Alumno(id_alumno=43, nombre="Alumno43", apellido="Apellido43", email="alumno43@example.com", GIMNASIO_id_gimnasio=5, pagos_realizados=[]),
    Alumno(id_alumno=44, nombre="Alumno44", apellido="Apellido44", email="alumno44@example.com", GIMNASIO_id_gimnasio=5, pagos_realizados=[]),
    Alumno(id_alumno=45, nombre="Alumno45", apellido="Apellido45", email="alumno45@example.com", GIMNASIO_id_gimnasio=5, pagos_realizados=[]),
    Alumno(id_alumno=46, nombre="Alumno46", apellido="Apellido46", email="alumno46@example.com", GIMNASIO_id_gimnasio=5, pagos_realizados=[]),
    Alumno(id_alumno=47, nombre="Alumno47", apellido="Apellido47", email="alumno47@example.com", GIMNASIO_id_gimnasio=5, pagos_realizados=[]),
    Alumno(id_alumno=48, nombre="Alumno48", apellido="Apellido48", email="alumno48@example.com", GIMNASIO_id_gimnasio=5, pagos_realizados=[]),
    Alumno(id_alumno=49, nombre="Alumno49", apellido="Apellido49", email="alumno49@example.com", GIMNASIO_id_gimnasio=5, pagos_realizados=[]),
    Alumno(id_alumno=50, nombre="Alumno50", apellido="Apellido50", email="alumno50@example.com", GIMNASIO_id_gimnasio=5, pagos_realizados=[]),
]


@router.get("/alumnos/{gym_id}", response_model=List[Alumno])
async def get_alumnos(gym_id: int):
    """Obtiene todos los alumnos de un gimnasio específico por gym_id."""
    alumnos_filtrados = list(filter(lambda a: a.GIMNASIO_id_gimnasio == gym_id, alumnos))

    if not alumnos_filtrados:
        raise HTTPException(status_code=404, detail="No se encontraron alumnos para este gimnasio")

    return alumnos_filtrados

@router.get("/alumnos/{id}")
async def get_alumno(id: int):
    for alumno in alumnos:
        if alumno.id_alumno == id:
            return alumno
    raise HTTPException(status_code=404, detail="Alumno not found")

@router.post("/alumnos/")
async def create_alumno(alumno: Alumno, gym_id: int):
    alumno.GIMNASIO_id_gimnasio = gym_id
    alumnos.append(alumno)
    return alumno

@router.put("/alumnos/{id}")
async def update_alumno(id: int, alumno: Alumno):
    for index, existing_alumno in enumerate(alumnos):
        if existing_alumno.id_alumno == id:
            alumnos[index] = alumno
            return alumno
    raise HTTPException(status_code=404, detail="Alumno not found")

@router.delete("/alumnos/{id}")
async def delete_alumno(id: int):
    for index, existing_alumno in enumerate(alumnos):
        if existing_alumno.id_alumno == id:
            del alumnos[index]
            return {"detail": "Alumno deleted"}
    raise HTTPException(status_code=404, detail="Alumno not found")
