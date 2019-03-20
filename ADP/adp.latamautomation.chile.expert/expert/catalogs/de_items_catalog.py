from scriptize.components.locators_type import Locators

"""
Catálogo de elementos en el flujo de mapa de ítems
"""
BOTON_LIQUIDACIONES = (
    Locators.CSS_SELECTOR, "div#ctl00_CP1_BarraP > ul > li:nth-of-type(3) > a > span > span:nth-of-type(2)")

BOTON_MAPA_DE_ITEMS = (
    Locators.CSS_SELECTOR,
    "div#ctl00_CP1_BarraP > ul > li:nth-of-type(3) > div > ul > li:nth-of-type(2) > a > span > span:nth-of-type(2)")

CAMPO_DESCRIPCION = (Locators.ID, "ctl00_CP1_Grilla_ctl00_ctl02_ctl02_FilterTextBox_descrip")

BOTON_CREAR_ITEM = (
    Locators.XPATH, "//a[@title='Agregar un Item al Colaborador']")

BOTON_BUSCAR = (Locators.CSS_SELECTOR, "ctl00_CP1_busCohade")
