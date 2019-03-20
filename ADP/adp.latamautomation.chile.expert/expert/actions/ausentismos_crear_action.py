from expert.pages.ausentismos_crear_page import AusentismosCrearPage
from expert.pages.loadings_page import LoadingsPage
from scriptize.report import report


class AusentismosCrearAction:
    """
    La clase AusentismosCrearAction agrupa funcionalidades del modal Crear Ausentismos
    """

    def __init__(self):
        self.ausentismos_crear_page = AusentismosCrearPage()
        self.load = LoadingsPage()

    def set_datos_del_ausentismo(self, numero1, tipo, fecha_ini_lic, cant_dias, me_dia, causa, detalle, afe_remu,
                                 es_con):
        """
        Ingresa datos en la pestaña 'Datos del ausentismo'
        :param numero1: primer campo 'Número'
        :param tipo: tipo licencia
        :param fecha_ini_lic: Fecha inicio de licencia
        :param cant_dias: Cantidad de dias
        :param me_dia: Medios dias SINO
        :param causal: Causal
        :param detalle: Detalle adicional
        :param afe_remu: Afecta remuneracion SINO
        :param es_con: Es continuacion SINO
        """
        self.ausentismos_crear_page.set_numero1(numero1)
        self.ausentismos_crear_page.select_tipo_licencia(tipo)
        self.load.wait_spinner_disappear()
        self.ausentismos_crear_page.set_fecha_inicio_licencia(fecha_ini_lic)
        self.load.wait_spinner_disappear()
        self.ausentismos_crear_page.set_fecha_inicio_aplicacion(fecha_ini_lic)
        self.load.wait_spinner_disappear()
        self.ausentismos_crear_page.set_cantidad_dias(cant_dias)
        self.load.wait_spinner_disappear()
        self.ausentismos_crear_page.select_medios_dias(me_dia)
        self.ausentismos_crear_page.select_causal(causa)
        self.ausentismos_crear_page.set_detalle_adicional(detalle)
        self.ausentismos_crear_page.select_afecta_remuneracion(afe_remu)
        self.ausentismos_crear_page.select_es_continuacion(es_con)
        self.ausentismos_crear_page.set_fecha_inicio_secuencia(fecha_ini_lic)
        report.write_line("Ingreso de datos: {0}".format(tipo), report.Status.SUCCESS, True)

    def click_ok_and_check(self):
        """
        Verifica que no existen alertas de validacion luego de presionar OK
        :return: True or False
        """
        self.ausentismos_crear_page.click_ok()
        self.load.wait_spinner_disappear()
        return self.ausentismos_crear_page.check_alert()

    def set_especificos_licencia(self, diag_code, rut_pro, nombre, espe_code, dia_ex_con):
        """
        Ingresa datos en la pestaña 'Específicos Licencia'
        :param diag_code: Código diagnóstico
        :param rut_pro: Rut del profesional
        :param nombre: Nombre del profesional
        :param espe_code: Código especialidad
        :param dia_ex_con: Días extras a considerar
        """
        self.ausentismos_crear_page.set_diagnostico(diag_code)
        self.ausentismos_crear_page.set_rut_profesional(rut_pro)
        self.ausentismos_crear_page.set_nombre_profesional(nombre)
        self.ausentismos_crear_page.set_especialidad(espe_code)
        self.ausentismos_crear_page.set_dias_extras_considerar(dia_ex_con)
