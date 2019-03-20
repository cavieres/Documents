from scriptize.components.locators_type import Locators

"""
Catálogo de los elementos de la página Resumen del Proceso
"""
LINK_TODOS = (Locators.ID, "ctl00_CP1_Sele_Btodos")
LINK_SELECCION = (Locators.ID, "ctl00_CP1_Sele_Bsele")
LINK_REPETIR_ULTIMA = (Locators.ID, "ctl00_CP1_Sele_Bultima")
SELECT_TSEPARACC = (Locators.ID, "ctl00_CP1_Tsepcc")
SELECT_MESPAGO = (Locators.ID, "ctl00_CP1_MesPago_ddlMesPago")
SELECT_TPERI = (Locators.ID, "ctl00_CP1_TPeri__TPeri")

LINK_IR_RESUMEN_PROCESO = (
    Locators.CSS_SELECTOR, "div#ctl00_CP1_Barra > div > div > div > ul > li:nth-of-type(5) > a > span > span > span")

LINK_IMPRIMIR = (
    Locators.CSS_SELECTOR, "div#ctl00_CP1_Barra > div > div > div > ul > li:nth-of-type(5) > a > span > span")
