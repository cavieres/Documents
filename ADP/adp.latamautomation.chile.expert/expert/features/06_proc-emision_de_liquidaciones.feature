Feature: Prueba Emisión de Liquidaciones

  @regresion
  @emision_liquidacion
  Scenario: Emisión de Liquidaciones
    Given el usuario esta en la pagina de login
    When hacer login con credenciales validas
    And ir a emision de liquidaciones
    And ejecutar proceso emision de liquidaciones
    Then validar la emision de liquidaciones
