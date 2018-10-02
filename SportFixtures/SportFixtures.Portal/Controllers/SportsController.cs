﻿using Microsoft.AspNetCore.Mvc;
using SportFixtures.BusinessLogic.Interfaces;
using SportFixtures.Data.Entities;
using SportFixtures.Exceptions.SportExceptions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SportFixtures.Portal.Controllers
{
    [Route("api/sports")]
    public class SportsController : ControllerBase
    {
        private ISportBusinessLogic sportBusinessLogic;

        public SportsController(ISportBusinessLogic sportBL)
        {
            sportBusinessLogic = sportBL;
        }

        [HttpGet]
        public ActionResult<ICollection<Sport>> GetAllSports()
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            try
            {
                var sports = sportBusinessLogic.GetAll();
                return Ok(sports);
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }

        [HttpGet("{id}")]
        public ActionResult<Sport> GetSport(int id)
        {
            //if (!ModelState.IsValid)
            //{
            //    return BadRequest(ModelState);
            //}

            //try
            //{
            //    var sport = sportBusinessLogic.GetById(id);
            //    return Ok(sport);
            //}
            //catch (Exception e)
            //{
            //    return BadRequest(e.Message);
            //}
            return null;
        }

        [HttpPost]
        public ActionResult CreateSport([FromBody]Sport sport)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            try
            {
                sportBusinessLogic.Add(sport);
                return Ok();
            }
            catch (SportException e)
            {
                return BadRequest(e.Message);
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }

        [HttpPut]
        public ActionResult UpdateSport(int id, [FromBody]Sport sport)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            try
            {
                sportBusinessLogic.Update(sport);
                return Ok();
            }
            catch (SportDoesNotExistException e)
            {
                return NotFound(e.Message);
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }

        [HttpDelete("{id}")]
        public ActionResult DeleteSport(int id)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            try
            {
                sportBusinessLogic.Delete(new Sport() { Id = id });
                return Ok();
            }
            catch (SportDoesNotExistException e)
            {
                return NotFound(e.Message);
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }
    }
}