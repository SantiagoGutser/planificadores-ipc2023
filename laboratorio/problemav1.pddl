;; Variante A: una sola bolsa (b1 en aula1), el robot empieza en aula3
;; (no en aula1, su posición en el problema base) y solo aula1 está sucia.
(define (problem limpieza-variante-a)
  (:domain limpieza-aulas)
  (:objects
    robot1 - robot
    aula1 aula2 aula3 - aula
    residuos - cuarto-residuos
    b1 - bolsa)
  (:init
    (robot-en robot1 aula3)
    (mano-libre robot1)
    (adyacente aula1 aula2) (adyacente aula2 aula1)
    (adyacente aula2 aula3) (adyacente aula3 aula2)
    (adyacente aula3 residuos) (adyacente residuos aula3)
    (sucia aula1) (limpia aula2) (limpia aula3)
    (bolsa-en b1 aula1))
  (:goal (and
    (limpia aula1) (limpia aula2) (limpia aula3)
    (bolsa-en b1 residuos)))
)
