using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HolidayMaker_API.Models;

namespace HolidayMaker_API.Services
{
    public class CustomerService
    {
        private readonly HolidayMakerContext _holidayMakerContext;

        public CustomerService(HolidayMakerContext holidayMakerContext)
        {
            _holidayMakerContext = holidayMakerContext
        }

        public void RegisterCustomer(Customer customer)
        {
            _holidayMakerContext.Customers.Add(customer);
            _holidayMakerContext.SaveChanges();
        }

        public Customer GetCustomer(string email)
        {
           return _holidayMakerContext.Customers.FirstOrDefault(c => c.Email == email );
        }

        public async Task<int> EditCustomer(Customer customer)
        {
            _holidayMakerContext.Update(customer);
            return await _holidayMakerContext.SaveChangesAsync();
        }
        
        public void RemoveCustomer(string email)
        {
            var customer = _holidayMakerContext.Customers.SingleOrDefault(c => c.Email == email);
            _holidayMakerContext.Customers.Remove(customer);
            _holidayMakerContext.SaveChanges();
        }
    };
}
