from scriptize.components.locators_type import Locators

"""
Catálogo de elementos en la página de búsqueda de colaboradores
"""

INPUT = "input"
PANE_BUSCA_COLABORADOR = (Locators.ID, "ctl00_CP1_MiddlePane")
TABLA_BUSCA_COLABORADORES = (Locators.ID, "ctl00_CP1_Grilla_ctl00")
I_CODIGO = (Locators.ID, "ctl00_CP1_Grilla_ctl00_ctl02_ctl02_FilterTextBox_codigo")
I_RUT = (Locators.ID, "ctl00_CP1_Grilla_ctl00_ctl02_ctl02_FilterTextBox_rut")
I_ESTADO = (Locators.ID, "ctl00_CP1_Grilla_ctl00_ctl02_ctl02_FilterTextBox_estado")
I_NOMBRE = (Locators.ID, "ctl00_CP1_Grilla_ctl00_ctl02_ctl02_FilterTextBox_nombre")
I_SELECCIONAR = (Locators.ID, "ctl00_CP1_Grilla_ctl00_ctl04_gbcSeleccionar")
BTN_FILTRAR = (Locators.ID, "ctl00_CP1_Grilla_ctl00_ctl02_ctl02_Filter_nombre")
BTN_BUSCAR = (Locators.XPATH, "//*[@id='ctl00_CP1_Barra']/div/div/div/ul/li[2]/a/span/span/span")
LINK_FILTER_NOMBRE = (Locators.ID, "ctl00_CP1_Grilla_ctl00_ctl02_ctl02_Filter_nombre")
BUTTON_PRIMERA_PAGINA = (Locators.NAME, "ctl00$CP1$Grilla$ctl00$ctl03$ctl01$ctl02")
BUTTON_PAGINA_ANTERIOR = (Locators.NAME, "ctl00$CP1$Grilla$ctl00$ctl03$ctl01$ctl03")
BUTTON_PAGINA_SIGUIENTE = (Locators.NAME, "ctl00$CP1$Grilla$ctl00$ctl03$ctl01$ctl04")
BUTTON_ULTIMA_PAGINA = (Locators.NAME, "ctl00$CP1$Grilla$ctl00$ctl03$ctl01$ctl05")
BUTTON_VOLVER = (
Locators.CSS_SELECTOR, "#ctl00_CP1_Barra > div > div > div > ul > li.rtbItem.rtbBtn.rtbItemHovered > a")