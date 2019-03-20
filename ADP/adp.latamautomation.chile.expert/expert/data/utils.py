import datetime
import random
import uuid


class Utils():
    """
    Clase que tiene funciones comunes para generar datos de prueba
    """

    def string_to_date(self, date_string):
        """
        Convierte un string a date
        :param date_string: dd-mm-yyyy
        :return: date
        """
        return datetime.datetime.strptime(date_string, "%d-%m-%Y").date()

    def get_date(self, separator="-", plus=0):
        """
        Genera string con la fecha de hoy en formato dd{separador}mm{separador}yyyy
        :return: string
        """
        return (datetime.date.today() + datetime.timedelta(days=plus)).strftime("%d{0}%m{0}%Y".format(separator))

    def plus_days(self, date_string, plus):
        """
        Suma días a la fecha ingresada
        :param date: fecha inicial en string
        :param plus: cantidad de dias a sumar string or int
        :return: string dd-mm-yyyy
        """
        if isinstance(plus, str):
            data = plus.split(",")
            plus = int(data[0])
        return ((self.string_to_date(date_string)) + datetime.timedelta(days=plus)).strftime("%d-%m-%Y")

    def unique_identifier(self):
        """
        Genera un identificador único
        :return: string
        """
        return str(uuid.uuid1())

    def random_digits(self, digits):
        """
        Genera un número aleatorio con la cantidad de digitos especificado como parametro de entrada
        :param digits: cantidad de dígitos que tendrá el número aleatorio generado
        :return: int
        """
        return random.randint(pow(10, digits - 1), pow(10, digits) - 1)
