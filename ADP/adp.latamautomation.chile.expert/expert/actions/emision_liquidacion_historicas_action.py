from expert.pages.emision_liquidacion_historicas_page import EmisionLiquidacionHistoricasPage
from expert.pages.menu_page import MenuPage


class EmisionLiquidacionHistoricasAction:
    """
    La clase EmisionLiquidacionHistoricasAction es responsable de agrupar las funcionalidades de Emisión de 
    Liquidaciones Históricas
    """

    def __init__(self):
        self.emision_liquidacion_historicas_page = EmisionLiquidacionHistoricasPage()
        self.menu_page = MenuPage()

    def ejecutar_liquidacion_historicas(self, periodo, empresa, ordenamiento):
        """
        Realiza una liquidacion historica de todos los colaboradores y genera el documento PDF
        """
        self.emision_liquidacion_historicas_page.unselect_envia_liquidaciones_por_mail()
        self.emision_liquidacion_historicas_page.unselect_no_emite_liquidaciones_neto_0()
        self.emision_liquidacion_historicas_page.unselect_pdf_agrupamiento()
        self.emision_liquidacion_historicas_page.selecciona_todos()

        while self.emision_liquidacion_historicas_page.get_seleccionados_text() == "Ninguno":
            pass  # to make sure that someone is selected

        self.emision_liquidacion_historicas_page.select_mes_de_pago(self.menu_page.get_ames().strftime('%m'))
        self.emision_liquidacion_historicas_page.select_year_de_pago(self.menu_page.get_ames().strftime('%Y'))
        self.emision_liquidacion_historicas_page.set_periodos(periodo)
        self.emision_liquidacion_historicas_page.ingresa_empresa(empresa)
        self.emision_liquidacion_historicas_page.click_ordenamiento()
        self.emision_liquidacion_historicas_page.switch_to_popup()
        self.emision_liquidacion_historicas_page.set_ordenamiento1(ordenamiento)
        self.emision_liquidacion_historicas_page.set_ordenamiento2(ordenamiento)
        self.emision_liquidacion_historicas_page.set_ordenamiento3(ordenamiento)
        self.emision_liquidacion_historicas_page.set_ordenamiento4(ordenamiento)
        self.emision_liquidacion_historicas_page.set_ordenamiento5(ordenamiento)
        self.emision_liquidacion_historicas_page.click_ok()
        self.emision_liquidacion_historicas_page.switch_to_main_window()
        self.emision_liquidacion_historicas_page.presiona_reimprimir()
        self.emision_liquidacion_historicas_page.presiona_imprimir_pdf()

    def comprobar_descarga_PDF(self, path):
        """
        Comprueba la descarga del archivo
        :param path: la direccion en la cual se descargó el archivo
        :return: True si encuentra el archivo . False sino
        """
        return self.emision_liquidacion_historicas_page.is_pdf_file_downloaded(path,
                                                                               self.emision_liquidacion_historicas_page.get_recibo_name() + ".pdf")
