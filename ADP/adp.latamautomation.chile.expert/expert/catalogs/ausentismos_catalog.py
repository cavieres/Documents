from scriptize.components.locators_type import Locators

"""
Catálogo de elementos de Ausentismo dentro de Ficha del Colaborador
"""

LINK_FECHA_LICENCIA = (
    Locators.CSS_SELECTOR, "table#ctl00_CP1_Grilla_ctl00_Header > thead > tr > th:nth-of-type(2) > a")
LINK_NRO = (Locators.CSS_SELECTOR, "table#ctl00_CP1_Grilla_ctl00_Header > thead > tr > th:nth-of-type(3) > a")
LINK_DIAS = (Locators.CSS_SELECTOR, "table#ctl00_CP1_Grilla_ctl00_Header > thead > tr > th:nth-of-type(4) > a")
LINK_TIPO = (Locators.CSS_SELECTOR, "table#ctl00_CP1_Grilla_ctl00_Header > thead > tr > th:nth-of-type(5) > a")
LINK_MOTIVO = (Locators.CSS_SELECTOR, "table#ctl00_CP1_Grilla_ctl00_Header > thead > tr > th:nth-of-type(6) > a")
LINK_ES_CNT = (Locators.CSS_SELECTOR, "table#ctl00_CP1_Grilla_ctl00_Header > thead > tr > th:nth-of-type(7) > a")
LINK_ORGN = (Locators.CSS_SELECTOR, "table#ctl00_CP1_Grilla_ctl00_Header > thead > tr > th:nth-of-type(8) > a")
LINK_FECHA_APLICACION = (
    Locators.CSS_SELECTOR, "table#ctl00_CP1_Grilla_ctl00_Header > thead > tr > th:nth-of-type(9) > a")
LINK_USUARIO = (Locators.CSS_SELECTOR, "table#ctl00_CP1_Grilla_ctl00_Header > thead > tr > th:nth-of-type(10) > a")
LINK_FECHA_INGRESO = (
    Locators.CSS_SELECTOR, "table#ctl00_CP1_Grilla_ctl00_Header > thead > tr > th:nth-of-type(11) > a")
BTN_EXPORTAEXCEL = (Locators.ID, "ctl00_CP1_Bexporta")
TR1_EDITAR = (Locators.ID, "ctl00_CP1_Grilla_ctl00_ctl04_gbcEditar")
TR1_FECHA_LICEN = (Locators.CSS_SELECTOR, "#ctl00_CP1_Grilla_ctl00__0 > td:nth-child(2)")
TR1_DIAS = (Locators.CSS_SELECTOR, "#ctl00_CP1_Grilla_ctl00__0 > td:nth-child(4)")
TR1_NRO = (Locators.CSS_SELECTOR, "#ctl00_CP1_Grilla_ctl00__0 > td:nth-child(3)")
TR1_ENVIAREMAIL = (Locators.ID, "ctl00_CP1_Grilla_ctl00_ctl04_gbcEnviar")
TR1_DELETE = (Locators.ID, "ctl00_CP1_Grilla_ctl00_ctl04_gbcDeleteColumn")
BTN_CREAR = (Locators.XPATH, "//img[@alt='Crear un ausentismo']")
TABLA_AUSENTISMOS = (Locators.ID, "ctl00_CP1_Grilla_ctl00")
BTN_SEGUIENTE = (Locators.XPATH, "//input[@type='button'][@title='Página Siguiente']")
BTN_SORT_ASC = (Locators.XPATH, "//input[@title='Sorted asc']")
