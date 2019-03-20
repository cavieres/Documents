from scriptize.report import report
from scriptize.utils.file import File

from expert.actions.buscar_colaborador_action import BuscarColaboradorAction
from expert.actions.ficha_colaborador_action import FichaColaboradorAction
from expert.actions.menu_action import MenuAction
from expert.pages.ficha_colaborador_page import FichaColaboradorPage
from expert.pages.loadings_page import LoadingsPage
from expert.pages.vacaciones_page import VacacionesPage


class VacacionesAction:
    """
    La clase VacacionesAction agrupa funcionalidades del modal Vacaciones
    Mantención > Ficha del Colaborador > Ausentismo > Vacaciones
    """

    def __init__(self):
        self.vacaciones_page = VacacionesPage()
        self.loadings_page = LoadingsPage()
        self.menu_action = MenuAction()
        self.buscar_colaborador_action = BuscarColaboradorAction()
        self.ficha_colaborador_action = FichaColaboradorAction()
        self.ficha_colaborador_page = FichaColaboradorPage()
        self.fecha_desde = None
        self.fecha_hasta = None
        self.cant_dias = None
        self.tipc = None
        self.lineas_tabla = None

    def pagina_esta_cargada(self):
        """
        Valida si pagina 'Vacaciones' está cargada
        :return: True si está cargada False sino
        """
        report.write_line("Valida si pagina Vacaciones está cargada")
        esta_cargada = self.vacaciones_page.esta_presente_calcular_vacaciones_a_fecha() and \
                       self.vacaciones_page.esta_presente_anuales() and \
                       self.vacaciones_page.esta_presente_proporcionales() and \
                       self.vacaciones_page.esta_presente_progresivos() and \
                       self.vacaciones_page.esta_presente_adicionales()

        if esta_cargada:
            report.write_line("Pagina 'Vacaciones' cargada con éxito! \o/", report.Status.SUCCESS, True)
        else:
            report.write_line("Pagina 'Vacaciones' cargada sin éxito! :(", report.Status.DANGER, True)

        return esta_cargada

    def navega(self):
        """
        Navegación a Vacaciones
        """
        report.write_line("Navegación a Vacaciones")
        try:
            self.ficha_colaborador_page.click_ausentismo()
            self.ficha_colaborador_page.wait_for_load_page()
            self.ficha_colaborador_page.click_vacaciones()
            self.ficha_colaborador_page.wait_for_load_page()
            if self.pagina_esta_cargada():
                report.write_line("La pantalla de Vacaciones fue cargada con éxito! \o/", report.Status.SUCCESS)
            else:
                report.write_line("Intentando navegar a Vacaciones otra vez...")
                self.navega()
        except Exception as e:
            report.write_line("Intentando navegar hasta Vacaciones otra vez... erro [{}]".format(str(e)),
                              report.Status.DANGER, True)
            self.navega()

    def busca_colaborador(self, codigo: str, rut: str, estado: str, nombre: str):
        """
        Busca colaborador para tomar días de vacaciones.
        :param codigo: código
        :param rut: rut
        :param estado: estado
        :param nombre: nombre
        """
        self.menu_action.click_ficha_colaborador()
        self.buscar_colaborador_action.busca(codigo, rut, estado, nombre)
        self.navega()

    def valida(self, fecha_desde: str, fecha_hasta: str, cant_dias: str, tipc: str, rebaja: str):
        """
        Comprueba vacación
        :param fecha_desde: fecha de inicio de vacaciones
        :param fecha_hasta: fecha de termino de vacaciones
        :param cant_dias: cantidad de días de vacaciones
        :param tipc: rebaja de (V, P, A, C)
        :param rebaja: rebaja de vacaiones
        :return: True si vacación exitosa False sino
        """
        report.write_line("Comprueba Vacación con rebaja de {}".format(rebaja))
        self.pagina_esta_cargada()
        self.fecha_desde = self.vacaciones_page.get_desde()
        self.fecha_hasta = self.vacaciones_page.get_hasta()
        self.cant_dias = self.vacaciones_page.get_dias()
        self.tipc = self.vacaciones_page.get_tipc()

        vacacion_exitosa = self.fecha_desde == fecha_desde and self.fecha_hasta == fecha_hasta and \
                           self.cant_dias == cant_dias and self.tipc == tipc

        if vacacion_exitosa:
            report.write_line(
                "Vacación exitosa! Fecha Desde [{}] | Fecha Hasta [{}] | Cantidad dias [{}] | TIPC [{}].".format(
                    self.fecha_desde,
                    self.fecha_hasta,
                    self.cant_dias,
                    self.tipc),
                report.Status.SUCCESS, True)
        else:
            report.write_line(
                "Vacación no exitosa! Fecha Desde [{}] [{}] | Fecha Hasta [{}] [{}] | Cantidad dias [{}] [{}] | "
                "TIPC [{}] [{}].".format(
                    self.fecha_desde, fecha_desde,
                    self.fecha_hasta, fecha_hasta,
                    self.cant_dias, cant_dias,
                    self.tipc, tipc
                ),
                report.Status.DANGER, True)
        return vacacion_exitosa

    def elimina_todos_dias_tomados(self):
        """
        Elimina todos los días tomados del colaborador
        """
        report.write_line("Elimina todos los días tomados del colaborador.")
        self.pagina_esta_cargada()
        if self.hay_dias_tomados_para_eliminar():
            self.lineas_tabla = self.vacaciones_page.get_todos_dias_tomados()
            for i in range(0, len(self.lineas_tabla)):
                tabla = self.vacaciones_page.get_todos_dias_tomados()
                linea = tabla[i]
                self.vacaciones_page.wait_for_load_page()
                self.vacaciones_page.elemina_registro_dia_tomado(linea)
                self.vacaciones_page.confirma_alerta()
                self.vacaciones_page.wait_for_load_page()
                self.loadings_page.wait_spinner_disappear()

    def hay_dias_tomados_para_eliminar(self):
        """
        Valida si hay días tomados para eliminar
        :return: True si hay días tomados para eliminar False sino
        """
        report.write_line("Valida si hay días tomados para eliminar.")
        mensaje_no_hay_vacaciones = "No hay vacaciones tomadas..."
        self.lineas_tabla = self.vacaciones_page.get_todos_dias_tomados()
        hay_dias_para_eliminar = self.lineas_tabla[0].text != mensaje_no_hay_vacaciones
        if hay_dias_para_eliminar:
            report.write_line("Hay vacaciones tomadas para eliminar", report.Status.SUCCESS, True)
        else:
            report.write_line("No hay vacaciones tomadas para eliminar", report.Status.SUCCESS, True)
        return hay_dias_para_eliminar

    def imprime_registros(self, camino_carpeta: str, tiempo_espera: int = 60) -> list:
        """
        Imprime registros de vacaciones
        :param camino_carpeta: camino de la carpeta que los archivos son descargados
        :param tiempo_espera: tiempo para esperar el archivo descargar
        :return: lista de los archivos que estan en la carpeta de descarga
        """
        report.write_line("Imprime registros de vacaciones.")
        extension_archivo = "pdf"
        self.vacaciones_page.click_imprimir()
        lista_archivos = File.find_files_by_extension(camino_carpeta, extension_archivo, tiempo_espera)
        if lista_archivos:
            report.write_line("Hay registros de vacaciones impresos! Registros {{}}".format(lista_archivos))
        else:
            report.write_line("No hay registros de vacaciones impresos!", report.Status.DANGER, True)
        return lista_archivos
