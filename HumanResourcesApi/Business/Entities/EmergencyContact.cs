using System;
using System.Collections.Generic;

namespace HumanResourcesApi.Business.Entities
{
    public partial class EmergencyContact
    {
        public int EmergencyContactId { get; set; }
        public string ContactName { get; set; }
        public string Relationship { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string Province { get; set; }
        public string PostalCode { get; set; }
        public string HomePhone { get; set; }
        public string CellPhone { get; set; }
        public string EmailAddress { get; set; }
        public DateTime CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string ModifiedBy { get; set; }
        public int? FkEmployeeId { get; set; }

        public Employee FkEmployee { get; set; }
    }
}
