import os

from scriptize.utils.cfg_parser import Parser


class EmiLiqHisData:
    """
    EmiLiqHisData es el objeto que contiene los datos necesarios para realizar emision de liquidacion historica
    """

    def __init__(self):
        self.parser = Parser()
        self.parser.read(
            os.path.join(os.path.abspath(os.path.dirname(__file__)), 'datos_emision_liquidacion_historicas.ini'))

    @property
    def empresa(self):
        """
        Devuelve la empresa
        :return: empresa
        """
        return self.parser.get_value("EMILIQHIS", "empresa")

    @property
    def periodo(self):
        """
        Devuelve el periodo
        :return: periodo
        """
        return self.parser.get_value("EMILIQHIS", "periodo")

    @property
    def ordenamiento(self):
        """
        Devuelve el ordenamiento
        :return: ordenamiento
        """
        return self.parser.get_value("EMILIQHIS", "ordenamiento")
