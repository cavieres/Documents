Feature: Libro de Remuneraciones

  @regresion
  @lib_rem
  Scenario Outline: Generar Libro de Remuneraciones con selección <seleccion> opción <opcion> formato <formato>.
    Given el usuario esta en la pagina de login
    When hacer login con credenciales validas
    And abriendo menu "Informes > Legales > Libro de Remuneraciones"
    And generando reporte de libro de remuneraciones con selección "<seleccion>" opción "<opcion>" formato "<formato>"
    Then validando reporte de libro de remuneraciones con formato "<formato>"

    Examples: Libro de Remuneraciones
        | seleccion         | opcion      | formato   |
        | REPETIR ÚLTIMA    | Hoja Carta   | PDF       |
        | REPETIR ÚLTIMA    | Hoja Oficio  | PDF       |
        | REPETIR ÚLTIMA    | Hoja Carta   | XLS       |
        | REPETIR ÚLTIMA    | Hoja Oficio  | XLS       |