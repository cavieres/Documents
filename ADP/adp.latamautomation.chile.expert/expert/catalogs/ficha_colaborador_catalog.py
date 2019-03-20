from scriptize.components.locators_type import Locators

"""
Catalogo de elementos en la Ficha del Colaborador
"""

# Título
TITULO = (Locators.ID, "ctl00_CP1_Ltitulo")

# Main
L01_CODIGO = (Locators.CSS_SELECTOR, "#ctl00_CP1_Pencabezado > table:nth-child(1) > tbody:nth-child(1) > "
                                     "tr:nth-child(1) > td:nth-child(1) > table:nth-child(1) > tbody:nth-child(1) >"
                                     " tr:nth-child(1) > td:nth-child(1) > span:nth-child(1)")
V01_CODIGO = (Locators.ID, "ctl00_CP1_Tcodigo")

L01_ESTADO = (Locators.CSS_SELECTOR, "#ctl00_CP1_Pencabezado > table:nth-child(1) > "
                                     "tbody:nth-child(1) > tr:nth-child(1) > td:nth-child(1) > table:nth-child(1) > "
                                     "tbody:nth-child(1) > tr:nth-child(1) > td:nth-child(2) > table:nth-child(1) >"
                                     " tbody:nth-child(1) > tr:nth-child(1) > td:nth-child(2) > span:nth-child(1)")
V01_ESTADO = (Locators.ID, "ctl00_CP1_Testado")

L01_NOMBRE = (Locators.CSS_SELECTOR, "#ctl00_CP1_trnombre > td:nth-child(1) > span:nth-child(1)")
V01_NOMBRE = (Locators.ID, "ctl00_CP1_Tnombre")

L01_CARGO = (Locators.CSS_SELECTOR, "#ctl00_CP1_trcargo > td:nth-child(1) > span:nth-child(1)")
V01_CARGO = (Locators.ID, "ctl00_CP1_Tcargo")
D01_CARGO = (Locators.ID, "ctl00_CP1_Dcargo")

L01_EMPRESA = (Locators.CSS_SELECTOR, "#ctl00_CP1_trempresa > td:nth-child(1) > span:nth-child(1)")
V01_EMPRESA = (Locators.ID, "ctl00_CP1_Tempresa")
D01_EMPRESA = (Locators.ID, "ctl00_CP1_Dempresa")

L01_UNIDAD = (Locators.CSS_SELECTOR, "#ctl00_CP1_trunidad > td:nth-child(1) > span:nth-child(1)")
V01_UNIDAD = (Locators.ID, "ctl00_CP1_Tunidad")
D01_UNIDAD = (Locators.ID, "ctl00_CP1_Dunidad")

L01_CENTRO_DE_COSTO = (Locators.CSS_SELECTOR, "#ctl00_CP1_trcencos > td:nth-child(1) > span:nth-child(1)")
V01_CENTRO_DE_COSTO = (Locators.ID, "ctl00_CP1_Tcencos")
D01_CENTRO_DE_COSTO = (Locators.ID, "ctl00_CP1_Dcencos")

L01_SECCION = (Locators.CSS_SELECTOR, "#ctl00_CP1_trseccion > td:nth-child(1) > span:nth-child(1)")
V01_SECCION = (Locators.ID, "ctl00_CP1_Tseccion")
D01_SECCION = (Locators.ID, "ctl00_CP1_Dseccion")

# Identificación
M02_IDENTIFICACION = (Locators.CSS_SELECTOR, "#ctl00_CP1_FId > i:nth-child(1)")
E02_EXIT = (Locators.CSS_SELECTOR, ".rwCloseButton")

L02_ESTADO = (Locators.CSS_SELECTOR, "#ctl00_CP1_Pdialogo > table:nth-child(1) > tbody:nth-child(1) > "
                                     "tr:nth-child(1) > td:nth-child(1) > span:nth-child(1)")
C02_ESTADO = (Locators.NAME, "ctl00$CP1$Testado")

L02_ES_CONFIDENCIAL = (Locators.CSS_SELECTOR, "#ctl00_CP1_Pdialogo > table:nth-child(1) > tbody:nth-child(1) > "
                                              "tr:nth-child(1) > td:nth-child(2) > span:nth-child(2)")
C02_ES_CONFIDENCIAL = (Locators.NAME, "ctl00$CP1$Tconfid")

# Inf. Personal
M03_INF_PERSONAL = (Locators.CSS_SELECTOR, ".fa-archive")
E03_EXIT_INF_PERSONAL = (Locators.CSS_SELECTOR, "#ctl00_CP1_Barra > div > div > div > ul > li:nth-child(7) > a")
L03_RUT = (Locators.CSS_SELECTOR, "#ctl00_CP1_Pdialogo > table:nth-child(1) > tbody:nth-child(1) > tr:nth-child(2) > "
                                  "td:nth-child(1) > span:nth-child(1)")
V03_RUT = (Locators.ID, "ctl00_CP1_Trut_Trut")
FONO_FIJO = (Locators.ID, "ctl00_CP1_Tfono1")
CELULAR_INF_PERSONAL = (Locators.ID, "ctl00_CP1_Tcelular")
BOTON_ACTUALIZAR_INF_PERSONAL = (Locators.CSS_SELECTOR, "#ctl00_CP1_Barra > div > div > div > ul > li:nth-child(5)")
BOTON_CERRAR = (Locators.XPATH, "//*[@id='ctl00_CP1_Barra']/div/div/div/ul/li[7]/a/span/span")

# Contrato
# LLSS
# Forma de Pago
# Disponible
# Otros datos
# Configuración

# BARRA INFERIOR
M00_BUSCAR = (Locators.XPATH, "//*[@class='rtbText' and contains(text(),'Buscar')]")

CAMPO_NOMBRE_BUSCAR = (Locators.ID, "ctl00_CP1_Grilla_ctl00_ctl02_ctl02_FilterTextBox_nombre")
CAMPO_CODIGO_BUSCAR = (Locators.ID, "ctl00_CP1_Grilla_ctl00_ctl02_ctl02_FilterTextBox_codigo")
PRIMER_REGISTRO_COLABORADOR = (Locators.ID, "ctl00_CP1_Grilla_ctl00_ctl04_gbcSeleccionar")

# SUBMENUS

# AUSENTISMO
S02_AUSENTISMO = (
    Locators.XPATH, "//*[@class='rpText' and contains(text(),'Ausentismo')]")

S0201_LICENCIAS = (Locators.XPATH, '//span[contains(text(), "Licencias/Permisos")]')
S0202_VACACIONES = (Locators.XPATH, "//a[@onclick='Vrmanvac();return false;']")

# LIQUIDACIONES
S03_LIQUIDACIONES = (Locators.XPATH, "//span[@class='rpText' and contains(text(),'Liquidaciones')]")
S0301_HISTORICAS = (Locators.XPATH, "//*[@class='rpText' and contains(text(),'Históricas')]")
S0302_ITEMS = (Locators.XPATH, "//*[@class='rpText' and contains(text(),'Mapa de Items')]")
S0303_DE_PRUEBA = (Locators.XPATH, "//*[@class='rpText' and contains(text(),'De prueba')]")

# LEGALES
S01_INFO_RELACIONADA = (Locators.CSS_SELECTOR, ".rpRootGroup > li:nth-child(1) > a:nth-child(1) > span:nth-child(1) > "
                                               "span:nth-child(1)")
S04_LEGALES = (Locators.CSS_SELECTOR, ".rpRootGroup > li:nth-child(4) > a:nth-child(1) > span:nth-child(1) > "
                                      "span:nth-child(1)")
S0402_FINIQUITOS = (Locators.CSS_SELECTOR, ".rpRootGroup > li:nth-child(4) > div:nth-child(2) > ul:nth-child(1) > "
                                           "li:nth-child(2) > a:nth-child(1) > span:nth-child(1) > span:nth-child(2)")
FECHA_DE_RETIRO = (Locators.ID, "ctl00_CP1_Tfecha_ret")
