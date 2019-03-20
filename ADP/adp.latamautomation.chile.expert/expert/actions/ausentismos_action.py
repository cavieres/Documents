from expert.pages.ausentismos_page import AusentismosPage
from expert.pages.loadings_page import LoadingsPage
from expert.data.utils import Utils


class AusentismosAction:
    """
    La clase AusentismosAction agrupa funcionalidades de pantalla Ausentismos.
    """

    def __init__(self):
        self.page = AusentismosPage()
        self.wait = LoadingsPage()
        self.utils = Utils()
        self.loading = LoadingsPage()

    def check_ausentismo_creado(self, numero, borrar=True):
        """
        Verifica si se ha creado un ausentismo.
        :param numero: numero de ausentismo.
        :return: True si se ha creado, o False se no.
        """
        self.page.click_fecha_ingreso()
        self.wait.wait_spinner_disappear()
        self.page.click_sort_asc()
        self.wait.wait_spinner_disappear()
        tabla = self.page.get_tabla_ausentismos()
        for line in tabla:
            if self.page.get_numero_por_linea(line) == numero:
                if borrar:
                    self.page.borra_ausentismo(line)
                return True
        return False

    def anadir_dias(self, fecha, dias):
        """
        Añade días en una fecha.
        :param fecha: fecha.
        :param dias: días a seren añadidos.
        :return:
        """
        self.loading.wait_spinner_disappear()
        return self.utils.plus_days(fecha, dias)
