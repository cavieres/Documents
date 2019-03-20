from expert.pages.mapa_de_items_crear_page import MapaItemsCrearPage
from expert.pages.loadings_page import LoadingsPage
from scriptize.report import report


class MapaItemsCrearAction:
    """
    La clase MapaItemsCrearAction agrupa funcionalidades del modal Mapa de Items Crear dentro de Ficha de colaborador.
    """

    def __init__(self):
        self.mapa_items_crear_page = MapaItemsCrearPage()
        self.loadings_page = LoadingsPage()

    def crear_item(self, code, value):
        """
        Crea nuevo item
        """
        report.write_line("Crea nuevo item.")
        self.mapa_items_crear_page.set_codigo_item(code)
        self.mapa_items_crear_page.set_valor(value)
        report.write_line("Nuevo item creado con exito.", report.Status.SUCCESS, True)
        self.mapa_items_crear_page.click_ok()
        self.loadings_page.wait_spinner_disappear()
