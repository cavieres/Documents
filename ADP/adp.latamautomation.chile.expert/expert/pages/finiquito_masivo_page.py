from expert.catalogs import finiquito_masivo_catalog
from scriptize.components.page_element import PageObjects


class FiniquitoMasivoPage(PageObjects):
    """
    La clase 'FiniquitoMasivoPage' es responsable de la interacción con los componentes de la página de
    Finiquito Masivo
    """

    def click_todos(self):
        """
        Click en el botón 'Todos' del selector de empleados
        """
        self.button.click(finiquito_masivo_catalog.LINK_TODOS)

    def click_seleccion(self):
        """
        Click en el botón 'Selección' del selector de empleados 
        """
        self.button.click(finiquito_masivo_catalog.LINK_SELECCION)

    def click_repetir_ultima(self):
        """
        Click en el botón 'Repetir última' del selector de empleados 
        """
        self.button.click(finiquito_masivo_catalog.LINK_REPETIR_ULTIMA)

    def check_traspasar_a_liquidacion(self):
        """
        Selecciona checkbox 'Traspasar a la Liquidacion' 
        """
        self.checkbox.check(finiquito_masivo_catalog.CHECKBOX_TRASPASAR_LIQUIDACION)

    def check_separa_items_de_deuda(self):
        """
        Selecciona checkbox 'Separa Items de Deuda' 
        """
        self.checkbox.check(finiquito_masivo_catalog.CHECKBOX_SEPARA_ITEMS_DEUDA)

    def check_genera_anticipo(self):
        """
        Selecciona checkbox 'Genera Anticipo' 
        """
        self.checkbox.check(finiquito_masivo_catalog.CHECKBOX_GENERA_ANTICIPO)

    def check_revisa_funciones_y_variables(self):
        """
        Selecciona checkbox 'Revisa Funciones y Variables' 
        """
        self.checkbox.check(finiquito_masivo_catalog.CHECKBOX_REVISA_FUNCIONES_VARIABLES)

    def check_usa_procedimiento_externo(self):
        """
        Selecciona checkbox 'Usa procedimiento externo' 
        """
        self.checkbox.check(finiquito_masivo_catalog.CHECKBOX_USA_PROCEDIMIENTO_EXTERNO)

    def check_informe_detalle_finiquito(self):
        """
        Selecciona checkbox 'Informe Detalle de Finiquito' 
        """
        self.checkbox.check(finiquito_masivo_catalog.CHECKBOX_INFORME_DETALLE_FINIQUITO)

    def check_item_original(self):
        """
        Selecciona checkbox 'Item Original' 
        """
        self.checkbox.check(finiquito_masivo_catalog.CHECKBOX_ITEM_ORIGINAL)

    def check_agrega_descuentos_periodo(self):
        """
        Selecciona checkbox 'Agrega Descuentos del Periodo' 
        """
        self.checkbox.check(finiquito_masivo_catalog.CHECKBOX_AGREGA_DESCUENTOS_PERIODO)

    def set_fecha_finiquitos(self, value):
        """
        Llena campo 'Fecha Finiquito' 
        """
        self.input.fill(finiquito_masivo_catalog.INPUT_FECHA_FINIQUITOS, value)

    def set_mes_ultimo_sueldo(self, value):
        """
        Llena el campo Mes último sueldo con el AMES correspondiente
        :param value: Mes último Sueldo 
        """
        self.input.wait_for_element_present(finiquito_masivo_catalog.INPUT_MES_ULTIMO_SUELDO, 30)
        self.input.fill(finiquito_masivo_catalog.INPUT_MES_ULTIMO_SUELDO, value)

    def set_texto_finiquito(self, value):
        """
        Llena el campo texto del finiquito con la primera plantilla de reporte de finiquitos disponible en el combo
        :param value: Texto de finiquito (plantilla)
        """
        self.select.select_by_index(finiquito_masivo_catalog.SELECT_TEXTO_FINIQUITOS, value)

    def set_periodo_a_considerar(self, value):
        """
        Selecciona el periodo a considerar
        :param value:  Periodo
        """
        self.select.select_by_index(finiquito_masivo_catalog.SELECT_PERIODO_A_CONSIDERAR, value)

    def set_descripcion_del_proceso(self, value):
        """
        Llena el campo Descripcion del Proceso con un TimeStamp de la fecha y hora actual
        :param value: Descripción del proceso        
        """
        self.input.fill(finiquito_masivo_catalog.INPUT_DESCRIPCION_DEL_PROCESO, value)

    def check_feriado_proporcional(self):
        """
        Selecciona checkbox 'Feriado Proporcional' 
        """
        self.checkbox.check(finiquito_masivo_catalog.CHECKBOX_FERIADO_PROPORCIONAL)

    def check_mes_sustitutivo(self):
        """
        Selecciona checkbox 'Mes Sustitutivo' 
        """
        self.checkbox.check(finiquito_masivo_catalog.CHECKBOX_MES_SUSTITUTIVO)

    def check_sustitutivo_voluntario(self):
        """
        Selecciona checkbox 'Voluntario' 
        """
        self.checkbox.check(finiquito_masivo_catalog.CHECKBOX_SUSTITUTIVO_VOLUNTARIO)

    def check_adicionales(self):
        """
        Selecciona checkbox 'Vac. adic?' 
        """
        self.checkbox.check(finiquito_masivo_catalog.CHECKBOX_ADICIONALES)

    def check_indemnizacion_legal(self):
        """
        Selecciona checkbox 'Indemnización Legal' 
        """
        self.checkbox.check(finiquito_masivo_catalog.CHECKBOX_INDEMNIZACION_LEGAL)

    def check_indemnizacion_voluntaria(self):
        """
        Selecciona checkbox 'Indemnización voluntaria?' 
        """
        self.checkbox.check(finiquito_masivo_catalog.CHECKBOX_INDEMNIZACION_VOLUNTARIA)

    def check_deudas_pendientes(self):
        """
        Selecciona checkbox 'Deudas pendientes' 
        """
        self.checkbox.check(finiquito_masivo_catalog.CHECKBOX_DEUDAS_PENDIENTES)

    def check_convenio_colectivo(self):
        """
        Selecciona checkbox 'Convenio Colectivo u otro exento?' 
        """
        self.checkbox.check(finiquito_masivo_catalog.CHECKBOX_CONVENIO_COLECTIVO)

    def check_sueldo_del_mes(self):
        """
        Selecciona checkbox 'Sueldo del mes' 
        """
        self.checkbox.check(finiquito_masivo_catalog.CHECKBOX_SUELDO_DEL_MES)

    def check_incl_finiq(self):
        """
        Selecciona checkbox 'Incl.finiq.' 
        """
        self.checkbox.check(finiquito_masivo_catalog.CHECKBOX_INCL_FINIQ)

    def check_sin_tope(self):
        """
        Selecciona checkbox 'Sin tope de años?' 
        """
        self.checkbox.check(finiquito_masivo_catalog.CHECKBOX_SIN_TOPE)

    def check_descontar_sobregiro_mes(self):
        """
        Selecciona checkbox 'Descontar sobregiro del mes' 
        """
        self.checkbox.check(finiquito_masivo_catalog.CHECKBOX_DESCONTAR_SOBREGIRO_MES)

    def click_ejecutar_proceso(self):
        """
        Click en 'Ejecutar Proceso'
        """
        self.button.click(finiquito_masivo_catalog.BUTTON_EJECUTAR_PROCESO)

    def get_ames(self):
        """
        Obtiene AMES de la pantalla 
        """
        return self.input.get_text(finiquito_masivo_catalog.SPAN_AMES)
