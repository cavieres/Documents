from expert.catalogs import liquidacion_prueba_catalog
from scriptize.components.page_element import PageObjects


class LiquidacionPruebaPage(PageObjects):
    """
    La clase 'LiquidacionPruebaPage' es reponsable por la interacción con los componentes de la página de
    Liquidación de Prueba
    """

    def get_monto(self):
        """
        Obtiene el valor en el campo Monto a Pagar
        """
        return self.input.get_text(liquidacion_prueba_catalog.S_MONTO)
