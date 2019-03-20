from scriptize.components.locators_type import Locators

"""
Catálogo de los elementos de la página Emisión de Liquidaciones
"""
LINK_TODOS = (Locators.ID, "ctl00_CP1_Sele_Btodos")
LINK_SELECCION = (Locators.ID, "ctl00_CP1_Sele_Bsele")
LINK_REPETIR_ULTIMA = (Locators.ID, "ctl00_CP1_Sele_Bultima")
CHECKBOX_TBLOQUEA_LIQ = (Locators.ID, "ctl00_CP1_Topblo")
CHECKBOX_TBORRATODOS = (Locators.ID, "ctl00_CP1_Tborratodos")
CHECKBOX_CHKMAIL = (Locators.ID, "ctl00_CP1_chkmail")
SELECT_TMES_PAGO = (Locators.ID, "ctl00_CP1_Tfeliq")
SELECT_TPERIODO = (Locators.ID, "ctl00_CP1_Periodos1__TPeri")
INPUT_TFECHA_PAG = (Locators.ID, "ctl00_CP1_Tfecha_pag")
INPUT_TDESCRIP = (Locators.ID, "ctl00_CP1_TDescrip")
BTN_EJECUTAR = (
    Locators.CSS_SELECTOR, "div#ctl00_CP1_Barra > div > div > div > ul > li:nth-of-type(5) > a > span > span")
DIV_CANTIDAD_SELECCION = (Locators.ID, "ctl00_CP1_Sele_Tseleccion")

"""
Botón 'Si' de la ventana 'Opciones'
"""
BTNAUX_VENTANA_OPCIONES = (Locators.CSS_SELECTOR, ".rwDialogPopup.radconfirm > div:nth-of-type(2) > a > span")

"""
Botón 'Cerrar' de la ventana 'Preparando datos...'
"""
BTNCERRAR_VENTANA_PREPARANDO_DATOS = (
    Locators.CSS_SELECTOR, "div#ctl00_CP1_PopupSuccess > div > div > div > button > i")

"""
Catálogo de los elementos de la página Listado de Procesos
"""
AVANCE_EMI_LIQUID = (Locators.CSS_SELECTOR, "#ctl00_CP1_Grilla_ctl00_ctl04_Label1")
DESCRIPCION_EMI_LIQUID = (Locators.CSS_SELECTOR, "#ctl00_CP1_Grilla_ctl00__0 > td:nth-of-type(4)")
ESTADO_EMI_LIQUID = (Locators.CSS_SELECTOR, "#ctl00_CP1_Grilla_ctl00__0 > td:nth-child(6)")
DURACION_EMI_LIQUID = (Locators.CSS_SELECTOR, "#ctl00_CP1_Grilla_ctl00__0 > td:nth-child(10)")
