from scriptize.components.locators_type import Locators

"""
Catálogo de elementos de Vacaciones dentro de Ficha del Colaborador
Mantención > Ficha del Colaborador > Ausentismo > Vacaciones
"""

INPUT_CALCULAR_VACACIONES_A_FECHA = (Locators.ID, "ctl00_CP1_tFecCalVac")
INPUT_ANUALES = (Locators.ID, "ctl00_CP1_TAnuales")
INPUT_PROPORCIONALES = (Locators.ID, "ctl00_CP1_TprpSal")
INPUT_PROGRESIVOS = (Locators.ID, "ctl00_CP1_TprgSal")
INPUT_ADICIONALES = (Locators.ID, "ctl00_CP1_TadiSal")
INPUT_TOTAL = (Locators.ID, "ctl00_CP1_Ttotal")
LINK_NO = (Locators.CSS_SELECTOR, "th.rgHeader:nth-child(2) > a:nth-child(1)")
LINK_DESDE = (Locators.CSS_SELECTOR, "th.rgHeader:nth-child(3) > a:nth-child(1)")
LINK_HASTA = (Locators.CSS_SELECTOR, "th.rgHeader:nth-child(4) > a:nth-child(1)")
LINK_DIAS = (Locators.CSS_SELECTOR, "th.rgHeader:nth-child(5) > a:nth-child(1)")
LINK_TIPC = (Locators.CSS_SELECTOR, "th.rgHeader:nth-child(6) > a:nth-child(1)")
VF1_NO = (Locators.CSS_SELECTOR, "#ctl00_CP1_Grilla_ctl00__0 > td:nth-child(2)")
VF1_DESDE = (Locators.CSS_SELECTOR, "#ctl00_CP1_Grilla_ctl00__0 > td:nth-child(3)")
VF1_HASTA = (Locators.CSS_SELECTOR, "#ctl00_CP1_Grilla_ctl00__0 > td:nth-child(4)")
VF1_DIAS = (Locators.CSS_SELECTOR, "#ctl00_CP1_Grilla_ctl00__0 > td:nth-child(5)")
VF1_TIPC = (Locators.CSS_SELECTOR, "#ctl00_CP1_Grilla_ctl00__0 > td:nth-child(6)")
TABLA_DIAS_TOMADOS = (Locators.ID, "ctl00_CP1_Grilla_ctl00")
INPUT = "input"
TR1_EDITAR = (Locators.ID, "ctl00_CP1_Grilla_ctl00_ctl04_gbcSeleccionar")
TR1_ELIMINAR = (Locators.ID, "ctl00_CP1_Grilla_ctl00_ctl04_gbcEliminar")
BTN_DIASEXTRA = (Locators.XPATH, "//img[@alt='Agregar días extra']")
BTN_PERIODOS = (Locators.XPATH, "//img[@alt='Detalle períodos']")
BTN_CREAR = (Locators.CSS_SELECTOR, "#paginaFicha a[title='Crear un registro']")
BTN_IMPRIMIR = (Locators.XPATH, "//img[@alt='Actualizar el registro']")
BTN_CERRAR = (Locators.XPATH, "//img[@alt='Volver a la página anterior']")
