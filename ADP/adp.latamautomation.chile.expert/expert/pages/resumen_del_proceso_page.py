import os

from expert.catalogs import resumen_del_proceso_catalog
from scriptize.components.page_element import PageObjects
from scriptize.utils.file import File


class ResumenDelProcesoPage(PageObjects):
    """
    La clase 'ResumenDelProcesoPage' es responsable de la interacción con los componentes de la página de
    Resumen del Proceso
    """

    def click_todos(self):
        """
        Permite seleccionar la opción TODOS en el campo Selección
        """
        self.button.click(resumen_del_proceso_catalog.LINK_TODOS)

    def click_seleccion(self):
        """
        Permite seleccionar la opción SELECCION en el campo Selección
        """
        self.button.click(resumen_del_proceso_catalog.LINK_SELECCION)

    def click_repetir_ultima(self):
        """
        Permite seleccionar la opción REPETIR ÚLTIMA en el campo Selección
        """
        self.button.click(resumen_del_proceso_catalog.LINK_REPETIR_ULTIMA)

    def select_separa_cc(self, opcion_separa):
        """
        Permite seleccionar campo SEPARA POR CENTRO DE COSTO
        :param opcion_separa: Valor de campo "Separa por centro de costo?"
        """
        self.select.select_by_visible_text(resumen_del_proceso_catalog.SELECT_TSEPARACC, opcion_separa)

    def select_periodos(self, opcion_periodos):
        """
        Permite seleccionar campo PERIODOS
        :param opcion_periodos: Valor de campo "Periodos"
        """
        self.select.select_by_visible_text(resumen_del_proceso_catalog.SELECT_TPERI, opcion_periodos)

    def click_ir_resumen(self):
        """
        Realiza acción click link Ir a Resumen de Proceso
        """
        self.button.click(resumen_del_proceso_catalog.LINK_IR_RESUMEN_PROCESO)

    def click_imprimir(self):
        """
        Realiza acción de click sobre link Imprimir
        """
        self.button.click(resumen_del_proceso_catalog.LINK_IMPRIMIR)

    def click_menu_avisos(self):
        """
        Desplegar menú Avisos
        """
        self.button.click(resumen_del_proceso_catalog.LINK_MENU_AVISOS)

    def get_texto_avisos(self):
        """
        Obtiene el texto Avisos
        :return: texto Avisos
        """
        return self.get_text(resumen_del_proceso_catalog.MSJ_AVISOS)

    def is_archivo_pdf(self, path):
        """
        Revisa si archivo se descargo en la carpeta correspondiente
        :return: Valor booleano (True o False)
        """
        return File.exists(path + os.sep + "ResumenProceso.pdf")
