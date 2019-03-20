Feature: Mapa de items

  @regresion
  @mapa_de_items
  Scenario: Borrar y volver a crear item
    Given el usuario esta en la pagina de login
    When hacer login con credenciales validas
    And ir a la ficha del colaborador
    And seleccionar colaborador activo
    And ir a mapa de items
    And borrar item
    And agregar item y guardar valor ingresado
    Then validar que valor corresponde en liquidacion colaborador
