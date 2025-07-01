import json
from pathlib import Path

ESTADO_PATH = Path(__file__).parent / "estado.json"

def cargar_estado():
    if not ESTADO_PATH.exists():
        return {"aprobadas": [], "inscripcion_registrada": False, "aviso_cuatrimestre_enviado": False, "inscriptas": []}
    with open(ESTADO_PATH, "r") as f:
        return json.load(f)

def guardar_estado(estado):
    with open(ESTADO_PATH, "w") as f:
        json.dump(estado, f, indent=2)

def agregar_aprobadas(nuevas):
    estado = cargar_estado()
    estado["aprobadas"] = list(set(estado["aprobadas"] + nuevas))
    guardar_estado(estado)
