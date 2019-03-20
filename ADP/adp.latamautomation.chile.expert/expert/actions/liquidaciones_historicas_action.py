from expert.pages.liquidaciones_historicas_page import LiquidacionesHistoricasPage
from scriptize.report import report
from scriptize.utils.file import File


class LiquidacionesHistoricasAction:
    """
    La clase 'LiquidacionPruebaAction' es responsable por tener todas las interacciones agrupadas.
    """

    def __init__(self):
        self.liquidaciones_historicas_page = LiquidacionesHistoricasPage()

    def valida_total_haberes(self):
        """
        Valida total de haberes.
        :return: True (total de haberes igual a la suma de afectos + exentos), False (total de haberes no es igual)
        """
        report.write_line("Validando Total Haberes!")
        haberes_afectos = self.liquidaciones_historicas_page.get_haberes_afectos()
        haberes_exentos = self.liquidaciones_historicas_page.get_haberes_exentos()
        self.liquidaciones_historicas_page.click_detalle()
        total_haberes = self.liquidaciones_historicas_page.get_total_haberes()
        resultado = total_haberes == haberes_afectos + haberes_exentos
        report.write_line("Total [{}] == Afectos [{}] + Exentos [{}] >>> Resultado [{}]".format(total_haberes,
                                                                                                haberes_afectos,
                                                                                                haberes_exentos,
                                                                                                resultado), image=True)
        return resultado

    def valida_total_descuentos(self):
        """
        Valida el total de descuentos
        :return: True (total descuento igual a la suma de llss + descuentos), False (total de descuento no es igual)
        """
        report.write_line("Validando Total Descuentos!")
        llss = self.liquidaciones_historicas_page.get_llss()
        descuentos = self.liquidaciones_historicas_page.get_descuentos()
        self.liquidaciones_historicas_page.click_detalle()
        total_descuentos = self.liquidaciones_historicas_page.get_total_descuentos()
        resultado = total_descuentos == llss + descuentos
        report.write_line("Total [{}] == llss [{}] + descuentos [{}] >>> Resultado [{}]".format(llss, descuentos,
                                                                                                total_descuentos,
                                                                                                resultado), image=True)
        return resultado

    def valida_reporte(self, carpeta_camino):
        """
        Valida si fue creado el reporte.
        :param carpeta_camino:carpeta donde está el archivo
        :return: True (reporte creado), False (reporte no creado)
        """
        reporte_creado = False
        recibo_simple = carpeta_camino + "ReciboSimpCL.pdf"
        recibo_doble = carpeta_camino + "ReciboDoblCL.pdf"
        self.liquidaciones_historicas_page.wait_for_load_page()
        self.liquidaciones_historicas_page.click_ver_pdf()
        self.liquidaciones_historicas_page.wait_for_load_page()
        report.write_line("Descargando reporte liquidaciones historicas", report.Status.SUCCESS, True)
        if File.exists(recibo_simple):
            report.write_line("Reporte Simple fue creado en la carpeta: [{}]".format(carpeta_camino))
            reporte_creado = True
        elif File.exists(recibo_doble):
            report.write_line("Reporte Double fue creado en la carpeta: [{}]".format(carpeta_camino))
            reporte_creado = True
        return reporte_creado
