from expert.pages.menu_page import MenuPage
from expert.pages.solicitudes_page import SolicitudesPage
from scriptize.report import report


class SolicitudesAction:
    """"
    La clase SolicitudesAction agrupa funcionalidades de la página auto-consulta.
    """

    def __init__(self):
        self.solicitudes_page = SolicitudesPage()
        self.menu_page = MenuPage()
        self.estaTodoBien = False

    def go_liquidaciones(self):
        """
        Realiza la ejecuciageón de los elementos de auto-consulta
        """
        report.write_line("Ir a Liquidaciones", report.Status.SUCCESS, True)
        self.solicitudes_page.click_liquidaciones()

    def navega(self):
        """
        Navega a Solicitudes
        """
        self.menu_page.click_inicio()
        self.solicitudes_page.click_solicitudes()
        report.write_line("Navega a Solicitudes", report.Status.SUCCESS)

    def navega_opcion_revisar(self):
        """
        Navega a Solicitud Revisar
        """
        report.write_line("Navega a Solicitud Revisar")
        self.navega()
        if self.solicitudes_page.is_pagina_principal():
            self.solicitudes_page.click_revisar_solicitudes()
        else:
            self.navega_opcion_revisar()

    def navega_opcion_feriados(self):
        """
        Navega a Solicitud Feriados
        """
        self.navega()
        self.solicitudes_page.click_solicitar_feriados()
        report.write_line("Navega a Solicitud Feriados", report.Status.SUCCESS, True)

    def download_PDF(self):
        """
        Recorre los registros de la tabla LIQUIDACIONES y hace clic en icono PDF
        """
        linea = self.solicitudes_page.get_lineas_tabla()[0]
        self.solicitudes_page.click_pdf(linea)

    def elimina(self, tfecha_eliminar):
        """
        Elimina las solicitudes obsoletas
        :param tfecha_eliminar: Fecha actual
        """
        self.navega_opcion_revisar()
        self.solicitudes_page.click_eliminar_de_revisar_solicitudes()
        self.solicitudes_page.clear_fecha_tope_eliminacion()
        self.solicitudes_page.set_fecha_tope_eliminacion(tfecha_eliminar)
        self.solicitudes_page.click_ok_eliminar_solicitudes()
        report.write_line("Eliminar Solicitudes de Feriados Pendientes", report.Status.SUCCESS, True)

    def envia_feriados(self, tfecha, tcant_dias, tmotivo, tdia):
        """
        Envía los datos para registrar la solicitud
        :param tdate: Valor para campo Desde
        :param tcant_dias: Valor para campo Cant. días solicitados
        :param tmotivo: Valor para campo Motivo
        :param tdia: Nombre del día actual
        """
        self.navega_opcion_feriados()
        self.solicitudes_page.set_fecha_desde(tfecha)
        self.solicitudes_page.set_cantidad_dias(tcant_dias)
        self.solicitudes_page.set_motivo(tmotivo)
        report.write_line("Datos Solicitud de Feriados", report.Status.SUCCESS, True)
        self.solicitudes_page.click_enviar_solicitud()

        if tdia == "FRIDAY" or tdia == "VIERNES":
            self.solicitudes_page.click_aceptar_alerta()

        if self.solicitudes_page.is_pagina_principal():
            report.write_line("Envío de Datos para Solicitud de Feriados", report.Status.SUCCESS, True)
        else:
            report.write_line("Los datos de la solicitud no fueron registrados.", report.Status.DANGER, True)

    def valida(self, tipo, codigo, fecha, estado):
        """
        Valida la solicitud
        :param tipo: Corresponde al tipo
        :param codigo: Corresponde al código
        :param fecha: Corresponde a la fecha
        :param estado: Corresponde al estado
        :return:
        """
        report.write_line("Valida la solicitud")
        self.navega_opcion_revisar()
        self.estaTodoBien = (self.solicitudes_page.get_columna_tipo() == tipo) and \
                            (self.solicitudes_page.get_columna_codigo() == codigo) and \
                            (self.solicitudes_page.get_columna_fecha() == fecha) and \
                            (self.solicitudes_page.get_columna_estado() == estado)
        if self.estaTodoBien:
            report.write_line(
                "Solicitud {} Código {} con Fecha {} y Estado {} está todo bien".format(tipo, codigo, fecha, estado),
                report.Status.SUCCESS,
                True)
        else:
            report.write_line(
                "Solicitud {} Código {} con Fecha {} y Estado {} no está todo bien".format(tipo, codigo, fecha, estado),
                report.Status.DANGER,
                True)
        return self.estaTodoBien
