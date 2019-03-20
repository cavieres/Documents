Feature: Ingreso Masivo de Campos

  @regresion
  @ingreso_masivo_campos
  Scenario Outline: Ingreso masivo de campos <tipo>
    Given el usuario esta en la pagina de login
    When hacer login con credenciales validas
    And ir a ingreso masivo de campos tipo "<tipo>" para modificar "<campo>" en "<dato>"
    And modificar "<campo>" en "<tipo>"
    Then validar "<tipo>" dato "<campo>" en la Ficha del Colaborador

    Examples: Ingresos
      | tipo                                       | campo     | dato                       |
      | Ingreso manual en cada empleado            | Teléfono: | Personales del Colaborador |
      | Colocar valor nuevo en todos los empleados | Teléfono: | Personales del Colaborador |
      | Reemplazar valor a buscar por el nuevo     | Teléfono: | Personales del Colaborador |