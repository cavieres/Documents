from scriptize.components.locators_type import Locators

"""
Catálogo de elementos de modal Vacaciones al presionar Crear dentro de Ficha del Colaborador
Mantención > Ficha del Colaborador > Ausentismo > Vacaciones
"""

# UNIDAD
RB_DIAS = (Locators.ID, "ctl00_CP1_Tampm_0")
RB_MAÑANA = (Locators.ID, "ctl00_CP1_Tampm_1")
RB_TARDE = (Locators.ID, "ctl00_CP1_Tampm_2")

# REBAJAS DE
RB_DIAS_NORMALES = (Locators.ID, "ctl00_CP1_Tvac_0")
RB_PROGRESIVOS = (Locators.ID, "ctl00_CP1_Tvac_1")
RB_ADICIONALES = (Locators.ID, "ctl00_CP1_Tvac_2")
RB_DIAS_BASE = (Locators.ID, "ctl00_CP1_Tvac_3")

# OPCIONES
CB_DIAS_CORRIDOS = (Locators.ID, "ctl00_CP1_Topd_0")
CB_AGREGAR_DIAS_ADICIONALES = (Locators.ID, "ctl00_CP1_Topd_1")
CB_VENTA_DE_DIAS = (Locators.ID, "ctl00_CP1_Topd_2")
CB_REEMPLAZA_AUSENTISMO = (Locators.ID, "ctl00_CP1_Topd_3")

# DATOS
INPUT_FECHA_INICIAL = (Locators.ID, "ctl00_CP1_TFecha_ini")
INPUT_DIAS_DE_VACACIONES = (Locators.ID, "ctl00_CP1_Tdias")
INPUT_FECHA_RETORNO = (Locators.ID, "ctl00_CP1_TFecha_ret")
INPUT_PERIODO_CORRESPONDIENTE = (Locators.ID, "ctl00_CP1_TPertom")

TB_FECHA_FINAL = (Locators.ID, "ctl00_CP1_TFecha_fin")

# BARRA
BTN_OK = (Locators.CSS_SELECTOR, "#paginaFicha a[title='Actualizar el registro']")
BTN_VOLVER = (Locators.CSS_SELECTOR, "#paginaFicha a[title='Volver a la página anterior']")

# ALERTAS
DIV_ALERT_VALIDATION = (Locators.ID, "AlertValidation")
