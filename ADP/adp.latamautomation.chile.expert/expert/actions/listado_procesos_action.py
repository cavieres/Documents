from expert.pages.listado_procesos_page import ListadoProcesosPage
from scriptize.report import log_handler as log


class ListadoProcesosAction:
    def __init__(self):
        self.listado_de_procesos_page = ListadoProcesosPage()

    def validar_proceso(self, descripcion):
        """
        Valida que el proceso termine cuando al comparar la descripcion del proceso con la descripción del primer 
        registro de la tabla de procesos estos sean iguales
        :param descripcion: 
        :return: estado del proceso 
        """
        while self.listado_de_procesos_page.get_descripcion() != descripcion:
            pass
        while self.listado_de_procesos_page.get_estado() != "Listo":
            pass
        estado_proceso = self.listado_de_procesos_page.get_estado()
        log.LOGGER.info(estado_proceso)
        return estado_proceso
