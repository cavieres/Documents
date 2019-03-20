from scriptize.components.locators_type import Locators

"""
Catálogo de elementos en la página de Liquidaciones Historicas
"""

# Ventana principal liquidaciones historicas
VINCULO_VER_PDF = (Locators.CSS_SELECTOR, "#ctl00_CP1_Grilla_ctl00_ctl04_gbcSeleccionar")
VINCULO_DETALLE = (Locators.CSS_SELECTOR, "#ctl00_CP1_Grilla_ctl00_ctl04_gbcDetalle")
HABERES_AFECTOS = (Locators.CSS_SELECTOR, "#ctl00_CP1_Grilla_ctl00__0 > td:nth-child(6)")
HABERES_EXENTOS = (Locators.CSS_SELECTOR, "#ctl00_CP1_Grilla_ctl00__0 > td:nth-child(7)")
LLSS = (Locators.CSS_SELECTOR, "#ctl00_CP1_Grilla_ctl00__0 > td:nth-child(8)")
DESCUENTOS = (Locators.CSS_SELECTOR, "#ctl00_CP1_Grilla_ctl00__0 > td:nth-child(9)")

# Ventana detalle.
TOTAL_HABERES = (Locators.CSS_SELECTOR, "#ctl00_CP1_thab")
TOTAL_DESCUENTOS = (Locators.CSS_SELECTOR, "#ctl00_CP1_tdesc")
BOTON_VOLVER = (Locators.CSS_SELECTOR, "#ctl00_CP1_Barra > div > div > div > ul > li:nth-child(8) > a")