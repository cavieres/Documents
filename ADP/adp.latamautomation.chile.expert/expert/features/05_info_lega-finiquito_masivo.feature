Feature: Finiquito masivo

  @regresion
  @finmas
  Scenario: Simulacion finiquito masivo con todos los empleados de un JDD
    Given el usuario esta en la pagina de login
    When hacer login con credenciales validas
    And ir a finiquitos masivos
    And seleccionar todos los empleados
    And ingresar fecha finiquito
    And seleccionar mes ultimo sueldo
    And seleccionar texto de finiquitos
    And seleccionar periodo a considerar
    And ingresar descripcion
    And seleccionar feriado proporcional
    And ejecutar finiquitos
    Then validar generacion de finiquitos
