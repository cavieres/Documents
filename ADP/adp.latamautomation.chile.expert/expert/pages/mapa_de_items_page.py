from expert.catalogs import mapa_de_items_catalog
from scriptize.components.page_element import PageObjects
from scriptize.components.keys import Keys


class MapaItemsPage(PageObjects):
    """
    La clase 'MapaItemsPage' es responsable de la interacción con los componentes de Mapa de Items dentro de Ficha del Colaborador
    """

    def set_descripcion(self, desc):
        """
        Ingresa tecto en input descripcion
        """
        self.input.fill(mapa_de_items_catalog.INPUT_DESCRIPCION, desc)
        Keys.press_enter(mapa_de_items_catalog.INPUT_DESCRIPCION)

    def click_borrar(self):
        """
        Presiona boton borrar item
        """
        if self.button.wait_for_element_to_be_clickable(mapa_de_items_catalog.BUTTON_DELETE, 3):
            self.button.click(mapa_de_items_catalog.BUTTON_DELETE)

    def click_crear(self):
        """
        Presiona boton crear item
        """
        self.button.click(mapa_de_items_catalog.BUTTON_CREAR)

    def click_liquidacion(self):
        """
        Presiona boton liquidacion
        """
        self.button.click(mapa_de_items_catalog.BUTTON_LIQUIDACION)
