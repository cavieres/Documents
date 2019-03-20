from expert.catalogs import listado_procesos_catalog
from scriptize.components.page_element import PageObjects


class ListadoProcesosPage(PageObjects):
    def get_estado(self):
        """
        Obtiene el estado de la primera fila de la tabla
        :param linea: 
        :return: estado
        """
        return self.get_text(listado_procesos_catalog.TD_ESTADO)

    def get_descripcion(self):
        """
        Obtiene la descripción de la primera fila de la tabla
        :return: descripción
        """
        return self.get_text(listado_procesos_catalog.TD_DESCRIPCION)
