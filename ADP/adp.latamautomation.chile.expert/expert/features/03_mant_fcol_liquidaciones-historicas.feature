Feature: Liquidaciones historicas

  @regresion
  @liquidaciones_historicas
  @liquidaciones_historicas_haberes
  Scenario: Valida total haberes en Liquidaciones historicas
    Given  el usuario esta en la pagina de login
    When   hacer login con credenciales validas
    And    ir a liquidaciones historicas
    Then   total haberes es identico con detalle haberes

  @regresion
  @liquidaciones_historicas
  @liquidaciones_historicas_descuentos
  Scenario: Valida total descuentos en Liquidaciones historicas
    Given  el usuario esta en la pagina de login
    When   hacer login con credenciales validas
    And    ir a liquidaciones historicas
    Then   total descuentos es identico con detalle descuentos

  @regresion
  @liquidaciones_historicas
  @liquidaciones_historicas_reporte
  Scenario: Valida creación del reporte de Liquidaciones historicas
    Given  el usuario esta en la pagina de login
    When   hacer login con credenciales validas
    And    ir a liquidaciones historicas
    Then   reporte liquidaciones historicas creado correctamente
