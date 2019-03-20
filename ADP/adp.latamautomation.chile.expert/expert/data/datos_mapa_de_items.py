import os

from scriptize.utils.cfg_parser import Parser


class MapaItems:
    """
    Mapa_Items es el objeto que contiene los datos necesarios para realizar prueba de mapa de items en la ficha del colaborador
    """

    def __init__(self):
        self.parser = Parser()
        self.parser.read(
            os.path.join(os.path.abspath(os.path.dirname(__file__)), 'datos_mapa_de_items.ini'))

    @property
    def item_descripcion(self):
        """
        Devuelve la descripcion del item
        :return: item_desc
        """
        return self.parser.get_value("MAPA_ITEMS", "item_desc")

    @property
    def item_codigo(self):
        """
        Devuelve codigo de item
        :return: item_code
        """
        return self.parser.get_value("MAPA_ITEMS", "item_code")
