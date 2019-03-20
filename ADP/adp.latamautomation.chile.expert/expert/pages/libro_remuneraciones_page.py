from expert.catalogs import libro_remuneraciones_catalog
from scriptize.components.page_element import PageObjects
from scriptize.utils.file import File

class LibroRemuneracionesPage(PageObjects):
    """
    La clase 'LibroRemuneracionesPage' es responsable de la interacción con los componentes de la página de
    Libro de Remuneraciones.
    """

    def click_todos(self):
        """
        Click en el botón Todos para seleccionar todos los colaboradores.
        """
        self.button.click(libro_remuneraciones_catalog.LINK_TODOS)

    def click_repetir_ultima(self):
        """
        Click en el botón Repetir Ultima para seleccionar todos los colaboradores.
        """
        self.link.click(libro_remuneraciones_catalog.LINK_REPETIR_ULTIMA)

    def click_ok(self):
        """
        Click en el botón Ok para calcular el libro de remuneraciones.
        """
        self.button.click(libro_remuneraciones_catalog.BUTTON_OK)

    def click_link_formato_pdf(self):
        """
        Click en el vinculo Formato PDF para calcular el libro de remuneraciones.
        """
        self.button.click(libro_remuneraciones_catalog.LINK_DOWNLOAD_PDF_REPORT)

    def click_link_formato_excel(self):
        """
        Click en el vinculo Formato Excel para calcular el libro de remuneraciones.
        """
        self.button.click(libro_remuneraciones_catalog.LINK_DOWNLOAD_EXCEL_REPORT)

    def select_opcion_tipo_hoja(self, tipo_hoja):
        """
        Selecciona tipo hoja reporte
        :param tipo_hoja: tipo de hoja
        """
        if tipo_hoja == 'Hoja Carta':
            if not self.radio_button.is_checked(libro_remuneraciones_catalog.RB_OPCION_HOJA_CARTA):
                self.radio_button.check(libro_remuneraciones_catalog.RB_OPCION_HOJA_CARTA)
                self.switch_to_popup()
                self.button.click(libro_remuneraciones_catalog.ALERT_OPCION_HOJA_CARTA)
        elif tipo_hoja == 'Hoja Oficio':
            if not self.radio_button.is_checked(libro_remuneraciones_catalog.RB_OPCION_HOJA_OFICIO):
                self.radio_button.check(libro_remuneraciones_catalog.RB_OPCION_HOJA_OFICIO)

    def select_formato_salida_reporte(self, formato):
        """
        Selecciona formato salida reporte
        :param formato: formato
        """
        self.select.select_by_value(libro_remuneraciones_catalog.SELECT_FORMATO_SALIDA_REPORTE, str.lower(formato))

    def seleccionar_mes(self, mes):
        """
        Selecciona mes de proceso en pantalla.
        :param mes: mes de pago
        """
        self.select.select_by_value(libro_remuneraciones_catalog.SELECT_MES_PAGO, mes)

    def seleccionar_anio(self, anio):
        """
        Selecciona año de proceso en pantalla
        :param anio: año de pago
        :return:
        """
        self.select.select_by_value(libro_remuneraciones_catalog.SELECT_YEAR_PAGO, anio)

    def obtener_ames_pago(self):
        """
        Obtiene mes de pago seleccionado.
        """
        return "{}{}".format(self.select.get_text(libro_remuneraciones_catalog.SELECT_YEAR_PAGO), self.select.
                             get_text(libro_remuneraciones_catalog.SELECT_MES_PAGO))

    def get_alert_message(self):
        """
        Obtiene el texto de una ventana popup de alerta
        que se encuentra visible en pantalla.
        :return: Texto que se encuentra en popup.
        """
        return self.get_text(libro_remuneraciones_catalog.ALERT_VALIDATION)

    def esta_libro_remuneraciones_descargado(self, path):
        """
        Revisa si archivo se descargo en la carpeta correspondiente
        :return: Valor booleano (True o False)
        """
        return File.exists(path)