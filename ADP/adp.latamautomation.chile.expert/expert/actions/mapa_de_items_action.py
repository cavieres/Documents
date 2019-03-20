from expert.pages.mapa_de_items_page import MapaItemsPage
from expert.pages.loadings_page import LoadingsPage
from scriptize.report import report


class MapaItemsAction:
    """
    La clase MapaItemsAction agrupa funcionalidades de pantalla Mapa de Items dentro de Ficha de colaborador.
    """

    def __init__(self):
        self.page = MapaItemsPage()
        self.wait = LoadingsPage()

    def borrar_item(self, desc):
        """
        Borra item de acuerdo a la descripcion
        :return: True si se borra con exito, False sino
        """
        self.page.set_descripcion(desc)
        self.page.click_borrar()
        if self.page.alert.accept_alert():
            report.write_line("item eliminado", report.Status.SUCCESS, True)
        else:
            report.write_line("no fue posible eliminar el item", report.Status.WARNING, True)
