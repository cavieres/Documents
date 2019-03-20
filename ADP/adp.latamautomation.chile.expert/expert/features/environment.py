import json
import os
import tempfile

from scriptize.core import browsers
from scriptize.core.setup import Setup
from scriptize.report import log_handler as log
from scriptize.report import report
from scriptize.utils.args_parser import ArgsParser
from scriptize.utils.dict_to_object_converter import DictToObjectConverter

SETUP_CENARIOS = False


def before_all(context):

    try:
        context.download_folder = ArgsParser.parse_behave_arg(context, "df", tempfile.mkdtemp() + os.sep)
        if not os.path.exists(context.download_folder):
            print("Creando la carpeta [{}]".format(context.download_folder))
            os.mkdir(context.download_folder)
        env_file = os.path.join(os.path.dirname(__file__) + os.sep + "environment.json")
        env_json = json.load(open(env_file, encoding="utf-8"))
        context.env = DictToObjectConverter(env_json.get((ArgsParser.parse_behave_arg(context, "env"))))
        context.driver_version = ArgsParser.parse_behave_arg(context, "dv")
        context.browser = ArgsParser.parse_behave_arg(context, "br", browsers.CHROME)
        context.url = ArgsParser.parse_behave_arg(context, "ur", context.env.url)
        context.cuenta = ArgsParser.parse_behave_arg(context, "cu", context.env.clientes.clauto56.cuenta)
        context.datos = ArgsParser.parse_behave_arg(context, "dt", context.env.clientes.clauto56.datos)
        context.dominio = ArgsParser.parse_behave_arg(context, "do", context.env.clientes.clauto56.dominio)
        context.usu_admin = ArgsParser.parse_behave_arg(context, "usad", context.env.usuarios.admin.usadmin.usuario)
        context.clave_admin = ArgsParser.parse_behave_arg(context, "clusad", context.env.usuarios.admin.usadmin.clave)
        context.usu_autoconsulta = ArgsParser.parse_behave_arg(context, "usco",
                                                               context.env.usuarios.autoconsulta.us505005023.usuario)
        context.clave_autoconsulta = ArgsParser.parse_behave_arg(context, "clusco",
                                                                 context.env.usuarios.autoconsulta.us505005023.clave)
        context.navegador_visible = ArgsParser.parse_behave_arg(context, "nv", False)
        context.record_video = ArgsParser.parse_behave_arg(context, "rv", False)
    except Exception as e:
        print("before_all exception [{}]".format(str(e)))


def before_scenario(context, scenario):
    context.setup = Setup(display_visible=context.navegador_visible)
    context.setup.start(browser=context.browser, url=context.url, download_folder=context.download_folder,
                        driver_version=context.driver_version, record_video=context.record_video,
                        video_name=format_video_name(scenario.name))


def after_scenario(context, scenario):
    remove_video = True
    if scenario.status == "failed":
        remove_video = False
        report.write_line("Escenario falló [{}].".format(scenario.name), report.Status.DANGER, True)
    context.setup.quit(scenario.name, remove_video=remove_video)
    global SETUP_CENARIOS
    SETUP_CENARIOS = context.setup_cenarios


def before_feature(context, feature):
    global SETUP_CENARIOS
    SETUP_CENARIOS = False
    context.setup_cenarios = False


def after_feature(context, feature):
    global SETUP_CENARIOS
    SETUP_CENARIOS = False
    context.setup_cenarios = False
    if not os.listdir(context.download_folder):
        os.rmdir(context.download_folder)


def format_video_name(scenario_name):
    new_name = scenario_name.replace(' ', '_')
    return "{}.flv".format(new_name.lower())
