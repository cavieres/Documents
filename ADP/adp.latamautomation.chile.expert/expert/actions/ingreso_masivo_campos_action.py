from expert.actions.ficha_colaborador_action import FichaColaboradorAction
from expert.actions.menu_action import MenuAction
from expert.pages.ficha_colaborador_page import FichaColaboradorPage
from expert.pages.ingreso_masivo_campos_page import IngresoMasivoCamposPage
from scriptize.report import report


class IngresoMasivoCampoAction:
    """"
    La clase IngresoMasivoCampoAction agrupa funcionalidades de Ingreso Maivo de Campos.
    """

    def __init__(self):
        self.menu_action = MenuAction()
        self.ingreso_masivo_campos_page = IngresoMasivoCamposPage()
        self.ficha_colaborador_action = FichaColaboradorAction()
        self.ficha_colaborador_page = FichaColaboradorPage()

    def pagina_ingresomasivocampos_esta_cargada(self):
        """
        Valida si la página está cargada
        :return: TRUE si está cargada FALSE Si no lo está
        """
        report.write_line("Valida si la página de Ingreso Masivo de Campos está cargada.")
        return self.ingreso_masivo_campos_page.esta_presente_opcion_TODOS() and self.ingreso_masivo_campos_page. \
            esta_presente_campo_seleccione_un_dato() and self.ingreso_masivo_campos_page.esta_presente_boton_ingresar()

    def pagina_detalledelcampoquemodifica_esta_cargada(self):
        """
        Valida si la página está cargada
        :return: TRUE si está cargada y FALSE si no lo está
        """
        report.write_line("Valida si la página de Detalle de Campo está cargada.")
        return self.ingreso_masivo_campos_page.esta_presente_lista_opciones() and self.ingreso_masivo_campos_page. \
            esta_presente_columna_nuevo_primer_registro() and self.ingreso_masivo_campos_page. \
                   esta_presente_boton_volver_en_detalle_del_campo_a_modificar()

    def realizar_acciones_comunes(self):
        """
        Acciones que se utiliza en los distintos escenarios
        """
        report.write_line("Realizar acciones comunes")
        self.ingreso_masivo_campos_page.click_boton_aplicar()
        self.ingreso_masivo_campos_page.click_boton_guardar()
        self.ingreso_masivo_campos_page.click_boton_si_ventana_opciones()
        self.ingreso_masivo_campos_page.esta_visible_msj_validacion()
        report.write_line("La información se almacena correctamente", report.Status.SUCCESS, True)
        self.ingreso_masivo_campos_page.click_boton_volver_valor_a_todos()

    def ingresar(self, opcion, campo, escenario):
        """
        Carga la información de la página Ingreso Masivo de Campos y se presiona botón Ingresar
        :param opcion: Opción que se quiere seleccionar en el campo 'Seleccione un dato'
        :param campo: Campo que se quiere seleccionar
        :param escenario: Corresponde al escenario
        """
        report.write_line("Carga la información de la página Ingreso Masivo de Campos y se presiona botón Ingresar")
        self.menu_action.click_ingreso_masivo_campos()
        self.pagina_ingresomasivocampos_esta_cargada()
        self.ingreso_masivo_campos_page.click_todos()
        self.ingreso_masivo_campos_page.seleccionar_campo_seleccione_un_dato(opcion)
        self.ingreso_masivo_campos_page.seleccionar_campo_a_modificar(campo)
        report.write_line("Página 'Ingreso masivo de campos' escenario [{}] y campo [{}]".format(escenario, campo),
                          report.Status.SUCCESS, True)
        self.ingreso_masivo_campos_page.click_boton_ingresar()

    def modificar(self, escenario, nuevo_valor_para_telefono):
        """
        Modifica campo en la página 'Detalle del campo que modifica'
        :param escenario: Nombre del escenario
        :param nuevo_valor_para_telefono: Valor de teléfono
        :return: Una lista de datos, la cual contiene: Nombre de Colaborador, valor campo antes de modificar y nuevo
        valor
        """
        report.write_line("Modifica campo en la página 'Detalle del campo que modifica'")
        nombre_colaborador = None
        valor_campo_antes_modificar = None
        self.pagina_detalledelcampoquemodifica_esta_cargada()
        self.ingreso_masivo_campos_page.seleccionar_campo_tipo_ingreso(escenario)
        valor_campo_antes_modificar = self.ingreso_masivo_campos_page.obtener_antiguo_valor_de_registro()
        nombre_colaborador = self.ingreso_masivo_campos_page.obtener_nombre_colaborador_primer_registro_grilla()
        report.write_line("Obtenido Nombre Colaborador [{}] y Valor Campo Antes Modificar [{}]".format(
            nombre_colaborador, valor_campo_antes_modificar))

        if escenario == "Ingreso manual en cada empleado":
            self.ingreso_masivo_campos_page.cargar_nuevo_valor_en_campo(nuevo_valor_para_telefono)
            self.ingreso_masivo_campos_page.escribir_guion_en_buscador_colaborador_en_grilla()
            report.write_line("Página 'Detalle del campo que modifica:' escenario [{}]".format(escenario),
                              report.Status.SUCCESS, True)
        elif escenario == "Colocar valor nuevo en todos los empleados":
            self.ingreso_masivo_campos_page.escribir_valor_en_campo_nuevo(nuevo_valor_para_telefono)
            report.write_line("Página 'Detalle del campo que modifica:' escenario [{}]".format(escenario),
                              report.Status.SUCCESS, True)
            self.realizar_acciones_comunes()
        elif escenario == "Reemplazar valor a buscar por el nuevo":
            self.ingreso_masivo_campos_page.escribir_campo_buscar(valor_campo_antes_modificar)
            self.ingreso_masivo_campos_page.escribir_valor_en_campo_nuevo(nuevo_valor_para_telefono)
            report.write_line("Página 'Detalle del campo que modifica:' escenario [{}] - valor campos antes modificar "
                              "[{}]".format(escenario, valor_campo_antes_modificar),
                              report.Status.SUCCESS, True)
            self.realizar_acciones_comunes()

        lista_con_datos = [nombre_colaborador, valor_campo_antes_modificar, nuevo_valor_para_telefono]
        return lista_con_datos

    def validar(self, numero_telefono, antiguo_numero_telefono):
        """
        Método que valida si teléfono ingresado por ingreso masivo se realizo correctamente
        :param numero_telefono: Corresponde al número de teléfono
        :param antiguo_numero_telefono: Corresponde al número de teléfono antiguo
        :return: True si ingreso masivo se realizo correctamente o No Sino
        """
        report.write_line("Valida si teléfono ingresado por ingreso masivo se realizo correctamente")
        numero_telefono_ficha_colaborador = self.ficha_colaborador_page.obtener_telefono_inf_personal()
        son_iguales = numero_telefono == numero_telefono_ficha_colaborador and numero_telefono_ficha_colaborador != \
                                                                               antiguo_numero_telefono
        if son_iguales:
            report.write_line(
                "Teléfono {} es igual al que se muestra en la Ficha del Colarador {}.".format(
                    numero_telefono, numero_telefono_ficha_colaborador), report.Status.SUCCESS, True)
        else:
            report.write_line(
                "Teléfono {} es distinto al que se muestra en la Ficha del Colarador {}.".format(
                    numero_telefono, numero_telefono_ficha_colaborador), report.Status.DANGER, True)
        return son_iguales
