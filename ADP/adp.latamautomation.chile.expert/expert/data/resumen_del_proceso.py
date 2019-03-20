import os

from scriptize.utils.cfg_parser import Parser


class ResumenDelProcesoData:
    """
    Clase ResumenDelProcesoData donde se definen las propiedades para acceder a la información del archivo ini.
    """

    def __init__(self):
        self.parser = Parser()
        self.parser.read(os.path.join(os.path.abspath(os.path.dirname(__file__)), 'resumen_del_proceso.ini'))

    @property
    def carpeta_descarga(self):
        """
        Propiedad para utilizada para acceder a la información de carpeta_descarga
        :return: carpeta_descarga
        """
        return self.parser.get_value("RESUMEN_PROCESO", "carpeta_descarga")

    @property
    def nombre_archivo(self):
        """
        Propiedad para utilizada para acceder a la información de nombre_archivo
        :return: nombre_archivo
        """
        return self.parser.get_value("RESUMEN_PROCESO", "nombre_archivo")
