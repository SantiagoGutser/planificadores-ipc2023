;; Variante B: tres bolsas (una en cada aula), las tres aulas sucias y el
;; robot empieza en el cuarto de residuos.
(define (problem limpieza-variante-b)
  (:domain limpieza-aulas)
  (:objects
    robot1 - robot
    aula1 aula2 aula3 - aula
    residuos - cuarto-residuos
    b1 b2 b3 - bolsa)
  (:init
    (robot-en robot1 residuos)
    (mano-libre robot1)
    (adyacente aula1 aula2) (adyacente aula2 aula1)
    (adyacente aula2 aula3) (adyacente aula3 aula2)
    (adyacente aula3 residuos) (adyacente residuos aula3)
    (sucia aula1) (sucia aula2) (sucia aula3)
    (bolsa-en b1 aula1) (bolsa-en b2 aula2) (bolsa-en b3 aula3))
  (:goal (and
    (limpia aula1) (limpia aula2) (limpia aula3)
    (bolsa-en b1 residuos) (bolsa-en b2 residuos) (bolsa-en b3 residuos)))
)
