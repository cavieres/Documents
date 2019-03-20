from scriptize.components.locators_type import Locators

"""
Catálogo de solicitudes - Institución
"""

INPUT_INSTITUCION = (Locators.ID, "ctl00_CP1_Tinstitucion")

"""
Catálogo de solicitudes - Ver Liquidaciones
"""
LINK_LIQUIDACIONES = (Locators.ID, "ctl00_CP1_B3")
TABLA_LIQUIDACIONES = (Locators.CSS_SELECTOR, "#ctl00_CP1_Grilla_ctl00 tbody")
TR_GENERIC = (Locators.CSS_SELECTOR, "tr")
TD_GENERIC = (Locators.CSS_SELECTOR, "td")
INPUT_GENERIC = (Locators.CSS_SELECTOR, "input")

"""
Catálogo de solicitudes - Solicitar Feriados o Vacaciones
"""
"""
Útiles
"""
LINK_SOLICITUDES = (Locators.ID, "ctl00_CP1_B4")
LINK_SOLICITAR_FERIADOS = (Locators.LINK_TEXT, "Solicitar Feriados")
LINK_REVISAR_SOLICITUDES = Locators.LINK_TEXT, ("Revisar Solicitudes")
MES_PROCESO = (Locators.XPATH, "//*[@id='ctl00_Tmesspro']")

"""
Eliminar solicitudes
"""
BOTON_ELIMINAR_SOLICITUDES_OBSOLETAS = (Locators.XPATH, "//*[@id='ctl00_CP1_Barra']/div/div/div/ul/li[5]/a")
BOTON_VOLVER_SOLICITUDES_OBSOLETAS = (Locators.XPATH, "//*[@id='ctl00_CP1_Barra']/div/div/div/ul/li[7]/a")
BOTON_OK_VENTANA_ELIMINAR_SOLICITUDES_OBSOLETAS = (
    Locators.CSS_SELECTOR, ".rwWindowContent a:nth-of-type(1) .rwInnerSpan")

FECHA_TOPE_VENTANA_ELIMINAR_SOLICITUDES_OBSOLETAS = (
    Locators.CSS_SELECTOR, ".rwWindowContent input")

"""
Enviar solicitudes
"""
CAMPO_FECHA_DESDE = (Locators.ID, "ctl00_CP1_Tfeini")
CAMPO_CANTIDAD_DIAS = (Locators.ID, "ctl00_CP1_tcantdias")
CAMPO_MOTIVO = (Locators.ID, "ctl00_CP1_Tobs")
BOTON_ENVIAR_SOLICITUD = (Locators.XPATH, "//*[@id='ctl00_CP1_Barra']/div/div/div/ul/li[5]/a")
BOTON_VOLVER_SOLICITUD_FERIADO = (Locators.XPATH, "//*[@id='ctl00_CP1_Barra']/div/div/div/ul/li[7]/a")
MENSAJE_VALIDACION_ENVIAR_SOLICITUD = (Locators.ID, "AlertValidation")
BOTON_CERRAR_MENSAJE_VALIDACION = (Locators.XPATH, "//*[@id='AlertValidation']/div[2]")

"""
Validar solicitudes
"""
COLUMNA_CODIGO_USUARIO = (Locators.XPATH, "//*[@id='ctl00_CP1_Grilla_ctl00__0']/td[4]")
COLUMNA_FECHA = (Locators.XPATH, "//*[@id='ctl00_CP1_Grilla_ctl00__0']/td[2]")
COLUMNA_ESTADO = (Locators.XPATH, "//*[@id='ctl00_CP1_Grilla_ctl00__0']/td[8]")
COLUMNA_DETALLE = (Locators.XPATH, "//*[@id='ctl00_CP1_Grilla_ctl00__0']/td[6]")
COLUMNA_TIPO = (Locators.XPATH, "//*[@id='ctl00_CP1_Grilla_ctl00__0']/td[1]")
