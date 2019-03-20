from scriptize.components.locators_type import Locators

"""
Catálogo de elementos de modal Mapa de Items dentro de Ficha del Colaborador
"""

INPUT_DESCRIPCION = (Locators.ID, "ctl00_CP1_Grilla_ctl00_ctl02_ctl02_FilterTextBox_descrip")
COLUMN_MONTO = (Locators.CSS_SELECTOR, "#ctl00_CP1_Grilla_ctl00__0 > td:nth-child(10)")
BUTTON_DELETE = (Locators.ID, "ctl00_CP1_Grilla_ctl00_ctl04_gbcDeleteColumn")
BUTTON_CREAR = (Locators.XPATH, "//a[@title='Agregar un Item al Colaborador']")
BUTTON_LIQUIDACION = (Locators.XPATH, "//a[@title='Ver la liquidacion']")
