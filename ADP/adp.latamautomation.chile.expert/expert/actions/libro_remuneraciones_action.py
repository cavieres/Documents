import time
import os.path
from pathlib import Path

from expert.pages.libro_remuneraciones_page import LibroRemuneracionesPage
from expert.pages.menu_page import MenuPage
from scriptize.report import report


class LibroRemuneracionesAction:
    """"
    La clase LibroRemuneracionesAction agrupa funcionalidades de la página de búsqueda de colaboradores
    """

    def __init__(self):
        self.libro_remuneraciones_page = LibroRemuneracionesPage()
        self.menu_page = MenuPage()
        self.SELECCION_TODOS = "TODOS"
        self.SELECCION_SELECCION = "SELECCIÓN"
        self.SELECCION_REPETIR_ULTIMA = "REPETIR ÚLTIMA"
        self.OPCION_HOJA_OFICIO = "Hoja Oficio"
        self.OPCION_HOJA_CARTA = "Hoja Carta"
        self.FORMATO_PDF = "PDF"
        self.FORMATO_EXCEL = "Excel"

    def genera_reporte(self, seleccion, opcion, formato):
        """
        Genera reporte y lo descarga.
        :param seleccion: Selector de empleados - TODOS, REPETIR ULTIMA.
        :param opcion: Tipo de hoja - oficio, carta.
        :param formato: Tipo de formato reporte - PDF, XLS.
        :return:
        """
        report.write_line(
            "Generando reporte de libro de remuneraciones con selección {}, opción {} y formato {}.".format(seleccion,
                                                                                                            opcion,
                                                                                                            formato))
        if seleccion == self.SELECCION_TODOS:
            self.libro_remuneraciones_page.click_todos()
        elif seleccion == self.SELECCION_REPETIR_ULTIMA:
            self.libro_remuneraciones_page.click_repetir_ultima()

        self.libro_remuneraciones_page.select_opcion_tipo_hoja(opcion)
        self.libro_remuneraciones_page.select_formato_salida_reporte(formato)
        self.libro_remuneraciones_page.seleccionar_mes(self.menu_page.get_ames().strftime('%m'))
        self.libro_remuneraciones_page.seleccionar_anio(self.menu_page.get_ames().strftime('%Y'))
        self.libro_remuneraciones_page.click_ok()

        report.write_line("Descargando reporte.", report.Status.INFO, True)

        if formato == self.FORMATO_PDF:
            self.libro_remuneraciones_page.click_link_formato_pdf()
        else:
            self.libro_remuneraciones_page.click_link_formato_excel()

    def valida_reporte(self, carpeta_descargas, extension_archivo):
        """
        Comprueba que libro de remuneraciones haya sido descargado.
        :param carpeta_descargas: Ubicacion fisica de carpeta de descargas.
        :param extension_archivo: Extension del archivo.
        :return: True si archivo reporte fue correctamente descargado.
        """
        report.write_line("Verificar validez reporte descargado.", report.Status.INFO, True)

        try:
            ruta_y_nombre_reporte = self.obtener_nombre_y_ruta_reporte(carpeta_descargas, extension_archivo)
            self.libro_remuneraciones_page = LibroRemuneracionesPage()
            existe_reporte = self.libro_remuneraciones_page.esta_libro_remuneraciones_descargado(ruta_y_nombre_reporte)

            self.borrar_reporte(ruta_y_nombre_reporte)

            if existe_reporte:
                report.write_line("Verificación de reporte exitosa.", report.Status.INFO, False)
            else:
                report.write_line("Verificación de reporte errónea: reporte no fue descargado.",
                                  report.Status.DANGER, False)

            return existe_reporte

        except AssertionError:
            report.write_line("Verificación de reporte errónea: ", report.Status.DANGER, False)
            return False

    def obtener_nombre_y_ruta_reporte(self, carpeta_descargas, extension_archivo):
        """
        Obtiene el nombre y la ruta del archivo de
        reportes que se genera en prueba.
        :param carpeta_descargas: Ubicacion fisica de carpeta de descargas.
        :param extension_archivo: Extension del archivo.
        :return: Nombre del reporte y su ubicacion.
        """
        ames_pago = self.libro_remuneraciones_page.obtener_ames_pago()

        return "{}{}_Libro_Remuneraciones{}".format(
            carpeta_descargas,
            ames_pago,
            "_T.PDF" if extension_archivo == "PDF" else ".xls")

    def borrar_reporte(self, nombre_y_ruta_reporte):
        """
        Borra reporte creado por pruebas.
        Si está vacía, se borra carpeta descargas.
        """
        while os.path.isfile(nombre_y_ruta_reporte):
            os.remove(nombre_y_ruta_reporte)

        while os.path.isfile(nombre_y_ruta_reporte + ".part"):
            try:
                os.remove(nombre_y_ruta_reporte + ".part")
            except PermissionError:
                report.write_line("No fue posible elimina archivo", report.Status.DANGER)
                continue

    def seleccionar_mes_de_pago(self):
        """
        Selecciona mes de pago
        :param mes: string
        :param year: int
        """
        report.write_line("Selección mes de pago.", report.Status.INFO, True)
        self.libro_remuneraciones_page.seleccionar_mes()
        self.libro_remuneraciones_page.seleccionar_anio()
