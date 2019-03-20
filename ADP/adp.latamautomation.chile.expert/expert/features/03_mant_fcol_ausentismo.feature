Feature: Prueba ausentismo

  @regresion
  @ausentismo
  Scenario Outline: Crear ausentismo con el tipo <tipo>
    Given el usuario esta en la pagina de login
    When hacer login con credenciales validas
    And ir a la ficha del colaborador
    And seleccionar colaborador activo
    And crear ausentismo con el tipo "<tipo>" para colaborador activo
    Then validar creacion de ausentismo

    Examples: Tipo de licencia
      | tipo                  |
      | Accidente del Trabajo |
      | Licencia Maternal     |
      | Licencia normal       |
      | Permiso               |
      | Falta                 |
      | Licencia Interna      |
