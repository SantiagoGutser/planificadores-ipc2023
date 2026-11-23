# planificadores-ipc2023

Instalación y prueba en **macOS** (GitHub Actions) de cuatro planificadores de la senda clásica de la IPC 2023:
Scorpion 2023, Scorpion Maidu, DecStar 2023 y Fast Downward Stone Soup 2023.

- `.github/workflows/macos.yml`: clona cada planificador desde `github.com/ipc2023-classical`, lo compila y lo ejecuta.
- `prueba/`: problemas PDDL de prueba (Gripper, tarea 3, y Logistics, tarea 5).

- `laboratorio/`: laboratorio de STRIPS/PDDL (robot de limpieza): `dominio.pddl`, `problema.pddl` (situación base),
  `problemav1.pddl` (variante A) y `problemav2.pddl` (variante B).
- `.github/workflows/laboratorio.yml`: compila los mismos cuatro planificadores y resuelve los tres problemas del laboratorio.

Los registros de cada ejecución quedan en la pestaña **Actions** como artefactos descargables.

Actividad de la asignatura Razonamiento y Planificación Automática (UNIR).
