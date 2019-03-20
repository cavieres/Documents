Feature: Prueba Resumen del Proceso

  @regresion
  @resu_proce
  Scenario: Resumen del Proceso
    Given el usuario esta en la pagina de login
    When hacer login con credenciales validas
    And ir a resumen del proceso
    And ejecutar resumen del proceso
    Then validar página resumen del proceso
