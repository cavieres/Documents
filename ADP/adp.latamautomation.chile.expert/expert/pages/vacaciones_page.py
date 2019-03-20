from expert.catalogs import vacaciones_catalog
from scriptize.components.page_element import PageObjects


class VacacionesPage(PageObjects):
    """
    La clase 'VacacionesPage' es responsable de la interacción con los componentes del modal Vacaciones
    Mantención > Ficha del Colaborador > Ausentismo > Vacaciones
    """

    def esta_presente_calcular_vacaciones_a_fecha(self):
        """
        Verifica si el campo calcular vaciones a fecha esta presente
        :return: True si esta presente False sino
        """
        return self.is_element_present(vacaciones_catalog.INPUT_CALCULAR_VACACIONES_A_FECHA, 60)

    def esta_presente_anuales(self):
        """
        Verifica si el campo anuales esta presente
        :return: True si esta presente False sino
        """
        return self.is_element_present(vacaciones_catalog.INPUT_ANUALES, 60)

    def esta_presente_proporcionales(self):
        """
        Verifica si el campo proporcionales esta presente
        :return: True si esta presente False sino
        """
        return self.is_element_present(vacaciones_catalog.INPUT_PROPORCIONALES, 60)

    def esta_presente_progresivos(self):
        """
        Verifica si el campo progresivos esta presente
        :return: True si esta presente False sino
        """
        return self.is_element_present(vacaciones_catalog.INPUT_PROGRESIVOS, 60)

    def esta_presente_adicionales(self):
        """
        Verifica si el campo adicionales esta presente
        :return: True si esta presente False sino
        """
        return self.is_element_present(vacaciones_catalog.INPUT_ADICIONALES, 60)

    def click_crear(self):
        """
        Click en botón Crear
        """
        self.button.click(vacaciones_catalog.BTN_CREAR)

    def click_imprimir(self):
        """
        Click en botón Imprimir
        """
        self.button.click(vacaciones_catalog.BTN_IMPRIMIR)

    def click_no(self):
        """
        Click en cabecera "NO."
        """
        self.button.click(vacaciones_catalog.LINK_NO)

    def get_desde(self):
        """
        Obtiene la fecha "DESDE" del primer registro de la grilla
        :return: Fecha de inicio de vacaciones
        """
        return self.input.get_text(vacaciones_catalog.VF1_DESDE)

    def get_hasta(self):
        """
        Obtiene la fecha "HASTA" del primer registro de la grilla
        :return: Fecha de termino de vacaciones
        """
        return self.input.get_text(vacaciones_catalog.VF1_HASTA)

    def get_dias(self):
        """
        Obtiene la cantidad de "DIAS" del primer registro de la grilla
        :return: Cantidad de días de vacaciones
        """
        return self.input.get_text(vacaciones_catalog.VF1_DIAS)

    def get_tipc(self):
        """
        Obtiene el TIPC del primer registro de la grilla
        :return: TIPC
        """
        return self.input.get_text(vacaciones_catalog.VF1_TIPC)

    def click_eliminar(self):
        """
        Click en el botón "Eliminar" del primer registro de la grilla
        """
        self.button.click(vacaciones_catalog.TR1_ELIMINAR)

    def confirma_alerta(self):
        """
        Click en el botón "Ok" de la ventana que confirma la eliminación del registro de vacaciones
        """
        self.alert.accept_alert()

    def get_todos_dias_tomados(self):
        """
        Busca todos días tomados
        :return: una lista con todas las TRs de WebElements
        """
        return self.table.get_table_lines(vacaciones_catalog.TABLA_DIAS_TOMADOS, True)

    def elemina_registro_dia_tomado(self, linea):
        """
        Elimina registro día tomado pasando la linea
        :param linea: WebElement linea del elemento TD
        """
        self.table.click_element_inside_column(linea, 6, vacaciones_catalog.INPUT)
