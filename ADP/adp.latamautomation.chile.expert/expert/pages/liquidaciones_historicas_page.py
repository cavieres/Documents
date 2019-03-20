from expert.catalogs import liquidaciones_historicas_catalog
from scriptize.components.page_element import PageObjects


class LiquidacionesHistoricasPage(PageObjects):
    """
    Interacción con los componentes de la página
    de liquidaciones historicas.
    """

    def get_haberes_afectos(self):
        """
        Obtiene el valor en el campo Haberes Afectos.
        :return: Valor haber afecto.
        """
        return float(
            self.input.get_text(liquidaciones_historicas_catalog.HABERES_AFECTOS).replace(".", "").replace(",", "."))

    def get_haberes_exentos(self):
        """
        Obtiene el valor en el campo Haberes Exentos.
        :return: Valor haber exento.
        """
        return float(
            self.input.get_text(liquidaciones_historicas_catalog.HABERES_EXENTOS).replace(".", "").replace(",", "."))

    def get_llss(self):
        """
        Obtiene el valor en el campo LLSS.
        :return: valor LLSS
        """
        return float(self.input.get_text(liquidaciones_historicas_catalog.LLSS).replace(".", "").replace(",", "."))

    def get_descuentos(self):
        """
        Obtiene el valor en el campo Descuentos.
        :return: Valor descuentos.
        """
        return float(
            self.input.get_text(liquidaciones_historicas_catalog.DESCUENTOS).replace(".", "").replace(",", "."))

    def click_ver_pdf(self):
        """
        Descarga reporte PDF liquidacion historica.
        """
        self.button.click(liquidaciones_historicas_catalog.VINCULO_VER_PDF)

    def click_detalle(self):
        """
        Abre pantalla detalle liquidacion historica.
        """
        self.button.click(liquidaciones_historicas_catalog.VINCULO_DETALLE)

    def get_total_haberes(self):
        """
        Obtiene el valor en el campo Total Haberes de la pagina detalle.
        :return: Valor total haberes.
        """
        return float(self.input.get_text(liquidaciones_historicas_catalog.TOTAL_HABERES).replace(".", ""))

    def get_total_descuentos(self):
        """
        Obtiene el valor en el campo Total Descuentos de la pagina detalle.
        :return: valor total descuentos.
        """
        return float(self.input.get_text(liquidaciones_historicas_catalog.TOTAL_DESCUENTOS).replace(".", ""))

    def click_volver(self):
        """
        Cierra ventana detalle liquidaciones historicas.
        """
        self.button.click(liquidaciones_historicas_catalog.BOTON_VOLVER)
