LOAD CSV WITH HEADERS FROM "file:///NetworkOrgs-report1581603619459.csv" AS csvLine
MERGE (o:Organisation {id: csvLine.OrganisationID, label: csvLine.OrganisationName})
WITH o, csvLine MATCH(r:AdministrativeArea {label: csvLine.Region})
MERGE (o)-[:areaServed]->(r)
WITH o, csvLine MATCH(s:Sector {label: csvLine.Sector})
MERGE (o)-[:hasSector]->(s);

MATCH (n:OrganisationRole) RETURN n;

MATCH p=()-->() RETURN p;

LOAD CSV WITH HEADERS FROM "file:///Sectors.csv" AS csvLine
MERGE (s:Sector {label: csvLine.Label});

LOAD CSV WITH HEADERS FROM "file:///Regions.csv" AS csvLine
MERGE (r:AdministrativeArea {label: csvLine.Label});

LOAD CSV WITH HEADERS FROM "file:///JobTitleSynonym.csv" AS csvLine
MERGE (r:OrganisationRole {name: csvLine.Label, type: "Synonym"});

MATCH (r:OrganisationRole) DELETE r;
MATCH (r:Person) DELETE r;

MATCH ()-[r:employee]-() DELETE r;
MATCH ()-[r:worksFor]-() DELETE r;
MATCH ()-[r:hasOccupation]-() DELETE r;
MATCH ()-[r:typeOf]-() DELETE r;

LOAD CSV WITH HEADERS FROM "file:///NetworkIndividuals-report1581610730159.csv" as csvLine
MERGE (p:Person {
  id: csvLine.IndividualID ,
  label:  csvLine.FullName,
  fullName: csvLine.FullName ,
  title: coalesce(csvLine.Title, "") ,
  firstName: csvLine.FirstName ,
  lastName: csvLine.LastName
})
WITH p, csvLine MATCH (o:Organisation {label: csvLine.NetworkOrganisation})
MERGE (p)-[:worksFor]->(o)
MERGE (o)-[:employee]->(p)
WITH p, csvLine MATCH (r:OrganisationRole {name: csvLine.JobTitle, roleName: csvLine.JobTitleSynonym, type: "JobTitle"})
MERGE (p)-[:hasOccupation]->(r);

MATCH (tom:Person)-->(Organisation) WHERE tom.firstName =~ "Ann.*" RETURN *;

LOAD CSV WITH HEADERS FROM "file:///NetworkIndividuals-report1581610730159.csv" as csvLine
MERGE (j:OrganisationRole {name: csvLine.JobTitle, roleName: csvLine.JobTitleSynonym, type: "JobTitle"})
WITH j, csvLine MATCH (r:OrganisationRole {name: csvLine.JobTitleSynonym, type: "Synonym"})
MERGE (j)-[:typeOf]->(r);
