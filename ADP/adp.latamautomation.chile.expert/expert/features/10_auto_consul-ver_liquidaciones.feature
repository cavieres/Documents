Feature: Ver Liquidaciones Auto-consulta

  @regresion
  @ver_liqui
  Scenario: Ver Liquidaciones
    Given el usuario esta en la pagina de login
    When hacer login con credenciales validas de autoconsulta
    And ir a liquidaciones
    And bajar archivo pdf
    Then validar descarga liquidacion
