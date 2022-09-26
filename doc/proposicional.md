# Lógica Proposicional

## Definiciones básicas

* Proposición
* Alfabeto
* Expresión
* Lenguaje de la LP

## Proposición

* Enunciado del que puede afirmarse si es verdadero o falso.
* Oración declarativa.
* ¿Cuáles de las siguientes son proposiciones?
  * Pedro es alto
  * Juan es estudiante
  * Ayer llovió
  * ¿Quién es?
  * Esta mesa es azul
  * 3 es impar

* Proposición **simple**:
  * Mi perro es negro
  * Juan es estudiante

* Proposición **compuesta**:
  * Maria es arquitecta o Juan es músico
  * Si ayer llovió entonces hoy sale el sol
  * 2 * 3 = 6 y 7 no es par

## Definición del Lenguaje de Lógica Proposicional

* **Sintaxis**: cómo definir fórmulas bien formadas (fórmulas como expresiones o cadenas de símbolos)
  * Alfabeto, Expresión, Lenguaje.

* **Semántica**: cómo interpretar esas fórmulas, es decir, como asignarles significado a los símbolos, un valor de verdad (fórmulas como enunciados que pueden ser verdaderos o falsos)
  * Interpretaciones o Valuaciones.

## Alfabeto (A)

* Es un conjunto de símbolos (caracteres) necesarios para representar proposiciones sobre el mundo.
* A = Var ∪ Conectivos_prop ∪ Símbolos_auxiliares
  * Var: Variables o símbolos proposicionales o símbolos de predicados  = {a, b, c, ..., p, q, ...}
  * Conectivos lógicos o proposicionales = {¬, ^, v, ->}
  * Símbolos auxiliares = {(, )}  

## Lecturas y representaciones alternativas

| Representación | se lee | nombre | alternativa |
| -- | -- | -- | -- |
| ¬p | "no p" | negación | ∼p |
| p ^ q | "p y q" | conjunción | p & q |
| p v q | "p o q" | disyunción | p \| q |
| p -> q| "p entonces q" | condicional | p ⊃ q, p ⇒ q |

* Tanto p -> q como p <=> q pueden verse como abreviaturas de (¬p v q)  y de ((¬p v q) ^ (¬q v p)) respectivamente.

## Expresión

* Es una secuencia finita de símbolos (cadena) tomados del alfabeto.
* Ejemplos:
  * (, (pq, (-> ¬ p), ( p v ^ p), (r -> -> p v q¬)
  * p, (¬p), (p -> q), ((p v p) ^ q), ((r -> q) ^ (r -> (¬q))) : Fórmulas o EBF (expresión bien formada)

