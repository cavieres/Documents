from scriptize.components.locators_type import Locators

"""
Catálogo de elementos de modal Ausentismo al presionar Crear dentro de Ficha del Colaborador
"""

# DATOS DEL AUSENTISMO
TAB_DATOS_AUSENTISMO = (
    Locators.CSS_SELECTOR,
    "div#ctl00_CP1_Barra > div > div > div > ul > li:nth-of-type(7) > a > span > span > span > span")
INPUT_NUMERO1 = (Locators.ID, "ctl00_CP1_Tnulic")
INPUT_NUMERO2 = (Locators.ID, "ctl00_CP1_tdv")
SELECT_TIPO_LIC = (Locators.ID, "ctl00_CP1_Ttipo")
INPUT_FECHA_INI_LIC = (Locators.ID, "ctl00_CP1_Tfecha_lic")
INPUT_FECHA_INI_APLI = (Locators.ID, "ctl00_CP1_Tfecha_ini")
INPUT_CANT_DIAS = (Locators.ID, "ctl00_CP1_Tdias")
INPUT_FECHA_FIN_LIC = (Locators.ID, "ctl00_CP1_Tfecha_ret")
INPUT_FECHA_FIN_APLI = (Locators.ID, "ctl00_CP1_Tfecha_fin")
SELECT_MEDIOSDIAS = (Locators.ID, "ctl00_CP1_Tmedios")
SELECT_CAUSAL = (Locators.ID, "ctl00_CP1_Tcausal")
INPUT_DETALLE = (Locators.ID, "ctl00_CP1_Tdetalle")
SELECT_AFECTA_REMU = (Locators.ID, "ctl00_CP1_Trebsal")
SELECT_ESCONTINUA = (Locators.ID, "ctl00_CP1_Tescon")
INPUT_FECHA_INI_SEC = (Locators.ID, "ctl00_CP1_Tfecha_ico")

# ESPECIFICOS LICENCIA
TAB_ESPECI_LIC = (Locators.CSS_SELECTOR, "div#ctl00_CP1_TabPg > div > ul > li:nth-of-type(2) > a > span > span > span")
INPUT_DIAGNOS_CODE = (Locators.ID, "ctl00_CP1_Tdiagnos")
BTN_BUSCA_DIAGNOS = (Locators.ID, "ctl00_CP1_BusDiagnos")
INPUT_RUT_PRO = (Locators.ID, "ctl00_CP1_Trutpro")
INPUT_NOMBRE_MEDICO = (Locators.ID, "ctl00_CP1_Tmedico")
INPUT_ESPECIA_CODE = (Locators.ID, "ctl00_CP1_Tespecia")
BTN_BUSCA_ESPECIA = (Locators.ID, "ctl00_CP1_BusEspecia")
INPUT_DIAS_EXTRA_CON = (Locators.ID, "ctl00_CP1_Tdiase")

# DEL INGRESO
TAB_DEL_INGRESO = (Locators.CSS_SELECTOR, "div#ctl00_CP1_TabPg > div > ul > li:nth-of-type(3) > a > span > span > span")
SELECT_ORIGEN = (Locators.ID, "ctl00_CP1_Cborigen")
INPUT_USUARIO = (Locators.ID, "ctl00_CP1_Tusuario")
INPUT_FECHA_ING = (Locators.ID, "ctl00_CP1_Tfecha_ing")

# BARRA
BTN_OK = (Locators.XPATH, "//img[@alt='Actualiza el registro']")
BTN_VOLVER = (Locators.XPATH, "//img[@alt='Volver a la página anterior']")

# ALERTA
# ALERTA = (Locators.ID, "AlertValidation")
ALERTA = (Locators.CSS_SELECTOR, ".alert-warning")
ALERT_CLOSE = (Locators.CSS_SELECTOR, "#paginaFicha div[class='alert-close']")
