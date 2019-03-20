from expert.catalogs import formulario_indices_catalog
from scriptize.components.page_element import PageObjects


class FormularioIndicesPage(PageObjects):
    """
    La clase 'FormularioIndicesPage' es responsable de la interacción con los componentes
    del formulario de creación de índices
    """

    def get_periodo(self):
        """
        Obtiene la fecha, desde el formulario, a la que pertenecen los índices
        :return: Valor por defecto de la fecha de los índices
        """
        return self.input.get_text(formulario_indices_catalog.V01_PERIODO)

    def set_periodo(self, value):
        """
        Llena el campo Periodo en el formulario de índices
        :param value: Fecha con formato dd-mm-yyyy
        """
        self.input.fill(formulario_indices_catalog.V01_PERIODO, value)

    def get_utm(self):
        """
        Obtiene el valor de la UTM del formulario de índices
        :return: Valor por defecto de la UTM
        """
        return self.input.get_text(formulario_indices_catalog.V02_UTM)

    def set_utm(self, value):
        """
        Llena el campo UTM en el formulario de índices
        :param value: Valor numérico sin decimales
        """
        self.input.fill(formulario_indices_catalog.V02_UTM, value)

    def get_uf(self):
        """
        Obtiene el valor de la UF del formulario de índices
        :return: Valor por defecto de la UF
        """
        return self.input.get_text(formulario_indices_catalog.V03_UF)

    def set_uf(self, value):
        """
        Llena el campo UF en el formulario de índices
        :param value: Valor numérico con 2 decimales
        """
        self.input.fill(formulario_indices_catalog.V03_UF, value)

    def get_topeafp(self):
        """
        Obtiene el valor del Tope imponible AFP del formulario de índices
        :return: Valor por defecto del Tope imponible AFP
        """
        return self.input.get_text(formulario_indices_catalog.V04_TOPE_AFP)

    def set_topeafp(self, value):
        """
        Llena el campo del Tope imponible AFP en el formulario de índices
        :param value: Valor numérico con 2 decimales
        """
        self.input.fill(formulario_indices_catalog.V04_TOPE_AFP, value)

    def get_topesec(self):
        """
        Obtiene el valor del Tope imponible Seguro de Cesantía del formulario de índices
        :return: Valor por defecto del Tope imponible Seguro de Cesantía
        """
        return self.input.get_text(formulario_indices_catalog.V05_TOPE_SEC)

    def set_topesec(self, value):
        """
        Llena el campo del Tope imponible Seguro de Cesantía en el formulario de índices
        :param value: Valor numérico con 2 decimales
        """
        self.input.fill(formulario_indices_catalog.V05_TOPE_SEC, value)

    def get_sueldo_minimo(self):
        """
        Obtiene el valor del Sueldo Mínimo del formulario de índices
        :return: Valor por defecto del Sueldo Mínimo
        """
        return self.input.get_text(formulario_indices_catalog.V06_SUELDO_MINIMO)

    def set_SueldoMinimo(self, value):
        """
        Llena el campo del Sueldo Mínimo en el formulario de índices
        :param value: Valor numérico sin decimales
        """
        self.input.fill(formulario_indices_catalog.V06_SUELDO_MINIMO, value)

    def get_variacion_ipc(self):
        """
        Obtiene el valor de la variación de IPC del formulario de índices
        :return: Valor por defecto de la variación de IPC
        """
        return self.input.get_text(formulario_indices_catalog.V07_VARIACION_IPC)

    def set_variacion_ipc(self, value):
        """
        Llena el campo de la variación de IPC en el formulario de índices
        :param value: Valor numérico con 2 decimales
        """
        self.input.fill(formulario_indices_catalog.V07_VARIACION_IPC, value)

    def get_factor_actualizacion_ipc(self):
        """
        Obtiene el valor del Factor de Actualización de IPC del formulario de índices
        :return: Valor por defecto del Factor de Actualización de IPC
        """
        return self.input.get_text(formulario_indices_catalog.V08_FACTOR_ACTUALIZACION)

    def set_factor_actualizacion_ipc(self, value):
        """
        Llena el campo del Factor de Actualización de IPC en el formulario de índices
        :param value: Valor numérico con 2 decimales
        """
        self.input.fill(formulario_indices_catalog.V08_FACTOR_ACTUALIZACION, value)

    def click_boton_ok(self):
        """
        Hace click sobre el botón Ok
        """
        self.button.click(formulario_indices_catalog.BOTON_OK)

    def click_boton_volver(self):
        """
        Hace click sobre el botón Volver
        """
        self.button.click(formulario_indices_catalog.BOTON_VOLVER)
