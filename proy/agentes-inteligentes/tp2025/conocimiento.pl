% Materias primer año
materia(matematica_i).
materia(introduccion_a_la_programacion).
materia(organizacion_de_computadoras).
materia(nuevos_entornos_y_lenguajes).
materia(estructuras_de_datos).
materia(programacion_con_objetos_i).
materia(bases_de_datos).
materia(ingles_i).
% Materias segundo año
materia(matematica_ii).
materia(programacion_con_objetos_ii).
materia(redes_de_computadoras).
materia(sistemas_operativos).
materia(programacion_funcional).
materia(construccion_de_interfaces).
materia(algoritmos).
materia(estrategias_de_persistencia).
materia(laboratorio_sistemas).
% Materias tercer año
materia(analisis_matematico).
materia(logica_y_programacion).
materia(elementos_de_ing_software).
materia(seguridad_de_la_informacion).
materia(unahur_i).
materia(ingles_ii).
materia(matematica_iii).
materia(programacion_concurrente).
materia(ingenieria_de_requerimientos).
materia(desarrollo_de_aplicaciones).
% Materias cuarto año
materia(probabilidad_y_estadistica).
materia(gestion_de_proyectos).
materia(lenguajes_formales).
materia(programacion_con_objetos_iii).
materia(unahur_ii).
materia(practica_profesional_supervisada).
materia(teoria_de_la_computacion).
materia(arquitectura_software_i).
materia(sistemas_distribuidos).
% Materias quinto año
materia(tesina).
materia(optativa_i).
materia(caracteristicas_lenguajes).
materia(arquitectura_software_ii).
materia(arquitectura_de_computadoras).
materia(optativa_ii).
materia(parseo_y_generacion_de_codigo).
materia(ejercicio_profesional).
materia(tecnologia_y_sociedad).

% Correlatividades
correlativa(estructuras_de_datos, introduccion_a_la_programacion).
correlativa(programacion_con_objetos_i, introduccion_a_la_programacion).
correlativa(bases_de_datos, matematica_i).
correlativa(matematica_ii, matematica_i).
correlativa(programacion_con_objetos_ii, programacion_con_objetos_i).
correlativa(redes_de_computadoras, organizacion_de_computadoras).
correlativa(sistemas_operativos, introduccion_a_la_programacion).
correlativa(sistemas_operativos, organizacion_de_computadoras).
correlativa(programacion_funcional, estructuras_de_datos).
correlativa(construccion_de_interfaces, programacion_con_objetos_ii).
correlativa(algoritmos, programacion_funcional).
correlativa(estrategias_de_persistencia, bases_de_datos).
correlativa(estrategias_de_persistencia, programacion_con_objetos_ii).
correlativa(laboratorio_sistemas, redes_de_computadoras).
correlativa(laboratorio_sistemas, sistemas_operativos).
correlativa(analisis_matematico, matematica_ii).
correlativa(logica_y_programacion, matematica_i).
correlativa(logica_y_programacion, introduccion_a_la_programacion).
correlativa(elementos_de_ing_software, programacion_con_objetos_ii).
correlativa(seguridad_de_la_informacion, laboratorio_sistemas).
correlativa(ingles_ii, ingles_i).
correlativa(matematica_iii, analisis_matematico).
correlativa(programacion_concurrente, estructuras_de_datos).
correlativa(ingenieria_de_requerimientos, elementos_de_ing_software).
correlativa(desarrollo_de_aplicaciones, construccion_de_interfaces).
correlativa(desarrollo_de_aplicaciones, estrategias_de_persistencia).
correlativa(desarrollo_de_aplicaciones, elementos_de_ing_software).
correlativa(probabilidad_y_estadistica, matematica_iii).
correlativa(gestion_de_proyectos, ingenieria_de_requerimientos).
correlativa(lenguajes_formales, logica_y_programacion).
correlativa(programacion_con_objetos_iii, programacion_con_objetos_ii).
correlativa(practica_profesional_supervisada, programacion_funcional).
correlativa(practica_profesional_supervisada, laboratorio_sistemas).
correlativa(practica_profesional_supervisada, programacion_concurrente).
correlativa(practica_profesional_supervisada, desarrollo_de_aplicaciones).
correlativa(arquitectura_software_i, elementos_de_ing_software).
correlativa(arquitectura_software_i, programacion_concurrente).
correlativa(arquitectura_software_i, desarrollo_de_aplicaciones).
correlativa(arquitectura_software_i, gestion_de_proyectos).
correlativa(teoria_de_la_computacion, lenguajes_formales).
correlativa(sistemas_distribuidos, laboratorio_sistemas).
correlativa(sistemas_distribuidos, programacion_concurrente).
correlativa(tesina, gestion_de_proyectos).
correlativa(tesina, lenguajes_formales).
correlativa(tesina, programacion_con_objetos_iii).
correlativa(optativa_i, bases_de_datos).
correlativa(optativa_i, programacion_con_objetos_i).
correlativa(optativa_i, elementos_de_ing_software).
correlativa(optativa_i, programacion_concurrente).
correlativa(caracteristicas_lenguajes, logica_y_programacion).
correlativa(arquitectura_software_ii, arquitectura_software_i).
correlativa(arquitectura_software_ii, sistemas_distribuidos).
correlativa(arquitectura_de_computadoras, laboratorio_sistemas).
correlativa(optativa_ii, bases_de_datos).
correlativa(optativa_ii, programacion_con_objetos_i).
correlativa(optativa_ii, elementos_de_ing_software).
correlativa(optativa_ii, programacion_concurrente).
correlativa(parseo_y_generacion_de_codigo, lenguajes_formales).
correlativa(parseo_y_generacion_de_codigo, caracteristicas_lenguajes).
correlativa(tecnologia_y_sociedad, ejercicio_profesional).

% Materias por año
anio(matematica_i, 1).
anio(introduccion_a_la_programacion, 1).
anio(organizacion_de_computadoras, 1).
anio(nuevos_entornos_y_lenguajes, 1).
anio(estructuras_de_datos, 1).
anio(programacion_con_objetos_i, 1).
anio(bases_de_datos, 1).
anio(ingles_i, 1).

anio(matematica_ii, 2).
anio(programacion_con_objetos_ii, 2).
anio(redes_de_computadoras, 2).
anio(sistemas_operativos, 2).
anio(programacion_funcional, 2).
anio(construccion_de_interfaces, 2).
anio(algoritmos, 2).
anio(estrategias_de_persistencia, 2).
anio(laboratorio_sistemas, 2).

anio(analisis_matematico, 3).
anio(logica_y_programacion, 3).
anio(elementos_de_ing_software, 3).
anio(seguridad_de_la_informacion, 3).
anio(unahur_i, 3).
anio(ingles_ii, 3).
anio(matematica_iii, 3).
anio(programacion_concurrente, 3).
anio(ingenieria_de_requerimientos, 3).
anio(desarrollo_de_aplicaciones, 3).

anio(probabilidad_y_estadistica, 4).
anio(gestion_de_proyectos, 4).
anio(lenguajes_formales, 4).
anio(programacion_con_objetos_iii, 4).
anio(unahur_ii, 4).
anio(practica_profesional_supervisada, 4).
anio(teoria_de_la_computacion, 4).
anio(arquitectura_software_i, 4).
anio(sistemas_distribuidos, 4).

anio(tesina, 5).
anio(optativa_i, 5).
anio(caracteristicas_lenguajes, 5).
anio(arquitectura_software_ii, 5).
anio(arquitectura_de_computadoras, 5).
anio(optativa_ii, 5).
anio(parseo_y_generacion_de_codigo, 5).
anio(ejercicio_profesional, 5).
anio(tecnologia_y_sociedad, 5).