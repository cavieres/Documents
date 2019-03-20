from expert.catalogs import mapa_de_items_crear_catalog
from scriptize.components.page_element import PageObjects


class MapaItemsCrearPage(PageObjects):
    """
    La clase 'MapaItemsCrearPage' es responsable de la interacción con los componentes de Crear Mapa de Items dentro de Ficha del Colaborador
    """

    def set_codigo_item(self, code):
        """
        Ingresa tecto en input codigo de item
        """
        self.input.fill(mapa_de_items_crear_catalog.INPUT_CODIGO_ITEM, code)

    def set_valor(self, value):
        """
        Ingresa tecto en input valor
        """
        self.input.fill(mapa_de_items_crear_catalog.INPUT_VALOR, value)

    def click_ok(self):
        """
        Presiona boton OK
        """
        self.button.click(mapa_de_items_crear_catalog.BUTTON_OK)
