from expert.catalogs import de_items_catalog
from scriptize.components.page_element import PageObjects


class ItemPage(PageObjects):
    """
    La clase 'ItemPage' es reponsable de la interacción con los componentes en la pagina Mapa de Ítems
    """

    def click_boton_liquidaciones(self):
        """
        Presiona el boton de liquidaciones para desplegar los subs-menus
        """
        self.button.click(de_items_catalog.BOTON_LIQUIDACIONES)

    def click_mapa_items(self):
        """
        Permite ir a la ventana de mapa de items
        """
        self.button.click(de_items_catalog.BOTON_MAPA_DE_ITEMS)

    def click_campo_descripcion(self):
        """
        Da click en campo descripción
        """
        self.button.click(de_items_catalog.CAMPO_DESCRIPCION)

    def click_crear_item(self):
        """
        Permite ingresar a la ventana para craar un item
        """
        self.button.click(de_items_catalog.BOTON_CREAR_ITEM)

    def click_boton_buscar(self):
        """
        Permite buscar un colaborador
        """
        self.button.click(de_items_catalog.BOTON_BUSCAR)
