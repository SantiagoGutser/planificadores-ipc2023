;; Problema base (figura del enunciado): el robot empieza en aula1;
;; b1 en aula1, b3 y b4 en aula2, b2 en aula3; las tres aulas sucias.
(define (problem limpieza-base)
  (:domain limpieza-aulas)
  (:objects
    robot1 - robot
    aula1 aula2 aula3 - aula
    residuos - cuarto-residuos
    b1 b2 b3 b4 - bolsa)
  (:init
    (robot-en robot1 aula1)
    (mano-libre robot1)
    ;; pasillo lineal aula1 - aula2 - aula3 - residuos (en los dos sentidos)
    (adyacente aula1 aula2) (adyacente aula2 aula1)
    (adyacente aula2 aula3) (adyacente aula3 aula2)
    (adyacente aula3 residuos) (adyacente residuos aula3)
    (sucia aula1) (sucia aula2) (sucia aula3)
    (bolsa-en b1 aula1)
    (bolsa-en b3 aula2) (bolsa-en b4 aula2)
    (bolsa-en b2 aula3))
  ;; Meta: las tres aulas limpias y ninguna bolsa en ellas
  ;; (todas descartadas en el cuarto de residuos)
  (:goal (and
    (limpia aula1) (limpia aula2) (limpia aula3)
    (bolsa-en b1 residuos) (bolsa-en b2 residuos)
    (bolsa-en b3 residuos) (bolsa-en b4 residuos)))
)
