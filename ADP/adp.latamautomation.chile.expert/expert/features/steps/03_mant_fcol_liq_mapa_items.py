import random

from behave import when, then

from expert.data.datos_mapa_de_items import MapaItems
from expert.actions.ficha_colaborador_action import FichaColaboradorAction
from expert.actions.mapa_de_items_action import MapaItemsAction
from expert.actions.mapa_de_items_crear_action import MapaItemsCrearAction
from expert.pages.mapa_de_items_liquidacion_page import MapaItemsLiquidacionPage
from expert.pages.mapa_de_items_page import MapaItemsPage
from scriptize.report import report


@when("ir a mapa de items")
def step_impl(context):
    context.ficha_colaborador_action = FichaColaboradorAction()
    context.ficha_colaborador_action.navega_mapa_items()


@when("borrar item")
def step_impl(context):
    context.mapa_de_items_action = MapaItemsAction()
    context.mapa_items_data = MapaItems()
    context.mapa_de_items_action.borrar_item(context.mapa_items_data.item_descripcion)


@when("agregar item y guardar valor ingresado")
def step_impl(context):
    context.mapa_de_items_page = MapaItemsPage()
    context.mapa_de_items_page.click_crear()
    context.mapa_de_items_crear_action = MapaItemsCrearAction()
    context.item_value = random.randint(1000000, 5000000)
    context.mapa_de_items_crear_action.crear_item(context.mapa_items_data.item_codigo, context.item_value)


@then("validar que valor corresponde en liquidacion colaborador")
def step_impl(context):
    context.mapa_de_items_page.click_liquidacion()
    context.mapa_items_liquidacion_page = MapaItemsLiquidacionPage()
    report.write_line("comprobar creracion de item", report.Status.SUCCESS, True)
    assert context.item_value == context.mapa_items_liquidacion_page.get_haberes_sueldo_base()
