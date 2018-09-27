using Microsoft.VisualStudio.TestTools.UnitTesting;
using Moq;
using SportFixtures.BusinessLogic.Implementations;
using SportFixtures.BusinessLogic.Interfaces;
using SportFixtures.Data.Access;
using SportFixtures.Data.Entities;
using SportFixtures.Data.Repository;
using SportFixtures.Exceptions.EncounterExceptions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SportFixtures.Test.BusinessLogicTests
{
    [TestClass]
    public class EncounterBusinessLogicTests
    {
        private const dynamic NO_BUSINESS_LOGIC = null;
        private Context context;
        private IRepository<Encounter> repository;
        private Mock<IRepository<Encounter>> mockEncounterRepo;
        private IEncounterBusinessLogic encounterBL;
        private List<Encounter> encounterList;

        [TestInitialize]
        public void TestInitialize(){
            mockEncounterRepo = new Mock<IRepository<Encounter>>();
            encounterBL = new EncounterBusinessLogic(mockEncounterRepo.Object);
            encounterList = new List<Encounter>();
            mockEncounterRepo.Setup(r => r.Get(null, null, "")).Returns(encounterList);
        }

        [TestMethod]
        public void AddEncounterOkTest()
        {
            var team1 = new Team() { Id = 1, Name = "Nacional", SportId = 1};
            var team2 = new Team() { Id = 2, Name = "Peñarol", SportId = 1};
            var sport = new Sport() { Id = 1, Name = "Futbol" };
            var encounter = new Encounter() { Id = 1, Date = DateTime.Now, SportId = sport.Id,Team1 = team1, Team2 = team2 };
            mockEncounterRepo.Setup(x => x.Insert(It.IsAny<Encounter>())).Callback<Encounter>(x => encounterList.Add(encounter));
            encounterBL.Add(encounter);
            mockEncounterRepo.Verify(x => x.Insert(It.IsAny<Encounter>()), Times.Once());
            mockEncounterRepo.Verify(x => x.Save(), Times.Once());
            Assert.IsTrue(encounterList.First().Id == encounter.Id);
        }

        [TestMethod]
        [ExpectedException(typeof(EncounterSameTeamException))]
        public void AddEncounterShouldReturnSameTeamExceptionTest()
        {
            var team = new Team() { Id = 1, Name = "Nacional", SportId = 1};
            var sport = new Sport() { Id = 1, Name = "Futbol" };
            var encounter = new Encounter() { Id = 1, Date = DateTime.Now, SportId = sport.Id, Team1 = team, Team2 = team };

            mockEncounterRepo.Setup(x => x.Insert(It.IsAny<Encounter>())).Callback<Encounter>(x => encounterList.Add(encounter));

            encounterBL.Add(encounter);
        }

        [TestMethod]
        [ExpectedException(typeof(EncounterTeamsCantBeNullException))]
        public void AddEncounterWithoutTeamsShouldReturnNullTeamsExceptionTest()
        {
            var sport = new Sport() { Id = 1, Name = "Futbol" };
            var encounter = new Encounter() { Id = 1, Date = DateTime.Now, SportId = sport.Id };

            mockEncounterRepo.Setup(x => x.Insert(It.IsAny<Encounter>())).Callback<Encounter>(x => encounterList.Add(encounter));

            encounterBL.Add(encounter);
        }

        [TestMethod]
        [ExpectedException(typeof(EncounterTeamsCantBeNullException))]
        public void AddEncounterWithoutOneTeamShouldReturnNullTeamsExceptionTest()
        {
            var team = new Team() { Id = 1, Name = "Nacional", SportId = 1};
            var sport = new Sport() { Id = 1, Name = "Futbol" };
            var encounter = new Encounter() { Id = 1, Date = DateTime.Now, SportId = sport.Id, Team1 = team };

            mockEncounterRepo.Setup(x => x.Insert(It.IsAny<Encounter>())).Callback<Encounter>(x => encounterList.Add(encounter));

            encounterBL.Add(encounter);
        }

        [TestMethod]
        [ExpectedException(typeof(EncounterTeamsDifferentSportException))]
        public void AddEncounterWithTeamsFromDifferentSportsShouldReturnExceptionTest()
        {
            var team = new Team() { Id = 1, Name = "Nacional", SportId = 1};
            var team2 = new Team() { Id = 1, Name = "Aguada", SportId = 2};
            var sport = new Sport() { Id = 1, Name = "Futbol" };
            var encounter = new Encounter() { Id = 1, Date = DateTime.Now, SportId = sport.Id, Team1 = team, Team2 = team2 };

            mockEncounterRepo.Setup(x => x.Insert(It.IsAny<Encounter>())).Callback<Encounter>(x => encounterList.Add(encounter));

            encounterBL.Add(encounter);
        }

        [TestMethod]
        [ExpectedException(typeof(EncounterSportDifferentFromTeamsSportException))]
        public void AddEncounterWithDifferentSportAsTeamsSportShouldReturnExceptionTest()
        {
            var team = new Team() { Id = 1, Name = "Nacional", SportId = 1};
            var team2 = new Team() { Id = 1, Name = "Peñarol", SportId = 1};
            var sport = new Sport() { Id = 1, Name = "Futbol" };
            var sport2 = new Sport() { Id = 2, Name = "Basquetbol" };
            var encounter = new Encounter() { Id = 1, Date = DateTime.Now, SportId = sport2.Id, Team1 = team, Team2 = team2 };

            mockEncounterRepo.Setup(x => x.Insert(It.IsAny<Encounter>())).Callback<Encounter>(x => encounterList.Add(encounter));

            encounterBL.Add(encounter);
        }
    }
}