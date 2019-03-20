Feature: Visualizar Liquidacion de Prueba

  @regresion
  @liqpru
  Scenario: Liquidacion de prueba
    Given el usuario esta en la pagina de login
    When hacer login con credenciales validas
    And ir a la ficha del colaborador
    And click en buscar
    And seleccionar colaborador
    And ir a liquidacion de prueba
    Then validar monto a pagar
