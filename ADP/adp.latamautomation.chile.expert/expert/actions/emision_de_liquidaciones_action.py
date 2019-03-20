from expert.data.datos_emision_liquidaciones import EmisionDeLiquidacionesData
from expert.pages.emision_de_liquidaciones_page import EmisionDeLiquidacionesPage
from scriptize.report import report


class EmisionDeLiquidacionesAction:
    """"
    La clase EmisionDeLiquidacionesAction agrupa funcionalidades o acciones de la página Emisión de Liquidaciones.
    """

    def __init__(self):
        self.emision_de_liquidaciones_page = EmisionDeLiquidacionesPage()
        self.emision_de_liquidaciones_data = EmisionDeLiquidacionesData()

    def run_emision_de_liquidaciones(self, fecha_de_pago, fec_emi_liqui_descrip):
        """
        Realiza las relaciones y acciones con la clase emision_de_liquidaciones_page que influyen en la ejecución del
        proceso de Emisión de Liquidaciones
        :param fecha_de_pago: Corresponde la Fecha que se ingresará al campo "Fecha de pago" de Emisión de Liquidación.
        :param fec_emi_liqui_descrip: Corresponde a la Fecha_Descripción que se ingresará al campo "Descripción" de
        Emisión de Liquidación.
        """
        report.write_line("Realiza las relaciones y acciones con la clase emision_de_liquidaciones_page que influyen en"
                          " la ejecución del proceso de Emisión de Liquidaciones")
        self.emision_de_liquidaciones_page.click_todos()
        self.emision_de_liquidaciones_page.set_fecha_pago(fecha_de_pago)
        self.emision_de_liquidaciones_page.set_descripcion(fec_emi_liqui_descrip)
        report.write_line("Ingreso y selección campos, página Emisión de Liquidaciones", report.Status.SUCCESS, True)
        self.emision_de_liquidaciones_page.click_ejecutar()
        report.write_line("Mostrar y cerrar ventana 'Opciones'", report.Status.SUCCESS, True)
        self.emision_de_liquidaciones_page.click_btn_si_ventana()
        report.write_line("Mostrar y cerrar ventana 'Preparando datos...'", report.Status.SUCCESS, True)
        self.emision_de_liquidaciones_page.click_btn_cerrar_ventana()
        while self.emision_de_liquidaciones_page.get_descripcion_emi_liq() != fec_emi_liqui_descrip:
            pass
        while self.emision_de_liquidaciones_page.get_avance_emi_liq() != self.emision_de_liquidaciones_data.avance:
            pass

    def valida(self, descripcion, avance, estado):
        """
        Obtiene y retorna Estado al finalizar el proceso Ejecución de Emisión de Liquidaciones
        :param descripcion: Descripción en formato DD-MM-AAAA HH:MM:SS
        :param avance: Corresponde al valor de la columna Avance
        :param estado: Corresponde al valor de la columna Estado
        :return: Retorna TRUE o FALSE
        """
        report.write_line("Se valida la ejecución del proceso Emisión de Liquidaciones")
        todo_bien = self.emision_de_liquidaciones_page.get_estado_emi_liq() == estado and \
                    self.emision_de_liquidaciones_page.get_descripcion_emi_liq() == descripcion and \
                    self.emision_de_liquidaciones_page.get_avance_emi_liq() == avance
        if todo_bien:
            report.write_line("Emisión de Liquidaciones con Descripción {} con Avance {} y Estado {} finalizó "
                              "correctamente".format(descripcion, avance, estado), report.Status.SUCCESS, True)
        else:
            report.write_line("Emisión de Liquidaciones con Descripción {} con Avance {} y Estado {} no finalizó "
                              "correctamente".format(descripcion, avance, estado), report.Status.DANGER, True)
        return todo_bien
