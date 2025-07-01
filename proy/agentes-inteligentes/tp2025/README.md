# Práctica - Agente Académico Inteligente

## Objetivo

Desarrollar una aproximación a agente inteligente académico que simule asistir a un estudiante en la gestión de sus materias de la facultad de la carreda de Licenciatura en Informática de la UNAHUR. Este agente puede:

- Conocer el plan de estudios de la carrera
- Recordar qué materias tiene aprobadas
- Validar si puede cursar una materia según las correlativas
- Recomendar materias para cursar en función del año y las correlativas
- Avisar que es el principio del cuatrimestre e informar las materias recomendadas para anotarse
- Simular inscripciones automáticas o manuales en la fecha de inscripción

## El rol de Prolog

Prolog tiene internamente un motor de inferencia, el cuál es el responsable de aplicar reglas lógicas a un conjunto de hechos para tomar decisiones. En este proyecto:

- Las materias y sus correlatividades están definidas como hechos y reglas de Prolog
- Python consulta a Prolog para saber qué materias puede cursar y hasta qué materias debería cursar según el estado actual del estudiante
- La lógica de la decisión académica (qué puede cursar, qué conviene, etc) es razonada por Prolog, no por Python

## Componentes

- `conocimiento.pl`: contiene los hechos sobre las materias, a qué año pertenece cada una y las correlatividades
- `reglas.pl`: contiene el motor lógico del agente. Define reglas que permiten verificar si se puede cursar una materia, conocer todas las disponibles, conocer solo las aprobadas, agruparlas por año y recomendar materias priorizando las de años menores y respetando las correlativas
- `prolog_interface.py`: Es el nexo entre Python y Prolog. A traves de la librería `pyswip` podemos hacer consultas a Prolog encapsuladas en funciones de python
- `main.py`: implementa el agente. Define su comportamiento autónomo, proactivo y reactivo
- `estado.json`: guarda el estado del estudiante (materias aprobadas, flags)

Este enfoque nos permite simular cómo se comportaría un agente y cómo se nutre de Prolog para poder operar

## Características del agente

- Autonomía: toma decisiones sin intervención humana, por ejemplo recomendar e inscribir en materias o dar avisos
- Reactividad: Responde al cambio del ambiente, por ejemplo al cambio de fechas de inicio de cuatrimestre o de comienzo de inscripción
- Proactividad: sugiere acciones beneficiosas para el estudiante
- Basado en modelo: se apoya en un modelo lógico de conocimientos expresado en Prolog

## Cómo correr el proyecto

### Requisitos

- Python
- SWI-Prolog
- pip (gestor de paquetes de Python)

1. Crear entorno virtual

    ```sh
    python -m venv venv
    source venv/bin/activate  # En Windows: venv\Scripts\activate
    ```

2. Instalar dependencias

    ```sh
    pip install -r requirements.txt
    ```

3. Ejecutar el agente

    ```sh
    python agente/main.py
    ```
