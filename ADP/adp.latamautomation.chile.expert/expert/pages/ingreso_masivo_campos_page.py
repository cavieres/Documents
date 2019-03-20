from scriptize.components.page_element import PageObjects

from expert.catalogs import ingreso_masivo_campos_catalog


class IngresoMasivoCamposPage(PageObjects):
    """
    La clase 'IngresoMasivoCamposPage' es responsable de la interacción con los componentes de la página de
    Ingreso Masivo de Campos
    """

    def seleccionar_campo_seleccione_un_dato(self, opcion):
        """
        Selecciona campo "Seleccione un dato"
        :param opcion: Texto para la selección
        """
        self.select.select_by_visible_text(ingreso_masivo_campos_catalog.LISTA_TIPO_SELECCION, opcion)

    def seleccionar_campo_a_modificar(self, campo):
        """
        Selecciona campo de la lista
        :param campo: Campo que se quiere seleccionar
        """
        self.select.select_by_visible_text(ingreso_masivo_campos_catalog.GRILLA_DE_CAMPOS, campo)

    def obtener_campo_seleccionado_para_verificar(self):
        """
        Muestra el campo seleccionado
        :return: Valor del campo 'Campo Seleccionado' seleccionado
        """
        return self.input.get_text(ingreso_masivo_campos_catalog.CAMPO_SELECCIONADO_PARA_VERIFICAR, 60)

    def click_boton_ingresar(self):
        """
        Acción click en botón Ingresar
        """
        self.button.click(ingreso_masivo_campos_catalog.BOTON_INGRESAR)

    def seleccionar_campo_tipo_ingreso(self, opcion):
        """
        Selecciona campo Opciones
        :param opcion: Opción que se quiere seleccionar
        """
        self.select.select_by_visible_text(ingreso_masivo_campos_catalog.OPCIONES, opcion)

    def obtener_nombre_colaborador_primer_registro_grilla(self):
        """
        Obtiene el nombre del primer colaborador
        :return: Nombre del Colaborador
        """
        return self.input.get_text(ingreso_masivo_campos_catalog.COLABORADOR)

    def cargar_nuevo_valor_en_campo(self, valor):
        """
        Carga nuevo valor
        :param valor: Valor
        """
        self.input.fill(ingreso_masivo_campos_catalog.NUEVO_VALOR_CAMPO, valor)

    def obtener_antiguo_valor_de_registro(self):
        """
        Obtiene valor de la columna VALOR ACTUAL del primer registro de la grilla
        :return: Valor actual del primer registro de la grilla
        """
        return self.input.get_text(ingreso_masivo_campos_catalog.COLUMNA_VALOR_ACTUAL_PRIMER_REGISTRO)

    def click_boton_volver(self):
        """
        Presiona botón Volver
        """
        self.button.click(ingreso_masivo_campos_catalog.BOTON_VOLVER_DETALLE_DEL_CAMPO_A_MODIFICAR)

    def escribir_guion_en_buscador_colaborador_en_grilla(self):
        """
        Lleva cursor al campo Filtro Colaborador
        """
        self.input.fill(ingreso_masivo_campos_catalog.BUSCADOR_COLABORADOR_EN_GRILLA, "_")

    def is_visible_element(self):
        """
        Comprueba que imagen este visible
        :return: True o False aparece mensaje de gusrdado
        """
        return self.input.is_element_present(ingreso_masivo_campos_catalog.IMAGEN_DE_GUARDADO)

    def click_todos(self):
        """
        Permite seleccionar la opción TODOS en el campo Selección
        """
        self.button.click(ingreso_masivo_campos_catalog.LINK_TODOS)

    def click_seleccion(self):
        """
        Permite seleccionar la opción SELECCION en el campo Selección
        """
        self.button.click(ingreso_masivo_campos_catalog.LINK_SELECCION)

    def click_repetir_ultima(self):
        """
        Permite seleccionar la opción REPETIR ÚLTIMA en el campo Selección
        """
        self.button.click(ingreso_masivo_campos_catalog.LINK_REPETIR_ULTIMA)

    def escribir_valor_en_campo_nuevo(self, valor):
        """
        Carga el nuevo valor ingresado desde el campo "Nuevo valor a todos los empleados"
        :param valor: Valor
        """
        self.input.fill(ingreso_masivo_campos_catalog.CAMPO_NUEVO, valor)

    def click_boton_aplicar(self):
        """
        Clic en el botón BOTON_APLICAR_VALOR_A_TODOS
        """
        self.button.click(ingreso_masivo_campos_catalog.BOTON_APLICAR_VALOR)

    def click_boton_guardar(self):
        """
        Clic en el botón BOTON_GUARDAR_VALOR_A_TODOS
        """
        self.button.click(ingreso_masivo_campos_catalog.BOTON_GUARDAR_VALOR_A_TODOS)

    def click_boton_volver_valor_a_todos(self):
        """
        Realiza acción clic en botón Volver
        """
        self.button.click(ingreso_masivo_campos_catalog.BOTON_VOLVER_VALOR_A_TODOS)

    def click_boton_si_ventana_opciones(self):
        """
        Clic en el botón BOTON_SI_VENTANA_OPCIONES
        """
        self.button.click(ingreso_masivo_campos_catalog.BOTON_SI_VENTANA_OPCIONES)

    def esta_visible_msj_validacion(self):
        """
        Notifica si el mensaje de validación está presente
        """
        self.wait_for_element_visible(ingreso_masivo_campos_catalog.MENSAJE_VALIDACION_A_TODOS, 60)

    def esta_presente_opcion_TODOS(self):
        """
        Retorna TRUE o FALSE si esta o no presente la opción TODOS
        :return: Retorna TRUE si está presente y FALSE, si no lo esta
        """
        return self.is_element_present(ingreso_masivo_campos_catalog.LINK_TODOS, 60)

    def esta_presente_campo_seleccione_un_dato(self):
        """
        Retorna TRUE o FALSE si esta o no presente la opción SELECCIONE UN DATO
        :return: Retorna TRUE si está presente y FALSE, si no lo esta
        """
        return self.is_element_present(ingreso_masivo_campos_catalog.LISTA_TIPO_SELECCION, 60)

    def esta_presente_boton_ingresar(self):
        """
        Retorna TRUE o FALSE si esta o no presente a boton INGRESAR
        :return: Retorna TRUE si está presente y FALSE, si no lo esta
        """
        return self.is_element_present(ingreso_masivo_campos_catalog.BOTON_INGRESAR, 60)

    def esta_presente_lista_opciones(self):
        """
        Retorna TRUE o FALSE si esta o no presente a LISTA OPCIONES
        :return: Retorna TRUE si está presente y FALSE, si no lo esta
        """
        return self.is_element_present(ingreso_masivo_campos_catalog.OPCIONES)

    def esta_presente_columna_nuevo_primer_registro(self):
        """
        Retorna TRUE o FALSE si esta o no presente a COLUMNA NUEVO
        :return: Retorna TRUE si está presente y FALSE, si no lo esta
        """
        return self.is_element_present(ingreso_masivo_campos_catalog.NUEVO_VALOR_CAMPO, 60)

    def esta_presente_boton_volver_en_detalle_del_campo_a_modificar(self):
        """
        Retorna TRUE o FALSE si esta o no presente a boton VOLVER
        :return: Retorna TRUE si está presente y FALSE, si no lo esta
        """
        return self.is_element_present(ingreso_masivo_campos_catalog.BOTON_VOLVER_DETALLE_DEL_CAMPO_A_MODIFICAR, 60)

    def escribir_campo_buscar(self, valor):
        """
        Carga el valor en el campo Buscar
        :param valor: Valor
        """
        self.input.fill(ingreso_masivo_campos_catalog.CAMPO_BUSCAR, valor)
