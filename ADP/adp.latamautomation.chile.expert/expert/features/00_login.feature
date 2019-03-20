Feature: Login

  @regresion
  @login
  Scenario: Login exitoso de un usuario
    Given el usuario esta en la pagina de login
    When hacer login con credenciales validas
    Then el usuario debe ser redirigido al home page
