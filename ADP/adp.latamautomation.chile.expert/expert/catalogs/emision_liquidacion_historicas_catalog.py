from scriptize.components.locators_type import Locators

"""
Catálogo de elementos presentes en la página emisión liquidación historicas
"""
LINK_TODOS = (Locators.ID, "ctl00_CP1_Sele_Btodos")
LINK_SELECCIONAR_EMPRESA = (Locators.ID, "ctl00_CP1_imgBus")
CHBOX_ENVIA_POR_MAIL = (Locators.ID, "ctl00_CP1_topmail")
CHBOX_NO_EMITE_NETO_0 = (Locators.ID, "ctl00_CP1_Topborra")
CHBOX_PDF_AGRUPAMIENTO = (Locators.ID, "ctl00_CP1_ckGroup")
BARRA_REIMPRIMIR = (Locators.ID, "ctl00_CP1_Barra")
SELECT_MES_DE_PAGO = (Locators.ID, "ctl00_CP1_Tmes")
SELECT_YEAR_DE_PAGO = (Locators.ID, "ctl00_CP1_Tanno")
TEXTBOX_EMPRESA = (Locators.ID, "ctl00_CP1_Tempresa")
LINK_IMPRIMIR_PDF = (Locators.XPATH, "//span[contains(text(), 'Imprimir PDF')]")
TEXTBOX_SELECCIONADOS = (Locators.ID, "ctl00_CP1_Sele_Tseleccion")
SELECT_PERIODOS = (Locators.ID, "ctl00_CP1_Periodos1__TPeri")
LINK_ORDENAMIENTO = (Locators.ID, "ctl00_CP1_imgBusOrd")
# modal ordenamiento
SELECT_ORDENAR_POR = (Locators.ID, "ctl00_CP1_cboorden1")
SELECT_LUEGO_POR1 = (Locators.ID, "ctl00_CP1_cboorden2")
SELECT_LUEGO_POR2 = (Locators.ID, "ctl00_CP1_cboorden3")
SELECT_LUEGO_POR3 = (Locators.ID, "ctl00_CP1_cboorden4")
SELECT_LUEGO_POR4 = (Locators.ID, "ctl00_CP1_cboorden5")
BUTTON_OK = (Locators.XPATH, "//span[contains(text(), 'Ok')]")
SELECT_RECIBO = (Locators.ID, "ctl00_CP1_Trecibo")
