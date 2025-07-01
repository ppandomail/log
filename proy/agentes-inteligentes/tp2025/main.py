"""
Agente Académico - Sistema de gestión académica inteligente
Proporciona funcionalidades para gestionar materias, inscripciones y recomendaciones.
"""

from datetime import date, datetime

from prolog_interface import (
    puede_cursar, 
    recomendar_materias, 
    materias_disponibles_por_anio,
    todas_las_materias_por_anio
)
from utils import cargar_estado, agregar_aprobadas, guardar_estado

# Constantes de fechas del cuatrimestre
INICIO_CUATRIMESTRE = date(2025, 7, 1)
INICIO_INSCRIPCION = date(2025, 7, 5)
FIN_INSCRIPCION = date(2025, 7, 10)

# Configuración de fecha actual para pruebas
# hoy = date.today()
hoy = datetime(2025, 7, 1).date()  # Para pruebas - inicio cuatrimestre
# hoy = datetime(2025, 7, 5).date()  # Para pruebas - inicio inscripción

# Opciones del menú principal
OPCIONES_MENU = {
    "1": "Ver plan de estudio",
    "2": "Ver materias aprobadas",
    "3": "Agregar materias aprobadas", 
    "4": "Consultar si puedo cursar una materia",
    "5": "Ver materias disponibles por año",
    "6": "Ver materias recomendadas",
    "7": "Salir"
}


def limpiar_consola():
    # Limpia la consola del terminal.
    print("\033c", end="")


def pausar():
    # Pausa la ejecución hasta que el usuario presione Enter.
    input("\n📋 Presioná Enter para continuar...")


def mostrar_materias_disponibles(materias_por_anio):
    # Muestra las materias disponibles agrupadas por año.
    if not materias_por_anio:
        print("\n❌ No hay materias disponibles por ahora.\n")
        return
    
    print("\n📚 Estas son las materias que podrías cursar:\n")
    for anio, materias in materias_por_anio:
        if materias:
            print(f"📅 Año {anio}:")
            for materia in materias:
                print(f"   - {materia}")


def procesar_inscripcion_automatica(estado, recomendadas):
    # Procesa la inscripción automática a materias recomendadas.
    print("\n💡 Te recomiendo que curses estas materias:")
    for materia in recomendadas:
        print(f" ⭐ {materia}")

    opcion = input("\n✨ ¿Querés que te inscriba a estas materias? (s/n): ").strip().lower()
    
    if opcion == "s":
        estado["inscriptas"] = recomendadas
        estado["inscripcion_registrada"] = True
        guardar_estado(estado)
        print("🎉 ¡Inscripción realizada con éxito!")
        return True
    return False


def procesar_inscripcion_manual(estado):
    # Procesa la inscripción manual de materias.
    materias_input = input("📝 Ingresá las materias que querés cursar (separadas por coma): ")
    materias_personalizadas = [m.strip() for m in materias_input.split(",") if m.strip()]
    
    inscriptas_validas = []
    for materia in materias_personalizadas:
        if puede_cursar(materia, estado["aprobadas"]):
            inscriptas_validas.append(materia)
        else:
            print(f"❌ No podés cursar {materia} todavía (no cumple correlativas).")

    if inscriptas_validas:
        estado["inscriptas"] = inscriptas_validas
        estado["inscripcion_registrada"] = True
        guardar_estado(estado)
        print(f"✅ Te inscribí a las materias válidas: {inscriptas_validas}")
    else:
        print("😞 No te pude inscribir a ninguna materia.")

    pausar()


def chequear_inicio_cuatrimestre():
    # Verifica si es el inicio del cuatrimestre y muestra materias disponibles.
    estado = cargar_estado()

    if hoy == INICIO_CUATRIMESTRE and not estado.get("aviso_cuatrimestre_enviado", False):
        print("🎓 ¡Comienza un nuevo cuatrimestre!")
        disponibles = materias_disponibles_por_anio(estado["aprobadas"])
        mostrar_materias_disponibles(disponibles)
        
        estado["aviso_cuatrimestre_enviado"] = True
        guardar_estado(estado)

        pausar()


def chequear_inscripcion():
    # Verifica si es período de inscripción y ofrece inscripción automática.
    if not (INICIO_INSCRIPCION <= hoy <= FIN_INSCRIPCION):
        return
        
    estado = cargar_estado()
    if estado.get("inscripcion_registrada", True):
        return

    print("📝 ¡Es tiempo de inscripciones!")
    
    opcion = input("\n🤔 ¿Querés que te inscriba ahora? (s/n): ").strip().lower()
    if opcion == "n":
        return

    materias_por_anio = materias_disponibles_por_anio(estado["aprobadas"])
    recomendadas = recomendar_materias(estado["aprobadas"])

    if materias_por_anio:
        mostrar_materias_disponibles(materias_por_anio)

    if not recomendadas:
        print("❌ No hay materias para inscribirse.")
        return

    if not procesar_inscripcion_automatica(estado, recomendadas):
        procesar_inscripcion_manual(estado)

    pausar()



def mostrar_menu():
    # Muestra el menú principal de opciones.
    limpiar_consola()
    print("\n🤖 --- Agente Académico ---")
    for key, value in OPCIONES_MENU.items():
        print(f"{key}. {value}")

def mostrar_plan_estudio():
    # Muestra el plan de estudio de la carrera.
    print("\n📚 --- Plan de Estudio ---")
    materias_por_anio = todas_las_materias_por_anio()

    if materias_por_anio:
        for anio, materias in materias_por_anio:
            print(f"\n📅 Año {anio}:")
            for materia in materias:
                print(f"   - {materia}")
    else:
        print("❌ No hay materias en el Plan de estudio.")
    
    pausar()

def mostrar_materias_aprobadas(estado):
    # Muestra las materias aprobadas del estudiante.
    print("\n✅ Materias Aprobadas:")
    if estado["aprobadas"]:
        for materia in estado["aprobadas"]:
            print(f"   - {materia}")
    else:
        print("❌ No tenés materias aprobadas.")

    pausar()


def agregar_materias_aprobadas():
    # Permite agregar nuevas materias aprobadas.
    materias_input = input("📚 Ingresá materias aprobadas (separadas por coma): ").strip()
    nuevas_materias = [m.strip() for m in materias_input.split(",") if m.strip()]
    
    if nuevas_materias:
        agregar_aprobadas(nuevas_materias)
        print("✅ Aprobadas actualizadas.")
    else:
        print("❌ No se ingresaron materias válidas.")
    pausar()


def consultar_materia(estado):
    # Consulta si se puede cursar una materia específica.
    materia = input("🔍 Nombre de la materia: ").strip()
    
    if not materia:
        print("⚠️ Debe ingresar un nombre de materia.")
        return
    
    if puede_cursar(materia, estado["aprobadas"]):
        print(f"✅ Podés cursar {materia}")
    else:
        print(f"❌ No podés cursar {materia} todavía.")
    pausar()


def mostrar_materias_disponibles_por_anio(estado):
    # Muestra las materias disponibles agrupadas por año.
    materias_por_anio = materias_disponibles_por_anio(estado["aprobadas"])
    
    if materias_por_anio:
        mostrar_materias_disponibles(materias_por_anio)
    else:
        print("❌ No hay materias disponibles para cursar.")

    pausar()


def mostrar_materias_recomendadas(estado):
    # Muestra las materias recomendadas para el estudiante.
    recomendadas = recomendar_materias(estado["aprobadas"])
    print("\n💡 Materias Recomendadas:\n")
    if recomendadas:
        for materia in recomendadas:
            print(f"   ⭐ {materia}")
    else:
        print("\n❌ No hay materias recomendadas.")

    pausar()


def procesar_opcion_menu(opcion, estado):
    # Procesa la opción seleccionada del menú.
    if opcion == "1":
        mostrar_plan_estudio()
    if opcion == "2":
        mostrar_materias_aprobadas(estado)
    elif opcion == "3":
        agregar_materias_aprobadas()
    elif opcion == "4":
        consultar_materia(estado)
    elif opcion == "5":
        mostrar_materias_disponibles_por_anio(estado)
    elif opcion == "6":
        mostrar_materias_recomendadas(estado)
    elif opcion == "7":
        return False  # Señal para salir
    else:
        print("❌ Opción no válida.")
    
    return True  # Continuar en el bucle

def main():
    # Función principal del agente académico.
    estado = cargar_estado()

    chequear_inicio_cuatrimestre()
    chequear_inscripcion()

    while True:
        mostrar_menu()
        opcion = input("🎯 Elegí una opción: ").strip()
        estado = cargar_estado()  # Recargar estado por si hubo cambios

        if not procesar_opcion_menu(opcion, estado):
            break


if __name__ == "__main__":
    main()

