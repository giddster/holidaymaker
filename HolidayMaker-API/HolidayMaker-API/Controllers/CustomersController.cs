using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using HolidayMaker_API.Models;
using System.Net;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Authentication.Cookies;
using HolidayMaker_API.Services;
using System.Security.Claims;

namespace HolidayMaker_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize(AuthenticationSchemes = CookieAuthenticationDefaults.AuthenticationScheme)]
    public class CustomersController : ControllerBase
    {
        private readonly HolidayMakerContext _context;
        private readonly CustomerService _customerService;

        public CustomersController(HolidayMakerContext context, CustomerService customerService )
        {
            _context = context;
            _customerService = customerService;
        }

        #region OLD

        // GET: api/Customers
        //[HttpGet]
        //public async Task<ActionResult<IEnumerable<Customer>>> GetCustomers()
        //{
        //    return await _context.Customers.ToListAsync();
        //}


        // GET: api/Customers/5
        //[HttpGet("{id}")]
        //public async Task<ActionResult<Customer>> GetCustomer(int id)
        //{

        //    var customer = await _context.Customers.FindAsync(id);

        //    if (customer == null)
        //    {
        //        return NotFound();
        //    }

        //    return customer;
        //}
        #endregion
        

        [HttpGet("UserProfile")]
        //[Authorize(AuthenticationSchemes = CookieAuthenticationDefaults.AuthenticationScheme)]
        public async Task<ActionResult<Customer>> GetCustomerByEmail()
        {
            var userEmail = User.FindFirstValue(ClaimTypes.Email);

            var customer = _customerService.GetCustomerByEmail(userEmail);

            if (customer == null)
            {
                return NotFound();
            }

            if(userEmail == customer.Email)
            {
                return customer;
            }
            else
            {
                return NotFound();
            }

        }




        // PUT: api/Customers/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        //[Authorize(AuthenticationSchemes = CookieAuthenticationDefaults.AuthenticationScheme)]
        public async Task<IActionResult> PutCustomer(int id, Customer customer)
        {
            var userEmail = User.FindFirstValue(ClaimTypes.Email);

            var customerFromDB = _customerService.UserExistsByEmail(userEmail);

            if (id != customer.Id)
            {
                return BadRequest();
            }


            if (customerFromDB)
            {

                _context.Entry(customer).State = EntityState.Modified;

                try
                {
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!CustomerExists(id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
            }
            else
            {
                
                return BadRequest();
            }

            return NoContent();
        }

        #region OLD
        // POST: api/Customers
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        //[HttpPost]
        //public async Task<ActionResult<Customer>> PostCustomer(Customer customer)
        //{

        //    var userEmail = User.FindFirstValue(ClaimTypes.Email);

        //    var customerFromDB = _customerService.GetCustomerByEmail(userEmail);


        //    _context.Customers.Add(customer);
        //    try
        //    {
        //        await _context.SaveChangesAsync();
        //    }
        //    catch (DbUpdateException)
        //    {
        //        if (CustomerExists(customer.Id))
        //        {
        //            return Conflict();
        //        }
        //        else
        //        {
        //            throw;
        //        }
        //    }

        //    return CreatedAtAction("GetCustomer", new { id = customer.Id }, customer);
        //}


        // DELETE: api/Customers/5
        //[HttpDelete("{id}")]
        //public async Task<IActionResult> DeleteCustomer(int id)
        //{
        //    var customer = await _context.Customers.FindAsync(id);
        //    if (customer == null)
        //    {
        //        return NotFound();
        //    }

        //    _context.Customers.Remove(customer);
        //    await _context.SaveChangesAsync();

        //    return NoContent();
        //}
        #endregion


        private bool CustomerExists(int id)
        {
            return _context.Customers.Any(e => e.Id == id);
        }
    }
}
