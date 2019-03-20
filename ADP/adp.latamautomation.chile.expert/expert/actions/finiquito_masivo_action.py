from datetime import datetime

from expert.pages.finiquito_masivo_page import FiniquitoMasivoPage


class FiniquitoMasivoAction:
    def __init__(self):
        self.finiquito_masivo_page = FiniquitoMasivoPage()

    def ingresar_fecha_finiquito(self):
        """
        Obtiene la variable AMES de la pantalla, la transforma al formato correcto y llena el campo 'Fecha Finiquito'
        """
        finiquito_masivo_page = FiniquitoMasivoPage()
        ames = finiquito_masivo_page.get_ames()
        fecha_finiquito = ("01" + "-" + ames[:2] + "-" + ames[3:7])
        finiquito_masivo_page.set_fecha_finiquitos(fecha_finiquito)

    def ingresar_mes_ultimo_sueldo(self):
        """
        Obtiene variable AMES de la pantalla, la transforma al formato correcto y la ingresa en el campo 
        'Mes Ultimo Sueldo'
        """
        finiquito_masivo_page = FiniquitoMasivoPage()
        ames = finiquito_masivo_page.get_ames()
        ames = datetime.strptime(ames[:2] + "/" + ames[3:7], "%m/%Y")
        mes_ultimo_sueldo = datetime.strftime(ames, "%b-%Y").lower()
        finiquito_masivo_page.set_mes_ultimo_sueldo(mes_ultimo_sueldo)

    def ingresar_descripcion(self, value):
        """
        Ingresa la descripcion del proceso
        :param value: timestamp de la ejecución como descripción
        """
        finiquito_masivo_page = FiniquitoMasivoPage()
        finiquito_masivo_page.set_descripcion_del_proceso(value)
