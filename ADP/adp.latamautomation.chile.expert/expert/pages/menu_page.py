from datetime import datetime

from expert.catalogs import menu_catalog
from scriptize.components.page_element import PageObjects


class MenuPage(PageObjects):
    """
    La clase 'MenuPage' es responsable de la interacción con los componentes del menú principal
    """

    def click_inicio(self):
        """
        Click en Inicio en el menú principal
        """
        self.button.click(menu_catalog.M01_INICIO)

    def click_sistema(self):
        """
        Click en Sistema en el menú principal
        """
        self.button.click(menu_catalog.M02_SISTEMA)

    def click_mantencion(self):
        """
        Click en Mantención en el menú principal
        """
        self.button.click(menu_catalog.M03_MANTENCION)

    def click_ficha_colaborador(self):
        """
        Click en Ficha del Colaborador en el menú Mantención
        """
        self.button.click(menu_catalog.M0301_FICHA_DEL_COLABORADOR)

    def click_otras(self):
        """
        Click en Sub menú Otras
        """
        self.button.click(menu_catalog.M0315_OTRAS)

    def click_de_indices(self):
        """
        Click en Mantención de Índices
        """
        self.button.click(menu_catalog.M031505_DE_INDICES)

    def click_ingresos(self):
        """
        Click en Ingresos en el menú principal
        """
        self.button.click(menu_catalog.M04_INGRESOS)

    def click_informes(self):
        """
        Click a Informes en el menú principal
        """
        self.button.click(menu_catalog.M05_INFORMES)

    def click_informes_legales(self):
        """
        Click en submenú Legales
        """
        self.button.click(menu_catalog.M0503_LEGALES)

    def click_finiquitos_masivos(self):
        """
        Click en Finiquitos Masivos
        """
        self.button.click(menu_catalog.M050306_FINIQUITOS_MASIVOS)

    def click_basicos(self):
        """
        Click en Básicos en el menú Informes
        """
        self.button.click(menu_catalog.M0501_BASICOS)

    def click_resumen_del_proceso(self):
        """
        Click en opción Resumen del Proceso
        """
        self.button.click(menu_catalog.M050102_RESUMEN_DEL_PROCESO)

    def click_items_por_colaborador(self):
        """
        Click en Items por Colaborador
        """
        self.button.click(menu_catalog.M050101_ITEMS_POR_COLABORADOR)

    def click_procesos(self):
        """
        Click en Procesos en el menú principal
        """
        self.button.click(menu_catalog.M06_PROCESOS)

    def click_emision_de_liquidaciones(self):
        """
        Click en opción Emisión de Liquidaciones
        """
        self.button.click(menu_catalog.M0601_EMISION_DE_LIQUIDACIONES)

    def click_portal_clientes(self):
        """
        Click en Portal Clientes en el menú principal
        """
        self.button.click(menu_catalog.M07_PORTAL_CLIENTES)

    def click_de_items(self):
        """
        Click en de_items en menu mantencion
        """
        self.button.click(menu_catalog.M0305_DE_ITEMS)

    def click_emision_liquidacion_historicas(self):
        """
        Navegación a emision de liquidacion historicas
        """
        self.button.click(menu_catalog.M0607_EMISION_DE_LIQUIDACIONES_HISTORICAS)

    def click_resumen_proceso(self):
        """
        Navegación a Resumen del Proceso
        """
        self.button.click(menu_catalog.M050102_RESUMEN_DEL_PROCESO)

    def click_libro_remuneraciones(self):
        """
        Click en Libro de Remuneraciones en el submenú Legales, del menú Informes.
        """
        self.button.click(menu_catalog.M050302_LIBRO_DE_REMUNERACIONES)

    def click_ingreso_masivo_campos(self):
        """
        Click en Ingreso Masivo de Campos del menú Ingresos.
        """
        self.button.click(menu_catalog.M0402_INGRESO_MASIVO_DE_CAMPOS)

    def get_ames(self):
        """
        Obtiene mes de proceso
        :return: datetime
        """
        return datetime.strptime(self.get_text(menu_catalog.B02_AMES), "%m/%Y")
