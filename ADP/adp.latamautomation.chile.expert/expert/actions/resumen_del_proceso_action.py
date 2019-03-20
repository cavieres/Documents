from expert.pages.resumen_del_proceso_page import ResumenDelProcesoPage
from scriptize.report import report


class ResumenDelProcesoAction:
    """"
    La clase ResumenDelProcesoAction agrupa funcionalidades de la página Resumen del Proceso.
    """

    def __init__(self):
        self.resumen_del_proceso_page = ResumenDelProcesoPage()

    def generate_resumen_proceso(self):
        """
        Realiza la ejecución de Resumen del Proceso
        """
        self.resumen_del_proceso_page.click_todos()
        report.write_line("Ingreso y selección de datos, página Resumen del Proceso", report.Status.SUCCESS, True)

        self.resumen_del_proceso_page.click_ir_resumen()
        report.write_line("Imprimir Resumen del Proceso", report.Status.SUCCESS, True)

        self.resumen_del_proceso_page.click_imprimir()
