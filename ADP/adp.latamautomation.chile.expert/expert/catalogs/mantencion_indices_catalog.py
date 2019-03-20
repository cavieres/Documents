from scriptize.components.locators_type import Locators

"""
Catálogo de elementos en la página de Mantención de Índices
"""

BOTON_CREAR = (Locators.CSS_SELECTOR, "li.rtbItem:nth-child(4) > a:nth-child(1) > span:nth-child(1) >"
                                      " span:nth-child(1) > span:nth-child(1) > span:nth-child(2)")

BOTON_VOLVER = (Locators.CSS_SELECTOR, "li.rtbItem:nth-child(7) > a:nth-child(1) > span:nth-child(1) > "
                                       "span:nth-child(1) > span:nth-child(1) > span:nth-child(2)")

V01_PERIODO = (Locators.CSS_SELECTOR, "#ctl00_CP1_Grilla_ctl00__0 > td:nth-child(2)")

V02_UTM = (Locators.CSS_SELECTOR, "#ctl00_CP1_Grilla_ctl00__0 > td:nth-child(3)")

V03_UF = (Locators.CSS_SELECTOR, "#ctl00_CP1_Grilla_ctl00__0 > td:nth-child(4)")

V04_TOPE_AFP = (Locators.CSS_SELECTOR, "#ctl00_CP1_Grilla_ctl00__0 > td:nth-child(5)")

V05_TOPE_SEC = (Locators.CSS_SELECTOR, "#ctl00_CP1_Grilla_ctl00__0 > td:nth-child(6)")

V06_VARIACION_IPC = (Locators.CSS_SELECTOR, "#ctl00_CP1_Grilla_ctl00__0 > td:nth-child(7)")

V07_FACTOR_ACTUALIZACION = (Locators.CSS_SELECTOR, "#ctl00_CP1_Grilla_ctl00__0 > td:nth-child(8)")

V08_SUELDO_MINIMO = (Locators.CSS_SELECTOR, "#ctl00_CP1_Grilla_ctl00__0 > td:nth-child(9)")
