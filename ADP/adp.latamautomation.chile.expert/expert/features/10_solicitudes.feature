Feature: Solicitudes

  @regresion
  @solicitudes
  @solicitudes_feriados
  Scenario: Solicitar Feriados
    Given acceder a cuenta autoconsulta con credenciales validas para solicitudes
    When eliminar todas solicitudes fecha de hoy
    And enviar feriados
    Then validar feriados
