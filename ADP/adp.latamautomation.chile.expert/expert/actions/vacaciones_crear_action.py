import os

from scriptize.report import report
from scriptize.utils.file import File

from expert.pages.buscar_colaborador_page import BuscarColaboradorPage
from expert.pages.emision_liquidacion_historicas_page import EmisionLiquidacionHistoricasPage
from expert.pages.vacaciones_crear_page import VacacionesCrearPage
from expert.pages.vacaciones_page import VacacionesPage


class VacacionesCrearAction:
    """
    La clase VacacionesCrearAction agrupa funcionalidades del modal Crear Vacaciones
    Mantención > Ficha del Colaborador > Ausentismo > Vacaciones
    """

    def __init__(self):
        self.vacaciones_crear_page = VacacionesCrearPage()
        self.buscar_colaborador_page = BuscarColaboradorPage()
        self.emision_liquidacion_historicas_page = EmisionLiquidacionHistoricasPage()
        self.vacaciones_page = VacacionesPage()
        self.fecha_inial = None
        self.dias_de_vacaciones = None
        self.fecha_final = None
        self.fecha_retorno = None
        self.REBAJAS_DE_DIAS_NORMALES = "V"
        self.REBAJAS_DE_PROGRESIVOS = "P"
        self.REBAJAS_DE_ADICIONALES = "A"
        self.REBAJAS_DE_DIAS_BASE = "C"

    def pagina_esta_cargarda(self):
        """
        Valida si pagina 'Creación de Vacaiones' está cargada
        :return: True si está cargada False sino
        """
        report.write_line("Valida si pagina 'Creación de Vacaciones' está cargada.")
        esta_cargada = self.vacaciones_crear_page.esta_presente_fecha_inicial() and self.vacaciones_crear_page. \
            esta_presente_dias_de_vacaciones() and self.vacaciones_crear_page.esta_rebajas_de_dias_normales()

        if esta_cargada:
            report.write_line("Pagina 'Creación de Vacaciones' cargada con éxito! \o/", report.Status.SUCCESS, True)
        else:
            report.write_line("Pagina 'Creación de Vacaciones' cargada sin éxito! :(", report.Status.DANGER, True)

        return esta_cargada

    def crear(self, fecha: str, ndias: str, tipc: str, camino_carpeta: str, rebaja: str,
              tiempo_espera: int = 60) -> tuple:
        """
        Ingresa datos en la pantalla de creación de vacaciones
        :param fecha: fecha de inicio de las vacaciones
        :param ndias: cantidad de días de vacaciones
        :param tipc: rebajas de (V, P, A, C)
        :param camino_carpeta: la direccion en la cual se descargó el archivo
        :param rebaja: rebaja de vacaiones
        :param tiempo_espera: tiempo para esperar el archivo descargar
        :return: fecha final y nombre comprobante vacaciones
        """
        report.write_line("Ingresa datos en la pantalla de creación de vacaciones.")
        self.fecha_inial = None
        self.dias_de_vacaciones = None
        self.fecha_final = None
        self.fecha_retorno = None
        extension_archivo = "pdf"
        nombre_comprobante = None

        self.vacaciones_page.esta_presente_calcular_vacaciones_a_fecha()
        self.vacaciones_page.click_crear()
        if self.pagina_esta_cargarda():
            report.write_line("Creando una nueva solicitud de vacaciones de [{}] con [{}] días y tipc [{}]".
                              format(rebaja, ndias, tipc))

            self.vacaciones_crear_page.click_unidad_dias()

            if tipc == self.REBAJAS_DE_DIAS_NORMALES:
                self.vacaciones_crear_page.click_rebajas_de_dias_normales()
            elif tipc == self.REBAJAS_DE_PROGRESIVOS:
                self.vacaciones_crear_page.click_rebajas_de_progresivos()
            elif tipc == self.REBAJAS_DE_ADICIONALES:
                self.vacaciones_crear_page.click_rebajas_de_adicionales()
            elif tipc == self.REBAJAS_DE_DIAS_BASE:
                self.vacaciones_crear_page.click_rebajas_de_dias_base()

            self.vacaciones_crear_page.set_fecha_inicial(fecha)
            self.vacaciones_crear_page.set_dias_de_vacaciones(ndias)
            self.vacaciones_crear_page.pulse_la_tecla_tab()
            self.vacaciones_crear_page.pulse_la_tecla_tab()
            self.vacaciones_crear_page.espera_fecha_retorno_actualizar()
            self.fecha_inial = self.vacaciones_crear_page.get_fecha_inicial()
            self.dias_de_vacaciones = self.vacaciones_crear_page.get_dias()
            self.fecha_final = self.vacaciones_crear_page.get_fecha_final()
            self.fecha_retorno = self.vacaciones_crear_page.get_fecha_retorno()

            report.write_line(
                "Formulario completado antes de grabar! Rebajas de [{}] Fecha Inicial [{}], Días de Vacaciones [{}], "
                "Fecha Final [{}] y Fecha Retorno [{}]".format(tipc, self.fecha_inial, self.dias_de_vacaciones,
                                                               self.fecha_final, self.fecha_retorno),
                report.Status.SUCCESS,
                True)
            self.vacaciones_crear_page.click_boton_ok()
            mensaje_validacion = self.vacaciones_crear_page.get_mensaje_validacion()
            if mensaje_validacion != '':
                report.write_line("Mensaje de validación [{}].".format(mensaje_validacion), report.Status.DANGER, True)
                raise ValueError(mensaje_validacion)
            else:
                report.write_line("No hay mensajes de validaciones!", report.Status.SUCCESS, True)
            comprobantes = File.find_files_by_extension(camino_carpeta, extension_archivo, tiempo_espera)

            report.write_line("Lista de comprobantes de vacaciones impresos [{}] en la carperta [{}]."
                              .format(comprobantes, camino_carpeta))
            if comprobantes:
                report.write_line("Hay comprobantes de vacaciones impresos [{}]...".format(comprobantes))
                if len(comprobantes) > 1:
                    raise ValueError("Hay más do que un comprobante de vacaciones impresos en la carpeta de descarga.")
                else:
                    report.write_line("Hay solo uno comprobante de vacación impreso! Creo que debe ser él! :)")
                    nombre_comprobante = comprobantes[0]
            else:
                report.write_line("No hay comprobantes de vaciones impresos! Creo que tu prueba va fallar... :(",
                                  report.Status.DANGER)
            self.vacaciones_crear_page.click_boton_volver()
            return self.fecha_final, nombre_comprobante
        else:
            report.write_line("Intentando acceder novamente la pagina de 'Creación de Vacaciones'.",
                              report.Status.DANGER)
            self.crear(fecha, ndias, tipc, camino_carpeta, rebaja, tiempo_espera)

    def comprobar_descarga(self, camino_carpeta: str, nombre_comprobante: str):
        """
        Comprueba la descarga del archivo
        :param camino_carpeta: la direccion en la cual se descargó el archivo
        :param nombre_comprobante: nombre del comprovante de vaciones
        :return: True si encuentra el archivo . False sino
        """
        report.write_line("Comprueba la descarga del archivo.")
        camino_y_comprobante = os.path.join(camino_carpeta + nombre_comprobante)
        report.write_line("Comprobando si encuentra el archivo en el camino [{}]...".format(camino_y_comprobante))
        tiene_archivo = File.exists(camino_y_comprobante)
        if tiene_archivo:
            report.write_line("Descarga de comprobante [{}] exitosa.".format(nombre_comprobante), report.Status.SUCCESS)
        else:
            report.write_line("Descarga de comprobante [{}] fallida".format(nombre_comprobante), report.Status.WARNING)
        os.remove(camino_y_comprobante)
        return tiene_archivo
