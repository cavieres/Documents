from scriptize.report import report
from expert.pages.de_items_page import ItemPage


class ItemAction:
    """
     La clase ItemAction se encarga de agrupar las acciones en la pagina Mapa de Items
    """

    def __init__(self):
        self.de_items_page = ItemPage()

    def flujo_mapa_items_(self):
        report.write_line("Ventana Mapa de Items")
        self.de_items_page.click_boton_liquidaciones()
        self.de_items_page.click_mapa_items()
        self.de_items_page.click_campo_descripcion()
        self.de_items_page.click_crear_item()
        self.de_items_page.click_boton_buscar()
