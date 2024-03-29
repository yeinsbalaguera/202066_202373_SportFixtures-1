﻿using SportFixtures.Data;
using SportFixtures.Data.Entities;
using SportFixtures.Data.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SportFixtures.Portal.DTOs
{
    public class SportDTO
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public ICollection<Team> Teams { get; set; }
        public EncounterMode EncounterMode { get; set; }

        public SportDTO()
        {
            Teams = new List<Team>();
        }
    }
}
