Feature: Prueba emision liquidacion historicas

  @regresion
  @emi_liq_histo
  Scenario: Emision Liquidacion Historicas
    Given el usuario esta en la pagina de login
    When hacer login con credenciales validas
    And ir a emision de liquidacion historicas
    And generar liquidacion historicas
    Then comprobar descarga PDF
