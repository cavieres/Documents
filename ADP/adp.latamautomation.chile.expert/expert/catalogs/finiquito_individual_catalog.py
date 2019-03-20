from scriptize.components.locators_type import Locators

"""
Catálogo de elementos en la página de finiquito individual
"""
# DATOS FINIQUITO
INPUT_FECHA_DOC = (Locators.ID, "ctl00_CP1_Tfecha_fin")
INPUT_FECHA_RET = (Locators.ID, "ctl00_CP1_Tfecha_ret")
INPUT_MOTI_RET = (Locators.ID, "ctl00_CP1_Tmoti_ret")
SELECT_PERIODO = (Locators.ID, "ctl00_CP1_Periodos1__TPeri")
CHECKBOX_CHKLISTA1 = (Locators.ID, "ctl00_CP1_chkLista1_0")
CHECKBOX_CHKLISTA2 = (Locators.ID, "ctl00_CP1_chkLista2_0")
INPUT_FIRMA = (Locators.ID, "ctl00_CP1_TfirmaCod")
LABEL_FIRMA = (Locators.ID, "ctl00_CP1_Label23")
INPUT_OBSERVACIONES = (Locators.ID, "ctl00_CP1_Tobs")
LABEL_OBSERVACIONES = (Locators.ID, "ctl00_CP1_Label24")

# CHECKS FINIQUITO
CHECKBOX_TRASPASA = (Locators.ID, "ctl00_CP1_chkLista1_0")
CHECKBOX_ANTICIPO = (Locators.ID, "ctl00_CP1_chkLista2_0")
CHECKBOX_DESCUENTOS = (Locators.ID, "ctl00_CP1_Tdescperi")

# CHECKS RESUMEN
CHECKBOX_FERIADO_PROP = (Locators.ID, "ctl00_CP1_Topvp")
CHECKBOX_VACNEG = (Locators.ID, "ctl00_CP1_Topmvac")

CHECKBOX_MES_SUSTITUTIVO = (Locators.ID, "ctl00_CP1_topmd")
CHECKBOX_MS_VOLUNTARIO = (Locators.ID, "ctl00_CP1_Topmvol")

CHECKBOX_INDEMNIZACION = (Locators.ID, "ctl00_CP1_topil")
CHECKBOX_IN_VOLUNTARIA = (Locators.ID, "ctl00_CP1_Topivol")

CHECKBOX_SUELDO_MES = (Locators.ID, "ctl00_CP1_Topsue")
CHECKBOX_DIFERENCIA = (Locators.ID, "ctl00_CP1_Topdif")

CHECKBOX_DESC_SOBREGIRO = (Locators.ID, "ctl00_CP1_opneg")
CHECKBOX_ASIGNACIONES = (Locators.ID, "ctl00_CP1_Topasi")
CHECKBOX_DEUDAS = (Locators.ID, "ctl00_CP1_topdeu")

INPUT_TOTAL = (Locators.ID, "ctl00_CP1_Ttotal")
BUTTON_OK = (Locators.XPATH, "//img[@alt='Actualizar el registro']")
