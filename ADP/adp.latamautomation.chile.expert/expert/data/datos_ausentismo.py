import os

from scriptize.utils.cfg_parser import Parser


class Ausentismo:
    """
    Ausentismo es el objeto que contiene los datos necesarios para realizar prueba de ausentismos
    """

    def __init__(self):
        self.parser = Parser()
        self.parser.read(
            os.path.join(os.path.abspath(os.path.dirname(__file__)), 'datos_ausentismo.ini'))

    @property
    def cant_dias(self):
        """
        Devuelve cantidad de días
        :return: cant_dias
        """
        return self.parser.get_value("AUSENTISMO", "cant_dias")

    @property
    def me_dia(self):
        """
        Devuelve medios dias
        :return: me_dia
        """
        return self.parser.get_value("AUSENTISMO", "me_dia")

    @property
    def causa(self):
        """
        Devuelve causal
        :return: causa
        """
        return self.parser.get_value("AUSENTISMO", "causa")

    @property
    def detalle(self):
        """
        Devuelve detalle adicional
        :return: detalle
        """
        return self.parser.get_value("AUSENTISMO", "detalle")

    @property
    def afe_remu(self):
        """
        Devuelve afecta remuneracion
        :return: afe_remu
        """
        return self.parser.get_value("AUSENTISMO", "afe_remu")

    @property
    def es_con(self):
        """
        Devuelve es continuacion
        :return: es_con
        """
        return self.parser.get_value("AUSENTISMO", "es_con")
