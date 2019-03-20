from expert.catalogs import mapa_de_items_liquidacion_catalog
from scriptize.components.page_element import PageObjects


class MapaItemsLiquidacionPage(PageObjects):
    """
    La clase 'MapaItemsCrearPage' es responsable de la interacción con los componentes de Crear Mapa de Items dentro de Ficha del Colaborador
    """

    def get_haberes_sueldo_base(self):
        """
        Obtiene el monto de sueldo base
        """
        table = self.table.get_table_lines(mapa_de_items_liquidacion_catalog.TABLE_LIQUIDACION, True)
        monto = self.table.get_column_text(table[0], 9)
        return int(monto.replace(".", "").strip())
