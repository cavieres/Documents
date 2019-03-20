import os

from scriptize.utils.cfg_parser import Parser


class EmisionDeLiquidacionesData:
    """
    Clase EmisionDeLiquidacionesData donde se definen las propiedades para acceder a la información del archivo .ini.
    """

    def __init__(self):
        self.parser = Parser()
        self.parser.read(os.path.join(os.path.abspath(os.path.dirname(__file__)), 'datos_emision_liquidaciones.ini'))

    @property
    def fecha_de_pago(self):
        """
        Propiedad para utilizada para acceder a la información de Fecha de Pago
        :return: Información del campo Fecha de Pago
        """
        return self.parser.get_value("EMISION_LIQUIDACIONES", "fecha_de_pago")

    @property
    def descripcion(self):
        """
        Propiedad para utilizada para acceder a la información Descripción
        :return: Información del campo Descripción
        """
        return self.parser.get_value("EMISION_LIQUIDACIONES", "descripcion")

    @property
    def estado(self):
        """
        Propiedad para utilizada para acceder a la información de Estado
        :return: Información de la columna Estado de la grilla de procesos
        """
        return self.parser.get_value("EMISION_LIQUIDACIONES", "estado")

    @property
    def avance(self):
        """
        Propiedad para utilizada para acceder a la información de Avance
        :return: Información de la columna Avance de la grilla de procesos
        """
        return self.parser.get_value("EMISION_LIQUIDACIONES", "avance")