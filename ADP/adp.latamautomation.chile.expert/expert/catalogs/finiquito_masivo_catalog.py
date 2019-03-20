from scriptize.components.locators_type import Locators

"""
Catálogo de elementos en la página de finiquitos masivos
"""

LINK_TODOS = (Locators.ID, "ctl00_CP1_Sele_Btodos")
LINK_SELECCION = (Locators.ID, "ctl00_CP1_Sele_Bsele")
LINK_REPETIR_ULTIMA = (Locators.ID, "ctl00_CP1_Sele_Bultima")
CHECKBOX_TRASPASAR_LIQUIDACION = (Locators.ID, "ctl00_CP1_modi")
CHECKBOX_SEPARA_ITEMS_DEUDA = (Locators.ID, "ctl00_CP1_opdsep")
CHECKBOX_GENERA_ANTICIPO = (Locators.ID, "ctl00_CP1_opant")
CHECKBOX_REVISA_FUNCIONES_VARIABLES = (Locators.ID, "ctl00_CP1_opr")
CHECKBOX_USA_PROCEDIMIENTO_EXTERNO = (Locators.ID, "ctl00_CP1_opexba")
CHECKBOX_INFORME_DETALLE_FINIQUITO = (Locators.ID, "ctl00_CP1_impdet")
CHECKBOX_ITEM_ORIGINAL = (Locators.ID, "ctl00_CP1_op1item")
CHECKBOX_AGREGA_DESCUENTOS_PERIODO = (Locators.ID, "ctl00_CP1_descperi")
INPUT_FECHA_FINIQUITOS = (Locators.ID, "ctl00_CP1_Tprimer")
INPUT_MES_ULTIMO_SUELDO = (Locators.ID, "ctl00_CP1_Tdames")
SELECT_TEXTO_FINIQUITOS = (Locators.ID, "ctl00_CP1_Ttexto")
SELECT_PERIODO_A_CONSIDERAR = (Locators.ID, "ctl00_CP1_Tperi")
INPUT_DESCRIPCION_DEL_PROCESO = (Locators.ID, "ctl00_CP1_txtDescripcion")
CHECKBOX_FERIADO_PROPORCIONAL = (Locators.ID, "ctl00_CP1_opvp")
CHECKBOX_VACACIONES_NEGATIVAS = (Locators.ID, "ctl00_CP1_opmvac")
CHECKBOX_VACACIONES_ADICIONALES = (Locators.ID, "ctl00_CP1_vacadic")
CHECKBOX_MES_SUSTITUTIVO = (Locators.ID, "ctl00_CP1_opmd")
CHECKBOX_SUSTITUTIVO_VOLUNTARIO = (Locators.ID, "ctl00_CP1_opmvol")
CHECKBOX_ADICIONALES = (Locators.ID, "ctl00_CP1_opasi")
CHECKBOX_INDEMNIZACION_LEGAL = (Locators.ID, "ctl00_CP1_opil")
CHECKBOX_INDEMNIZACION_VOLUNTARIA = (Locators.ID, "ctl00_CP1_opivol")
CHECKBOX_DEUDAS_PENDIENTES = (Locators.ID, "ctl00_CP1_opdeu")
CHECKBOX_CONVENIO_COLECTIVO = (Locators.ID, "ctl00_CP1_opccol")
CHECKBOX_SUELDO_DEL_MES = (Locators.ID, "ctl00_CP1_opsue")
CHECKBOX_INCL_FINIQ = (Locators.ID, "ctl00_CP1_opdif")
CHECKBOX_SIN_TOPE = (Locators.ID, "ctl00_CP1_oplst")
CHECKBOX_DESCONTAR_SOBREGIRO_MES = (Locators.ID, "ctl00_CP1_opneg")
BUTTON_EJECUTAR_PROCESO = (Locators.XPATH, "//span[contains(text(), 'Ejecutar el Proceso')]")
BUTTON_VOLVER = (Locators.ID,
                 "li.rtbItem:nth-child(7) > a:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(1) "
                 "> img:nth-child(1)")
SPAN_AMES = (Locators.ID, "ctl00_Tmesspro")
