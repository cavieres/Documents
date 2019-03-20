from expert.catalogs import ausentismos_crear_catalog
from scriptize.components.keys import Keys
from scriptize.components.page_element import PageObjects


class AusentismosCrearPage(PageObjects):
    """
    La clase 'AusentismosCrearPage' es responsable de la interacción con los componentes del modal Crear Ausentismos
    """

    def click_datos_del_ausentismo(self):
        """
        Presiona la pestaña 'Datos del Ausentismo'
        """
        self.button.click(ausentismos_crear_catalog.TAB_DATOS_AUSENTISMO)

    def set_numero1(self, n):
        """
        Ingresa información en primer campo 'Número'
        :param n: int
        """
        self.input.fill(ausentismos_crear_catalog.INPUT_NUMERO1, n)

    def set_numero2(self, n):
        """
        Ingresa información en segundo campo 'Número'
        :param n: int
        """
        self.input.fill(ausentismos_crear_catalog.INPUT_NUMERO2, n)

    def select_tipo_licencia(self, tipo):
        """
        Selecciona el tipo de licencia
        :param tipo: string
        """
        self.select.select_by_visible_text(ausentismos_crear_catalog.SELECT_TIPO_LIC, tipo)

    def set_fecha_inicio_licencia(self, fecha):
        """
        Ingresa fecha en campo 'Fecha inicio de Licencia'
        :param fecha: dd-mm-yyyy
        """
        self.input.fill(ausentismos_crear_catalog.INPUT_FECHA_INI_LIC, fecha)
        Keys.press_tab(ausentismos_crear_catalog.INPUT_FECHA_INI_LIC)

    def set_fecha_inicio_aplicacion(self, fecha):
        """
        Ingresa fecha en campo 'Fecha inicio de Aplicación', por defecto se copia la fecha ingresada en
        'Fecha inicio de Licencia'
        :param fecha: dd-mm-yyyy
        """
        self.input.fill(ausentismos_crear_catalog.INPUT_FECHA_INI_APLI, fecha)
        Keys.press_tab(ausentismos_crear_catalog.INPUT_FECHA_INI_APLI)

    def set_cantidad_dias(self, n):
        """
        Ingresa cantidad de días
        :param n: int
        """
        self.input.fill(ausentismos_crear_catalog.INPUT_CANT_DIAS, n)
        Keys.press_tab(ausentismos_crear_catalog.INPUT_CANT_DIAS)

    def select_medios_dias(self, sino):
        """
        Selecciona si aplica medios días o no
        :param sino: string 'Si' o 'No'
        """
        self.select.select_by_visible_text(ausentismos_crear_catalog.SELECT_MEDIOSDIAS, sino)

    def select_causal(self, causa):
        """
        Seleccion la causa de la licencia
        :param causa: string
        """
        try:
            self.select.select_by_visible_text(ausentismos_crear_catalog.SELECT_CAUSAL, causa)
        except:
            self.select.select_by_visible_text(ausentismos_crear_catalog.SELECT_CAUSAL, causa.upper())

    def set_detalle_adicional(self, detalle):
        """
        Ingresa detalle adicional a la licencia
        :param detalle:
        """
        self.input.fill(ausentismos_crear_catalog.INPUT_DETALLE, detalle)

    def select_afecta_remuneracion(self, sino):
        """
        Selecciona si afecta o no remuneración
        :param sino: string 'Si' o 'No'
        """
        self.select.select_by_visible_text(ausentismos_crear_catalog.SELECT_AFECTA_REMU, sino)

    def select_es_continuacion(self, sino):
        """
        Selecciona si es continuacion o no
        :param sino: string 'Si' o 'No'
        """
        self.select.select_by_visible_text(ausentismos_crear_catalog.SELECT_ESCONTINUA, sino)

    def set_fecha_inicio_secuencia(self, fecha):
        """
        Ingresa fecha en campo 'Fecha inicio de la secuencia'
        :param fecha: dd-mm-yyyy
        """
        self.input.fill(ausentismos_crear_catalog.INPUT_FECHA_INI_SEC, fecha)
        Keys.press_tab(ausentismos_crear_catalog.INPUT_FECHA_INI_SEC)

    def click_especificos_licencia(self):
        """
        Presiona la pestaña 'Especificos Licencia'
        """
        self.button.click(ausentismos_crear_catalog.TAB_ESPECI_LIC)

    def set_diagnostico(self, code):
        """
        Ingresa codigo de diagnóstico
        :param code: int
        """
        self.input.fill(ausentismos_crear_catalog.INPUT_DIAGNOS_CODE, code)

    def click_busca_diagnostico(self):
        """
        Abre buscador de diagnostico
        """
        self.button.click(ausentismos_crear_catalog.BTN_BUSCA_DIAGNOS)

    def set_rut_profesional(self, rut):
        """
        Ingresa rut del profesional
        :param rut: string
        """
        self.input.fill(ausentismos_crear_catalog.INPUT_RUT_PRO, rut)

    def set_nombre_profesional(self, nombre):
        """
        Ingresa nombre de profesional
        :param nombre: string
        """
        self.input.fill(ausentismos_crear_catalog.INPUT_NOMBRE_MEDICO, nombre)

    def set_especialidad(self, code):
        """
        Ingresa código de especialidad
        :param code: int
        """
        self.input.fill(ausentismos_crear_catalog.INPUT_ESPECIA_CODE, code)

    def click_busca_especialidad(self):
        """
        Abre buscador especialidad
        """
        self.button.click(ausentismos_crear_catalog.BTN_BUSCA_ESPECIA)

    def set_dias_extras_considerar(self, n):
        """
        Ingresa cantidad de dias extras a considerar
        :param n: int
        """
        self.input.fill(ausentismos_crear_catalog.INPUT_DIAS_EXTRA_CON, n)

    def click_del_ingreso(self):
        """
        Presiona la pestaña 'Del Ingreso'
        """
        self.button.click(ausentismos_crear_catalog.TAB_DEL_INGRESO)

    def select_origen(self, origen):
        """
        Selecciona origen
        :param origen: string tipo de origen
        """
        self.select.select_by_visible_text(ausentismos_crear_catalog.SELECT_ORIGEN, origen)

    def set_usuario(self, user):
        """
        Ingresa usuario
        :param user: string
        """
        self.input.fill(ausentismos_crear_catalog.INPUT_USUARIO, user)

    def set_fecha_ingreso(self, fecha):
        """
        Ingresa fecha ingreso
        :param fecha: dd-mm-yyyy
        """
        self.input.fill(ausentismos_crear_catalog.INPUT_FECHA_ING, fecha)

    def click_ok(self):
        """
        Presiona botón Ok en barra
        """
        self.button.click(ausentismos_crear_catalog.BTN_OK)

    def click_volver(self):
        """
        Presiona botón Volver en barra
        """
        self.button.click(ausentismos_crear_catalog.BTN_VOLVER)

    def check_alert(self):
        """
        Verifica que se gatillo una alerta de validación
        :return: true if alert raised, false if not
        """
        alert_text = ""
        try:

            alert_text = self.input.get_text(ausentismos_crear_catalog.ALERTA, 5)
        except:
            pass
        if alert_text != "":
            self.click_cerrar_alert()
            return True
        return False

    def click_cerrar_alert(self):
        """
        Cierra la alerta
        """
        self.button.click(ausentismos_crear_catalog.ALERT_CLOSE)
