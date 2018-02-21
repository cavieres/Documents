using ADP.Payroll.Services.Vacation.API.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ADP.Payroll.Services.Vacation.API.Controllers
{
    [Route("vacation/[controller]")]
    public class BalanceController : Controller
    {
        // GET api/values/5
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            // TODO: Get real values.
            var balance = new List<VacationBalance>() {
                new VacationBalance {
                    Anio = 2016,
                    Ganados = new VacationType() {
                        Legales = new VacationSubtype() {
                            Corridos = 14.5F,
                            Habiles = 5.64F
                        },
                        Adicionales = new VacationSubtype() {
                            Corridos = 5F,
                            Habiles = 1F
                        },
                    },
                    Consumidos = new VacationType()
                    {
                        Legales = new VacationSubtype() {
                            Corridos = 0F,
                            Habiles = 4.01F
                        },
                        Adicionales = new VacationSubtype() {
                            Corridos = 87.7415F,
                            Habiles = 1F
                        }
                    },
                    Saldos = new VacationType()
                    {
                        Legales = new VacationSubtype() {
                            Corridos = 0.574F,
                            Habiles = 0.0F
                        },
                        Adicionales = new VacationSubtype() {
                            Corridos = 6985.6457F,
                            Habiles = 0.0F
                        }
                    }
                },
                new VacationBalance {
                    Anio = 2017,
                    Ganados = new VacationType() {
                        Legales = new VacationSubtype() {
                            Corridos = 14.5F,
                            Habiles = 5.64F
                        },
                        Adicionales = new VacationSubtype() {
                            Corridos = 5F,
                            Habiles = 1F
                        },
                    },
                    Consumidos = new VacationType()
                    {
                        Legales = new VacationSubtype() {
                            Corridos = 0F,
                            Habiles = 4.01F
                        },
                        Adicionales = new VacationSubtype() {
                            Corridos = 87.7415F,
                            Habiles = 1F
                        }
                    },
                    Saldos = new VacationType()
                    {
                        Legales = new VacationSubtype() {
                            Corridos = 0.574F,
                            Habiles = 0.0F
                        },
                        Adicionales = new VacationSubtype() {
                            Corridos = 6985.6457F,
                            Habiles = 0.0F
                        }
                    }
                },
                new VacationBalance {
                    Anio = 2018,
                    Ganados = new VacationType() {
                        Legales = new VacationSubtype() {
                            Corridos = 14.5F,
                            Habiles = 5.64F
                        },
                        Adicionales = new VacationSubtype() {
                            Corridos = 5F,
                            Habiles = 1F
                        },
                    },
                    Consumidos = new VacationType()
                    {
                        Legales = new VacationSubtype() {
                            Corridos = 0F,
                            Habiles = 4.01F
                        },
                        Adicionales = new VacationSubtype() {
                            Corridos = 87.7415F,
                            Habiles = 1F
                        }
                    },
                    Saldos = new VacationType()
                    {
                        Legales = new VacationSubtype() {
                            Corridos = 0.574F,
                            Habiles = 0.0F
                        },
                        Adicionales = new VacationSubtype() {
                            Corridos = 6985.6457F,
                            Habiles = 0.0F
                        }
                    }
                }
            };

            return new ObjectResult(balance);
        }
    }
}
