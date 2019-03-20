from scriptize.components.locators_type import Locators

"""
Catálogo de elementos en la página de libro remuneraciones
"""
# SELECTOR DE COLABORADORES
LINK_TODOS = (Locators.ID, "ctl00_CP1_Sele_Btodos")
LINK_REPETIR_ULTIMA = (Locators.ID, "ctl00_CP1_Sele_Bultima")

# BARRA INFERIOR
BUTTON_OK = (Locators.CSS_SELECTOR, "#ctl00_CP1_Barra > div > div > div > ul > li:nth-child(5) > a > "
                                    "span > span > span > span")

# PANEL LATERAL
LINK_DOWNLOAD_PDF_REPORT = (Locators.LINK_TEXT, "Formato PDF")
LINK_DOWNLOAD_EXCEL_REPORT = (Locators.LINK_TEXT, "Formato Excel")

# Lista mes de pago
SELECT_MES_PAGO = (Locators.ID, "ctl00_CP1_Tmes")
SELECT_YEAR_PAGO = (Locators.ID, "ctl00_CP1_Tanno")

# Panel de alerta
ALERT_VALIDATION = (Locators.CSS_SELECTOR, "#AlertValidation > span:nth-child(3)")
ALERT_OPCION_HOJA_CARTA = (Locators.CSS_SELECTOR, ".rwDialogPopup.radconfirm > div:nth-of-type(2) > a > span")

# Opcion tipo de hoja
RB_OPCION_HOJA_OFICIO = (Locators.ID, "ctl00_CP1_cbHojaOficio")
RB_OPCION_HOJA_CARTA = (Locators.ID, "ctl00_CP1_cbHojaCarta")

# Lista formato reporte
SELECT_FORMATO_SALIDA_REPORTE = (Locators.ID, "ctl00_CP1_cbFormatoSalida")
