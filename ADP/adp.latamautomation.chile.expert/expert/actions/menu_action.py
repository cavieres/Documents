from scriptize.report import report

from expert.pages.menu_page import MenuPage


class MenuAction:
    """
    La clase MenuAction es responsable de agrupar funcionalidades del menú principal
    """

    def __init__(self):
        self.menu_page = MenuPage()

    def click_resumen_del_proceso(self):
        """
        Navegación a Resumen del Proceso
        """
        self.menu_page.click_inicio()
        self.menu_page.click_informes()
        self.menu_page.click_basicos()
        self.menu_page.click_resumen_del_proceso()
        report.write_line("Navegar a Resumen del Proceso.", report.Status.SUCCESS, True)

    def click_emision_de_liquidaciones(self):
        """
        Navegación a Emisión de Liquidaciones
        """
        self.menu_page.click_inicio()
        self.menu_page.click_procesos()
        self.menu_page.click_emision_de_liquidaciones()
        report.write_line("Navegar a Emisión de Liquidaciones.", report.Status.SUCCESS, True)

    def click_ficha_colaborador(self):
        """
        Navegación a la Ficha del Colaborador
        """
        self.menu_page.click_inicio()
        self.menu_page.click_mantencion()
        self.menu_page.click_ficha_colaborador()
        self.menu_page.wait_for_load_page()
        report.write_line("Navegando a la Ficha del Colaborador.", report.Status.SUCCESS, True)

    def click_de_items(self):
        """
        Navegación hasta el menu de items
        """
        self.menu_page.click_inicio()
        self.menu_page.click_mantencion()
        self.menu_page.click_de_items()

    def click_libro_remuneraciones(self):
        """
        Navegación al Libro de Remuneraciones
        """
        report.write_line("Abrir pantalla Libro de Remuneraciones.", report.Status.INFO, True)

        self.menu_page.click_inicio()
        self.menu_page.click_informes()
        self.menu_page.click_informes_legales()
        self.menu_page.click_libro_remuneraciones()
        
        report.write_line("Navegando al Libro de Remuneraciones.", report.Status.SUCCESS, True)

    def click_emision_liquidacion_historicas(self):
        """
        Navegación a emision liquidacion historicas
        """
        self.menu_page.click_inicio()
        self.menu_page.click_procesos()
        self.menu_page.click_emision_liquidacion_historicas()
        report.write_line("Navegando a Emisión Liquidaciones Históricas.", report.Status.SUCCESS, True)

    def click_mantencion_indices(self):
        """
        Navegación a la Mantención de Índices
        """
        self.menu_page.click_inicio()
        self.menu_page.click_mantencion()
        self.menu_page.click_otras()
        self.menu_page.click_de_indices()
        report.write_line("Navegando a la Mantención de índices.", report.Status.SUCCESS, True)

    def click_finiquitos_masivos(self):
        """
        Navegación a Finiquitos Masivos
        """
        self.menu_page.click_inicio()
        self.menu_page.click_informes()
        self.menu_page.click_informes_legales()
        self.menu_page.click_finiquitos_masivos()
        report.write_line("Navegando a Finiquitos Masivos.", report.Status.SUCCESS, True)

    def click_ingreso_masivo_campos(self):
        """
        Navegación a Ingreso Masivo de Campos
        """
        self.menu_page.click_inicio()
        self.menu_page.click_ingresos()
        self.menu_page.click_ingreso_masivo_campos()
        report.write_line("Navegando a Ingreso Masivo de Campos.", report.Status.SUCCESS, True)
