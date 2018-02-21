using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ADP.Payroll.Services.Vacation.API.Models
{
    public static class NullDates
    {
        public static List<DateTime> Values = new List<DateTime> {
            new DateTime(3000, 1, 1),
            new DateTime(1900, 1, 1) };
    }
}
