from expert.catalogs import emision_liquidacion_historicas_catalog
from scriptize.components.page_element import PageObjects
from scriptize.utils.file import File


class EmisionLiquidacionHistoricasPage(PageObjects):
    """
    La clase 'EmisionLiquidacionHistoricasPage' es reponsable por la interacción con los componentes de la página de
    Emisión de Liquidaciones Históricas
    """

    def selecciona_todos(self):
        """
        Presiona el botón TODOS
        """
        self.button.click(emision_liquidacion_historicas_catalog.LINK_TODOS)

    def unselect_envia_liquidaciones_por_mail(self):
        """
        Desmarca checkbox en caso de estar seleccionado
        """
        self.checkbox.uncheck(emision_liquidacion_historicas_catalog.CHBOX_ENVIA_POR_MAIL)

    def unselect_no_emite_liquidaciones_neto_0(self):
        """
        Desmarca checkbox en caso de estar seleccionado
        """
        self.checkbox.uncheck(emision_liquidacion_historicas_catalog.CHBOX_NO_EMITE_NETO_0)

    def unselect_pdf_agrupamiento(self):
        """
        Desmarca checkbox en caso de estar seleccionado
        """
        self.checkbox.uncheck(emision_liquidacion_historicas_catalog.CHBOX_PDF_AGRUPAMIENTO)

    def presiona_reimprimir(self):
        """
        Presiona el botón Reimprimir en la barra principal
        """
        self.button.click(emision_liquidacion_historicas_catalog.BARRA_REIMPRIMIR)

    def presiona_imprimir_pdf(self):
        """
        Presiona el botón Imprimir PDF
        """
        self.button.click(emision_liquidacion_historicas_catalog.LINK_IMPRIMIR_PDF)

    def select_mes_de_pago(self, value):
        """
        Selecciona el mes de pago
        :param value: mes de pago en formato MMM-yyyy
        """
        self.select.select_by_value(emision_liquidacion_historicas_catalog.SELECT_MES_DE_PAGO, value)

    def select_year_de_pago(self, value):
        """
        Selecciona el mes de pago
        :param value: mes de pago en formato MMM-yyyy
        """
        self.select.select_by_value(emision_liquidacion_historicas_catalog.SELECT_YEAR_DE_PAGO, value)

    def ingresa_empresa(self, value):
        """
        Ingresa empresa
        :param value: codigo empresa integer
        """
        self.input.fill(emision_liquidacion_historicas_catalog.TEXTBOX_EMPRESA, value)

    def is_pdf_file_downloaded(self, path, value):
        """
        Comprueba que la descarga del PDF fue exitosa
        :return: true or false
        """
        return File.exists(path + value)

    def get_seleccionados_text(self):
        """
        Retorna el texto del label bajos los botones de selección
        :return: texto de selección
        """
        return self.get_text(emision_liquidacion_historicas_catalog.TEXTBOX_SELECCIONADOS)

    def set_periodos(self, value):
        """
        Selecciona Periodos
        :param value: value a seleccionar
        """
        self.select.select_by_value(emision_liquidacion_historicas_catalog.SELECT_PERIODOS, value)

    def click_ordenamiento(self):
        """
        Presiona boton para configurar ordenamiento
        """
        self.button.click(emision_liquidacion_historicas_catalog.LINK_ORDENAMIENTO)

    def set_ordenamiento1(self, value):
        """
        Configura ordenamiento
        :param value: value a seleccionar
        """
        self.select.select_by_value(emision_liquidacion_historicas_catalog.SELECT_ORDENAR_POR, value)

    def set_ordenamiento2(self, value):
        """
        Configura ordenamiento
        :param value: value a seleccionar
        """
        self.select.select_by_value(emision_liquidacion_historicas_catalog.SELECT_LUEGO_POR1, value)

    def set_ordenamiento3(self, value):
        """
        Configura ordenamiento
        :param value: value a seleccionar
        """
        self.select.select_by_value(emision_liquidacion_historicas_catalog.SELECT_LUEGO_POR2, value)

    def set_ordenamiento4(self, value):
        """
        Configura ordenamiento
        :param value: value a seleccionar
        """
        self.select.select_by_value(emision_liquidacion_historicas_catalog.SELECT_LUEGO_POR3, value)

    def set_ordenamiento5(self, value):
        """
        Configura ordenamiento
        :param value: value a seleccionar
        """
        self.select.select_by_value(emision_liquidacion_historicas_catalog.SELECT_LUEGO_POR4, value)

    def click_ok(self):
        """
        Presiona boton OK
        """
        self.button.click(emision_liquidacion_historicas_catalog.BUTTON_OK)

    def get_recibo_name(self):
        """
        Obtiene el value del recibo seleccionado
        :return: value text
        """
        return self.select.get_text(emision_liquidacion_historicas_catalog.SELECT_RECIBO)
