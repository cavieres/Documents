from selenium.common.exceptions import TimeoutException

from expert.catalogs import vacaciones_crear_catalog
from scriptize.components.keys import Keys
from scriptize.components.page_element import PageObjects


class VacacionesCrearPage(PageObjects):
    """
    La clase 'VacacionesCrearPage' es responsable de la interacción con los componentes del modal Crear Vacaciones
    Mantención > Ficha del Colaborador > Ausentismo > Vacaciones
    """

    def click_unidad_dias(self):
        """
        Presiona el radio button 'Dias' de la seccion 'Unidad'
        """
        self.button.click(vacaciones_crear_catalog.RB_DIAS)

    def click_unidad_manana(self):
        """
        Presiona el radio button 'Mañana' de la seccion 'Unidad'
        """
        self.button.click(vacaciones_crear_catalog.RB_MAÑANA)

    def click_unidad_tarde(self):
        """
        Presiona el radio button 'Tarde' de la seccion 'Unidad'
        """
        self.button.click(vacaciones_crear_catalog.RB_TARDE)

    def esta_rebajas_de_dias_normales(self):
        """
        Verifica si el campo rebajas días normales esta presente
        :return: True si esta presente False sino
        """
        return self.is_element_present(vacaciones_crear_catalog.RB_DIAS_NORMALES, 60)

    def click_rebajas_de_dias_normales(self):
        """
        Presiona el radio button 'Dias Normales' de la seccion 'Rebajas de'
        """
        self.radio_button.check(vacaciones_crear_catalog.RB_DIAS_NORMALES)

    def click_rebajas_de_progresivos(self):
        """
        Presiona el radio button 'Progresivos' de la seccion 'Rebajas de'
        """
        self.radio_button.check(vacaciones_crear_catalog.RB_PROGRESIVOS)

    def click_rebajas_de_adicionales(self):
        """
        Presiona el radio button 'Adicionales' de la seccion 'Rebajas de'
        """
        self.radio_button.check(vacaciones_crear_catalog.RB_ADICIONALES)

    def click_rebajas_de_dias_base(self):
        """
        Presiona el radio button 'Dias Base' de la seccion 'Rebajas de'
        """
        self.radio_button.check(vacaciones_crear_catalog.RB_DIAS_BASE)

    def esta_presente_fecha_inicial(self):
        """
        Verifica si el campo fecha inicial esta presente
        :return: True si esta presente False sino
        """
        return self.is_element_present(vacaciones_crear_catalog.INPUT_FECHA_INICIAL, 60)

    def set_fecha_inicial(self, fecha):
        """
        Ingresa fecha en campo 'Fecha Inicial'
        :param fecha: dd-mm-yyyy
        """
        self.input.fill(vacaciones_crear_catalog.INPUT_FECHA_INICIAL, fecha)

    def set_dias_de_vacaciones(self, ndias):
        """
        Ingresa cantidad de dias en campo 'Dias de vacaciones'
        :param ndias: numerico
        """
        self.input.fill(vacaciones_crear_catalog.INPUT_DIAS_DE_VACACIONES, ndias)

    def esta_presente_dias_de_vacaciones(self):
        """
        Verifica si el campo días de vacaciones esta presente
        :return: True si esta presente False sino
        """
        return self.is_element_present(vacaciones_crear_catalog.INPUT_DIAS_DE_VACACIONES, 60)

    def pulse_la_tecla_tab(self):
        """
        Presiona TAB desde elemento Días de vacaciones
        """
        Keys.press_tab(vacaciones_crear_catalog.INPUT_DIAS_DE_VACACIONES)

    def click_boton_ok(self):
        """
        Presiona el botón "Ok" para grabar la vacación
        """
        self.button.click(vacaciones_crear_catalog.BTN_OK)

    def esta_presente_boton_ok(self):
        """
        Verifica si el botón "Ok" para grabar la vacación esta presente en la pantalla.
        :return: True si esta presente False sino
        """
        return self.is_element_present(vacaciones_crear_catalog.BTN_OK)

    def get_mensaje_validacion(self):
        """
        Obtiene la mensaje de validación
        :return: mensaje de validación
        """
        return self.get_text(vacaciones_crear_catalog.DIV_ALERT_VALIDATION)

    def click_boton_volver(self):
        """
        Presiona el botón "Volver" para volver a la pantalla con el detalle de las vacaciones
        """
        self.button.click(vacaciones_crear_catalog.BTN_VOLVER)

    def get_fecha_inicial(self):
        """
        Obtiene la fecha inicial, desde formulario de creación de vacaciones
        :return: Fecha inicial de vacaciones
        """
        return self.input.get_text(vacaciones_crear_catalog.INPUT_FECHA_INICIAL)

    def get_fecha_final(self):
        """
        Obtiene la fecha final, desde formulario de creación de vacaciones
        :return: Fecha final de vacaciones
        """
        return self.input.get_text(vacaciones_crear_catalog.TB_FECHA_FINAL)

    def get_dias(self):
        """
        Obtiene la cantidad de días, desde formulario de creación de vacaciones
        :return: Cantidad de días de vacaciones
        """
        return self.input.get_text(vacaciones_crear_catalog.INPUT_DIAS_DE_VACACIONES)

    def get_fecha_retorno(self):
        """
        Obtiene la fecha de retorno, desde formulario de creación de vacaciones
        :return: Fecha de retorno de vacaciones
        """
        return self.input.get_text(vacaciones_crear_catalog.INPUT_FECHA_RETORNO)

    def espera_fecha_retorno_actualizar(self):
        """
        Espera campo fecha de retorno actualizar, desde formulario de creación de vacaciones
        :return: True si actualizó False si no
        """
        while self.input.get_text(vacaciones_crear_catalog.INPUT_FECHA_RETORNO) == "":
            pass
