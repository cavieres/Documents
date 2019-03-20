Feature: Prueba finiquito individual

  @regresion
  @finiq_ind
  Scenario: Finiquito individual
    Given el usuario esta en la pagina de login
    When hacer login con credenciales validas
    And ir a la ficha del colaborador
    And click en buscar
    And seleccionar colaborador
    And ir al finiquito
    And simular finiquito individual con feriado proporcional
    Then validar monto de finiquito individual
