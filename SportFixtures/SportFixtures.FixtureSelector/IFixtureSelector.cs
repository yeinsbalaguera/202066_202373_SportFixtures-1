using System;
using System.Collections.Generic;
using SportFixtures.Data.Entities;

namespace SportFixtures.BusinessLogic.Interfaces
{
    public interface IFixtureSelector
    {
        /// <summary>
        /// Generates encounters starting on the given date, for the given teams
        /// </summary>
        /// <param name="teams"></param>
        /// <param name="date"></param>
        /// <returns></returns>
        ICollection<Encounter> GenerateFixture(IEnumerable<Team> teams, DateTime date);

        /// <summary>
        /// Returns a list with the algorithms names by encounter mode.
        /// </summary>
        /// <returns></returns>
        ICollection<string> GetAlgorithmNames();

        /// <summary>
        /// Creates an instance of an algorithm by its name.
        /// </summary>
        /// <returns></returns>
        void CreateInstance(string name, IEncounterBusinessLogic encounterBL);
    }
}