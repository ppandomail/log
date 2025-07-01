from pyswip import Prolog
from pathlib import Path
import ast

prolog = Prolog()
BASE_PATH = Path(__file__).parent.parent / "logica"

prolog.consult(str(BASE_PATH / "reglas.pl"))

def todas_las_materias_por_anio():
    consulta = "todas_las_materias_por_anio(R)."
    for r in prolog.query(consulta):
        resultados_crudos = r["R"]
        resultados_parseados = []

        for item in resultados_crudos:
            try:
                tupla = ast.literal_eval(item.lstrip("-"))
                resultados_parseados.append(tupla)
            except Exception as e:
                print(f"[!] Error procesando: {item} -> {e}")
        
        return resultados_parseados

    return []

def materias_disponibles(aprobadas):
    aprobadas_str = "[" + ",".join(aprobadas) + "]"
    consulta = f"materias_disponibles({aprobadas_str}, R)."
    for r in prolog.query(consulta):
        return r["R"]
    return []

def materias_disponibles_por_anio(aprobadas):
    aprobadas_str = "[" + ",".join(aprobadas) + "]"
    consulta = f"recomendar_materias_por_anio({aprobadas_str}, R)."
    for r in prolog.query(consulta):
        resultados_crudos = r["R"]
        resultados_parseados = []

        for item in resultados_crudos:
            try:
                tupla = ast.literal_eval(item.lstrip("-"))
                resultados_parseados.append(tupla)
            except Exception as e:
                print(f"[!] Error procesando: {item} -> {e}")
        
        return resultados_parseados

    return []

def puede_cursar(materia, aprobadas):
    aprobadas_str = "[" + ",".join(aprobadas) + "]"
    consulta = f"puede_cursar({materia}, {aprobadas_str})."
    return bool(list(prolog.query(consulta)))

def recomendar_materias(aprobadas):
    aprobadas_str = "[" + ",".join(aprobadas) + "]"
    consulta = f"recomendar_materias({aprobadas_str}, R)."
    for r in prolog.query(consulta):
        return r["R"]
    return []
