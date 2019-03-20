import time

from expert.actions.menu_action import MenuAction
from expert.pages.ficha_colaborador_page import FichaColaboradorPage
from scriptize.report import report


class FichaColaboradorAction:
    """"
    La clase FichaColaboradorAction agrupa las micro acciones de la Ficha del Colaborador.
    """

    def __init__(self):
        self.ficha_colaborador_page = FichaColaboradorPage()
        self.menu_action = MenuAction()

    def navega_liquidacion_prueba(self):
        """
        Navegación a la Liquidación de Prueba.
        """
        self.ficha_colaborador_page.click_liquidaciones()
        self.ficha_colaborador_page.click_liquidacion_prueba()
        report.write_line("Navegación a la Liquidación...", report.Status.SUCCESS, True)

    def navega_finiquitos(self):
        """
        Navegación al Finiquito Individual.
        """
        report.write_line("Navegación al Finiquito Individual.")
        self.ficha_colaborador_page.click_legales()
        self.ficha_colaborador_page.click_finiquitos()
        report.write_line("Navegación al Finiquito Individual realizada con exito.", report.Status.SUCCESS, True)

    def navega_ausentismo(self):
        """
        Navegación a Ausentismo
        """
        report.write_line("Navegación a Ausentismo")
        self.ficha_colaborador_page.click_ausentismo()
        self.ficha_colaborador_page.wait_for_load_page()
        time.sleep(2)
        self.ficha_colaborador_page.click_licencias_permisos()
        report.write_line("Navegación a Ausentismo realizada con exito.", report.Status.SUCCESS, True)

    def navega_liquidaciones_historicas(self):
        """
        Navegación al submenu Liquidaciones Historicas.
        """
        report.write_line("Navegación al submenu Liquidaciones Historicas.")
        self.ficha_colaborador_page.wait_for_load_page()
        self.menu_action.click_ficha_colaborador()
        self.ficha_colaborador_page.click_liquidaciones()
        self.ficha_colaborador_page.wait_for_load_page()
        self.ficha_colaborador_page.click_liquidaciones_historicas()
        report.write_line("Navegación al submenu Liquidaciones Historicas realizada con exito.", report.Status.SUCCESS,
                          True)

    def buscar_colaborador_por_nombre(self, nombre_colaborador):
        """
        Navegación por la Ficha del Colaborador y botón Buscar
        """
        report.write_line("Navegación por la Ficha del Colaborador y botón Buscar.")
        self.menu_action.click_ficha_colaborador()
        self.ficha_colaborador_page.click_buscar()
        self.ficha_colaborador_page.set_campo_nombre_buscar(nombre_colaborador)
        self.ficha_colaborador_page.set_campo_codigo_buscar("")
        self.ficha_colaborador_page.click_primer_colaborador_buscar()
        report.write_line("Navegación por la Ficha del Colaborador realizada con exito.", report.Status.SUCCESS, True)

    def click_inf_personal(self):
        """
        Accede a Información Personal
        """
        report.write_line("Accede a Información Personal.")
        self.menu_action.click_ficha_colaborador()
        self.ficha_colaborador_page.wait_for_load_page()
        self.ficha_colaborador_page.click_inf_personal()
        report.write_line("Navegación a Información Personal realizada con exito.", report.Status.SUCCESS, True)

    def navega_mapa_items(self):
        """
        Navegación al submenu Mapa de Items
        """
        report.write_line("Navegación al submenu Mapa de Items.")
        self.ficha_colaborador_page.wait_for_load_page()
        self.ficha_colaborador_page.click_liquidaciones()
        self.ficha_colaborador_page.click_mapa_de_items()
        report.write_line("Navegación al submenu Mapa de Items realizada con exito.", report.Status.SUCCESS, True)

    def buscar_colaborador_por_rut(self, rut_colaborador):
        """
        Navegación por la Ficha del Colaborador y botón Buscar
        :param rut_colaborador: Corresponde al rut del colaborador
        """
        report.write_line("Navegación por la Ficha del Colaborador y botón Buscar.")
        self.menu_action.click_ficha_colaborador()
        self.ficha_colaborador_page.click_buscar()
        self.ficha_colaborador_page.set_campo_nombre_buscar(rut_colaborador)
        self.ficha_colaborador_page.set_campo_codigo_buscar("")
        self.ficha_colaborador_page.click_primer_colaborador_buscar()
        report.write_line("Ficha del Colaborador cargada con exito.", report.Status.SUCCESS, True)

    def esta_cargada_ventana_informacion_personal(self):
        """
        Valida si la página está cargada
        :return: TRUE si está cargada y FALSE si no está cargada
        """
        report.write_line("Valida si la página Ventana Información Personal está cargada.")
        return self.ficha_colaborador_page.campo_rut_esta_cargado_inf_personal() and self.ficha_colaborador_page. \
            campo_telefono_esta_cargado_inf_personal() and self.ficha_colaborador_page.\
            boton_actualizar_esta_cargado_inf_personal()
