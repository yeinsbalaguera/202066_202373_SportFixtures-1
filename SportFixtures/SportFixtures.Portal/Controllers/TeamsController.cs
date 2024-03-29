﻿using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using SportFixtures.BusinessLogic.Interfaces;
using SportFixtures.Data.Entities;
using SportFixtures.Data.DTOs;
using SportFixtures.Exceptions.SportExceptions;
using SportFixtures.Exceptions.TeamExceptions;
using SportFixtures.Portal.DTOs;
using SportFixtures.Portal.Filters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using SportFixtures.Data.Enums;

namespace SportFixtures.Portal.Controllers
{
    [Route("api/teams")]
    public class TeamsController : ControllerBase
    {
        private ITeamBusinessLogic teamBusinessLogic;
        private readonly IMapper mapper;

        public TeamsController(ITeamBusinessLogic teamBL, IMapper mapper)
        {
            teamBusinessLogic = teamBL;
            this.mapper = mapper;
        }

        [HttpGet]
        public ActionResult<ICollection<TeamDTO>> GetAllTeams()
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            try
            {
                string name = HttpContext.Request.Query["name"].ToString();
                var orderParam = HttpContext.Request.Query["order"].ToString();
                Order order = Order.Ascending;
                if (!string.IsNullOrWhiteSpace(orderParam))
                {
                    order = (Order)Enum.Parse(typeof(Order), orderParam);
                }
                var filter = new TeamFilterDTO { Name = name, Order = order };
                var teams = mapper.Map<TeamDTO[]>(teamBusinessLogic.GetAll(filter));
                return Ok(teams);
            }
            catch (Exception e)
            {
                return StatusCode(500, e.Message);
            }
        }

        [HttpGet("{id}")]
        public ActionResult<TeamDTO> GetTeam(int id)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            try
            {
                var team = mapper.Map<TeamDTO>(teamBusinessLogic.GetById(id));
                return Ok(team);
            }
            catch (TeamDoesNotExistsException e)
            {
                return NotFound(e.Message);
            }
            catch (Exception e)
            {
                return StatusCode(500, e.Message);
            }
        }

        [HttpPost]
        [AuthorizedRoles(Role.Admin)]
        public ActionResult CreateTeam([FromBody]TeamDTO data)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            try
            {
                var team = mapper.Map<Team>(data);
                teamBusinessLogic.Add(team);
                return Ok(mapper.Map<TeamDTO>(team));
            }
            catch (SportDoesNotExistException e)
            {
                return NotFound(e.Message);
            }
            catch (TeamAlreadyInSportException e)
            {
                return BadRequest(e.Message);
            }
            catch (TeamException e)
            {
                return BadRequest(e.Message);
            }
            catch (Exception e)
            {
                return StatusCode(500, e.Message);
            }
        }

        [HttpPut]
        [AuthorizedRoles(Role.Admin)]
        public ActionResult UpdateTeam([FromBody]TeamDTO data)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            try
            {
                var team = mapper.Map<Team>(data);
                teamBusinessLogic.Update(team);
                return Ok(mapper.Map<TeamDTO>(team));
            }
            catch (TeamDoesNotExistsException e)
            {
                return NotFound(e.Message);
            }
            catch (TeamException e)
            {
                return BadRequest(e.Message);
            }
            catch (Exception e)
            {
                return StatusCode(500, e.Message);
            }
        }

        [HttpDelete("{id}")]
        [AuthorizedRoles(Role.Admin)]
        public ActionResult DeleteTeam(int id)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            try
            {
                teamBusinessLogic.Delete(id);
                return Ok(new ResponseOkDTO());
            }
            catch (TeamDoesNotExistsException e)
            {
                return NotFound(e.Message);
            }
            catch (Exception e)
            {
                return StatusCode(500, e.Message);
            }
        }
    }
}
