from expert.catalogs import mantencion_indices_catalog
from scriptize.components.page_element import PageObjects


class MantencionIndicesPage(PageObjects):
    """
    La clase 'MantencionIndicesPage' es responsable de la interacción con los componentes
    de la pantalla de mantención de índices
    """

    def click_boton_crear(self):
        """
        Hace click sobre el botón "Crear": que abre el formulario para crear índices
        """
        self.button.click(mantencion_indices_catalog.BOTON_CREAR)

    def click_boton_volver(self):
        """
        Hace click sobre el botón "Volver": vuelve a la pantalla de inicio
        """
        self.button.click(mantencion_indices_catalog.BOTON_VOLVER)

    def get_Periodo(self):
        """
        Obtiene la fecha, desde la pantalla de mantención de índices
        :return: Fecha de los índices
        """
        return self.input.get_text(mantencion_indices_catalog.V01_PERIODO)

    def get_UTM(self):
        """
        Obtiene el valor de la UTM de la pantalla de mantención de índices
        :return: Valor de la UTM
        """
        return self.input.get_text(mantencion_indices_catalog.V02_UTM)

    def get_UF(self):
        """
        Obtiene el valor de la UF de la pantalla de mantención de índices
        :return: Valor de la UF
        """
        return self.input.get_text(mantencion_indices_catalog.V03_UF)

    def get_TopeAfp(self):
        """
        Obtiene el valor del Tope imponible AFP de la pantalla de mantención de índices
        :return: Valor del Tope imponible AFP
        """
        return self.input.get_text(mantencion_indices_catalog.V04_TOPE_AFP)

    def get_TopeSec(self):
        """
        Obtiene el valor del Tope imponible Seguro de Cesantía de la pantalla de mantención de índices
        :return: Valor del Tope imponible Seguro de Cesantía
        """
        return self.input.get_text(mantencion_indices_catalog.V05_TOPE_SEC)

    def get_VariacionIpc(self):
        """
        Obtiene el valor de la variación de IPC de la pantalla de mantención de índices
        :return: Valor de la variación de IPC
        """
        return self.input.get_text(mantencion_indices_catalog.V06_VARIACION_IPC)

    def get_FactorActualizacionIpc(self):
        """
        Obtiene el valor del Factor de Actualización de la pantalla de mantención de índices
        :return: Valor del Factor de Actualización de IPC
        """
        return self.input.get_text(mantencion_indices_catalog.V07_FACTOR_ACTUALIZACION)

    def get_SueldoMinimo(self):
        """
        Obtiene el valor del Sueldo Mínimo de la pantalla de mantención de índices
        :return: Valor del Sueldo Mínimo
        """
        return self.input.get_text(mantencion_indices_catalog.V08_SUELDO_MINIMO)
