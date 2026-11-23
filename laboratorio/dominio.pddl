;; =====================================================================
;; Dominio: robot de limpieza en un pasillo con tres aulas y un cuarto
;; de residuos. El robot recoge bolsas de basura (una a la vez), las
;; deposita en el cuarto de residuos y limpia las aulas.
;; Autor: Santiago Gutiérrez Serna - Razonamiento y Planificación Automática (UNIR)
;; =====================================================================
(define (domain limpieza-aulas)
  (:requirements :strips :typing)

  ;; Tipos: el robot, las bolsas y las ubicaciones. Las ubicaciones son de
  ;; dos clases: aulas (se ensucian y se limpian) y el cuarto de residuos
  ;; (el único sitio donde se pueden descartar las bolsas).
  (:types
    robot bolsa ubicacion - object
    aula cuarto-residuos - ubicacion)

  (:predicates
    (robot-en ?r - robot ?u - ubicacion)          ; ubicación actual del robot
    (adyacente ?u1 - ubicacion ?u2 - ubicacion)   ; se puede pasar de ?u1 a ?u2 en un movimiento
    (bolsa-en ?b - bolsa ?u - ubicacion)          ; bolsa en el suelo de un aula o ya descartada en residuos
    (cargando ?r - robot ?b - bolsa)              ; el robot lleva esa bolsa
    (mano-libre ?r - robot)                       ; capacidad 1: el robot no lleva ninguna bolsa
    (sucia ?a - aula)                             ; el aula está sucia
    (limpia ?a - aula))                           ; ya se hizo la limpieza en el aula

  ;; Moverse: solo entre ubicaciones adyacentes del pasillo.
  (:action moverse
    :parameters (?r - robot ?desde - ubicacion ?hacia - ubicacion)
    :precondition (and (robot-en ?r ?desde)
                       (adyacente ?desde ?hacia))
    :effect (and (not (robot-en ?r ?desde))
                 (robot-en ?r ?hacia)))

  ;; Recoger bolsa: en un aula, si el robot está allí y no lleva otra bolsa.
  (:action recoger-bolsa
    :parameters (?r - robot ?b - bolsa ?a - aula)
    :precondition (and (robot-en ?r ?a)
                       (bolsa-en ?b ?a)
                       (mano-libre ?r))
    :effect (and (not (bolsa-en ?b ?a))
                 (not (mano-libre ?r))
                 (cargando ?r ?b)))

  ;; Depositar bolsa: solo en el cuarto de residuos; el robot queda libre.
  (:action depositar-bolsa
    :parameters (?r - robot ?b - bolsa ?c - cuarto-residuos)
    :precondition (and (robot-en ?r ?c)
                       (cargando ?r ?b))
    :effect (and (not (cargando ?r ?b))
                 (mano-libre ?r)
                 (bolsa-en ?b ?c)))

  ;; Limpiar aula: el robot tiene que estar en el aula y el aula, sucia.
  (:action limpiar-aula
    :parameters (?r - robot ?a - aula)
    :precondition (and (robot-en ?r ?a)
                       (sucia ?a))
    :effect (and (not (sucia ?a))
                 (limpia ?a)))
)
