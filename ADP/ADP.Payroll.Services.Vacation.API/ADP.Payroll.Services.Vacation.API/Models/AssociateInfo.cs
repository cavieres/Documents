using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ADP.Payroll.Services.Vacation.API.Models
{
    public class AssociateInfo
    {
        public DateTime fecha_xtr { get; set; }
        public DateTime fecha_ing { get; set; }
        public DateTime vac_anre { get; set; }
        public int vacconadi { get; set; }
    }
}
