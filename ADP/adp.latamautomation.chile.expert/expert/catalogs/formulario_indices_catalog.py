from scriptize.components.locators_type import Locators

"""
Catálogo de elementos en el formulario de creación de índices
"""

# Título
TITULO = (Locators.ID, "ctl00_CP1_Ltitulo")

# Elementos
L01_PERIODO = (Locators.ID, "ctl00_CP1_Label29")
V01_PERIODO = (Locators.ID, "ctl00_CP1_Tperiodo")

L02_UTM = (Locators.ID, "ctl00_CP1_Label1")
V02_UTM = (Locators.ID, "ctl00_CP1_Tutm")

L03_UF = (Locators.ID, "ctl00_CP1_Label10")
V03_UF = (Locators.ID, "ctl00_CP1_Tuf")

L04_TOPE_AFP = (Locators.ID, "ctl00_CP1_Ltopeafp")
V04_TOPE_AFP = (Locators.ID, "ctl00_CP1_Ttopeafp")

L05_TOPE_SEC = (Locators.ID, "ctl00_CP1_Label2")
V05_TOPE_SEC = (Locators.ID, "ctl00_CP1_TtopeSec")

L06_SUELDO_MINIMO = (Locators.ID, "ctl00_CP1_Label3")
V06_SUELDO_MINIMO = (Locators.ID, "ctl00_CP1_TsueldoMin")

L07_VARIACION_IPC = (Locators.ID, "ctl00_CP1_Lipc")
V07_VARIACION_IPC = (Locators.ID, "ctl00_CP1_Tipc")

L08_FACTOR_ACTUALIZACION = (Locators.ID, "ctl00_CP1_Lfipc")
V08_FACTOR_ACTUALIZACION = (Locators.ID, "ctl00_CP1_Tfipc")

# Botones
BOTON_OK = (Locators.CSS_SELECTOR, "li.rtbItem:nth-child(5) > a:nth-child(1) > span:nth-child(1) > "
                                   "span:nth-child(1) > span:nth-child(1) > img:nth-child(1)")

BOTON_VOLVER = (Locators.CSS_SELECTOR, "li.rtbItem:nth-child(7) > a:nth-child(1) > span:nth-child(1) > "
                                       "span:nth-child(1) > span:nth-child(1) > span:nth-child(2)")
