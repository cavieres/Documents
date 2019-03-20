from expert.catalogs import ausentismos_catalog
from scriptize.components.page_element import PageObjects


class AusentismosPage(PageObjects):
    """
    La clase 'AusentismosPage' es responsable de la interacción con los componentes del modal Ausentismos
    """

    def click_crear(self):
        """
        Click en botón Crear
        """
        self.button.click(ausentismos_catalog.BTN_CREAR)

    def get_fecha_licencia(self):
        """
        Obtiene la fecha de licencia de la primera fila
        :return: string
        """
        fecha = ""
        try:
            self.input.wait_for_element_present(ausentismos_catalog.TR1_FECHA_LICEN, 3)
            fecha = self.input.get_text(ausentismos_catalog.TR1_FECHA_LICEN)
        except Exception as e:
            pass
        return fecha

    def get_dias(self):
        """
        Obtiene dias de la primera fila
        :return: string
        """
        return self.input.get_text(ausentismos_catalog.TR1_DIAS)

    def get_nro(self):
        """
        Obtener el número de la primera fila
        :return: int
        """
        return self.input.get_text(ausentismos_catalog.TR1_NRO)

    def get_numero_por_linea(self, linea):
        """
        Obtener la fecha aplicación.
        :param line: el índex de la línea de la tabla.
        :return: fecha aplicación.
        """
        return self.table.get_column_text(linea, 2)

    def get_tabla_ausentismos(self):
        """
        Obtener las líneas de la tabla de ausentismos.
        :return: tabla de ausentismos.
        """
        return self.table.get_table_lines(ausentismos_catalog.TABLA_AUSENTISMOS, True)

    def hay_seguiente(self):
        """
        Verifica sy hay más registros en la pagina seguiente.
        :return: True si hay registros, o False.
        """
        button = self.get_element(ausentismos_catalog.BTN_SEGUIENTE)
        return False if str.startswith(button.get_attribute("onclick"), "return false") else True

    def click_seguiente(self):
        """
        Hace click en button 'seguiente';
        """
        self.button.click(ausentismos_catalog.BTN_SEGUIENTE)

    def borra_ausentismo(self, linea):
        """
        Borra el ausentismo de la linea.
        :param linea: la linea para borrar.
        :return:
        """
        self.table.click_element_inside_column(linea, 12, "input")
        self.alert.accept_alert()

    def click_fecha_ingreso(self):
        """
        Hace click en link Fecha Ingreso.
        """
        self.link.click(ausentismos_catalog.LINK_FECHA_INGRESO)

    def click_sort_asc(self):
        """
        Hace click en button Sort Asc (Fecha Ingreso).
        :return:
        """
        self.button.click(ausentismos_catalog.BTN_SORT_ASC)
