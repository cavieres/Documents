from scriptize.components.locators_type import Locators

"""
Catálogo de Ingreso Masivo de Campos - Común
"""
LISTA_TIPO_SELECCION = (Locators.ID, "ctl00_CP1_drptipo")
GRILLA_DE_CAMPOS = (Locators.ID, "ctl00_CP1_lsbdatos")
CAMPO_SELECCIONADO_PARA_VERIFICAR = (Locators.ID, "ctl00_CP1_txtselcampo")
BOTON_INGRESAR = (
    Locators.CSS_SELECTOR, "#ctl00_CP1_Barra > div > div > div > ul > li:nth-child(5) > a > span > span > span")
LINK_TODOS = (Locators.ID, "ctl00_CP1_Sele_Btodos")
LINK_SELECCION = (Locators.ID, "ctl00_CP1_Sele_Bsele")
LINK_REPETIR_ULTIMA = (Locators.ID, "ctl00_CP1_Sele_Bultima")

"""
Catálogo de Ingreso Masivo de Campos - Ingreso manual en cada empleado
"""
OPCIONES = (Locators.ID, "ctl00_CP1_cbOptions")
NUEVO_VALOR_CAMPO = (Locators.ID, "ctl00_CP1_Grilla_ctl00_ctl04_Nuevo")
COLUMNA_VALOR_ACTUAL_PRIMER_REGISTRO = (Locators.ID, "ctl00_CP1_Grilla_ctl00_ctl04_Actual")
COLABORADOR = (Locators.ID, "ctl00_CP1_Grilla_ctl00_ctl04_Empleado")
BOTON_VOLVER_DETALLE_DEL_CAMPO_A_MODIFICAR = (
    Locators.CSS_SELECTOR, "#ctl00_CP1_Barra > div > div > div > ul > li:nth-child(7) > a > span > span")
BUSCADOR_COLABORADOR_EN_GRILLA = (Locators.ID, "ctl00_CP1_Grilla_ctl00_ctl02_ctl02_FilterTextBox_Empleado")
IMAGEN_DE_GUARDADO = (Locators.CSS_SELECTOR, "#ctl00_CP1_Grilla_ctl00_ctl04_checkSuccess > i:nth-child(1)")

"""
Catálogo de Ingreso Masivo de Campos - Colocar valor nuevo en todos los empleados
"""
CAMPO_BUSCAR = (Locators.ID, "ctl00_CP1_txtdactual")
CAMPO_NUEVO = (Locators.ID, "ctl00_CP1_txtdnuevo")
BOTON_APLICAR_VALOR = (Locators.ID, "ctl00_CP1_Baplicar")
BOTON_GUARDAR_VALOR_A_TODOS = (Locators.CSS_SELECTOR, "#ctl00_CP1_Barra > div > div > div > ul > li:nth-child(8)")
BOTON_VOLVER_VALOR_A_TODOS = (Locators.CSS_SELECTOR, "#ctl00_CP1_Barra > div > div > div > ul > li:nth-child(7)")
MENSAJE_VALIDACION_A_TODOS = (Locators.ID, "AlertValidation")
BOTON_SI_VENTANA_OPCIONES = (Locators.CSS_SELECTOR, ".rwDialogPopup.radconfirm > div:nth-of-type(2) > a > span")