import os

from scriptize.utils.cfg_parser import Parser


class ColaboradorData:
    """
    ColaboradorData es el objeto que contiene datos de empleados para pruebas.
    """

    def __init__(self):
        self.parser = Parser()
        self.parser.read(os.path.join(os.path.abspath(os.path.dirname(__file__)), 'datos_colaborador.ini'))

    @property
    def employee1(self):
        """
        Devuelve el código de un empleado
        :return: employee1
        """
        return self.parser.get_value("COLABORADOR", "employee1")

    @property
    def estado1(self):
        """
        Devuelve el estado de un empleado
        :return: estado1
        """
        return self.parser.get_value("COLABORADOR", "estado1")

    @property
    def monto(self):
        """
        Devuelve el monto a pagar correspondiente a un empleado
        :return: monto
        """
        return self.parser.get_value("COLABORADOR", "monto")

    @property
    def fechadoc(self):
        """
        Devuelve la Fecha de Documento
        :return: fechadoc
        """
        return self.parser.get_value("COLABORADOR", "fechadoc")

    @property
    def fecharet(self):
        """
        Devuelve la Fecha de Retiro
        :return: fecharet
        """
        return self.parser.get_value("COLABORADOR", "fecharet")

    @property
    def motivo(self):
        """
        Devuelve la Motivo de Retiro
        :return: motivo
        """
        return self.parser.get_value("COLABORADOR", "motivo")

    @property
    def firma(self):
        """
        Devuelve firmante de finiquito
        :return: firma
        """
        return self.parser.get_value("COLABORADOR", "firma")

    @property
    def observacion(self):
        """
        Devuelve Observaciones
        :return: Observacion
        """
        return self.parser.get_value("COLABORADOR", "observacion")

    @property
    def monto_finiquito(self):
        """
        Devuelve Monto Finiquito a pagar
        :return: Monto a pagar
        """
        return self.parser.get_value("COLABORADOR", "monto_finiquito")
