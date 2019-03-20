from scriptize.components.locators_type import Locators

"""
Catálogo de elementos en la página que lista los procesos e finiquitos y liquidaciones
"""

TD_DESCRIPCION = (Locators.CSS_SELECTOR, "tr.odd:nth-child(1) > td:nth-child(3)")
TD_ESTADO = (Locators.CSS_SELECTOR, "tr.odd:nth-child(1) > td:nth-child(1)")
