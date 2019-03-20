Feature: Vacaciones

  @humo
  @vacaciones_dias_normales
  Scenario: Crear vacaciones de Días Normales
    Given el usuario esta en la pagina de login
    When hacer login con credenciales validas
    And busca colaborador para tomar días de vacaciones con código "50500500-7" rut "50500500-7" estado "A" nombre "ABELLO ALVAREZ, ANA"
    And elimina todos los días tomados
    And crear una nueva solicitud de vacaciones de "Días Normales" con "5,00" días y tipc "V"
    Then validar nuevo registro de vacaciones de "Días Normales" con "5,00" días y tipc "V" en tabla de dias tomados
    And comprobar descarga comprobante de vacaciones


  @regresion
  @vacaciones
  Scenario Outline: Crear vacaciones de <rebajas>
    Given el usuario esta en la pagina de login
    When hacer login con credenciales validas
    And busca colaborador para tomar días de vacaciones con código "<codigo>" rut "<rut>" estado "<estado>" nombre "<nombre>"
    And elimina todos los días tomados
    And crear una nueva solicitud de vacaciones de "<rebajas>" con "<ndias>" días y tipc "<tipc>"
    Then validar nuevo registro de vacaciones de "<rebajas>" con "<ndias>" días y tipc "<tipc>" en tabla de dias tomados
    And comprobar descarga comprobante de vacaciones

    Examples: Vacaciones
      | rebajas       | ndias | tipc | codigo     | rut        | estado | nombre                             |
      | Días Normales | 5,00  | V    | 50500500-7 | 50500500-7 | A      | ABELLO ALVAREZ, ANA                |
      | Progresivos   | 10,00 | P    | 36127993-K | 36127993-K | A      | ALBEAR FARIAS, ANITA               |
      | Adicionales   | 15,00 | A    | 50500542-2 | 50500542-2 | A      | ALFARO MADARIAGA, ANDREA FRANCISCA |
      | Días Base     | 20,00 | C    | 50500516-3 | 50500516-3 | A      | CASTILLO PEÑA, ROSA                |