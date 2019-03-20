Feature: Crear un nuevo índice

  @regresion
  @NuevoIndice
  Scenario: Creación de un nuevo índice
    Given el usuario esta en la pagina de login
    When hacer login con credenciales validas
    And ir a la mantencion de indices
    And crear nuevo indice
    And ingresar valores de indices y grabar los registros
    Then validar cada indice del formulario en la pantalla de mantencion
