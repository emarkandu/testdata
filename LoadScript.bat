::Loading nodes command from local import folder
LOAD CSV WITH HEADERS FROM 'file:///FamilyTree_G10_Muthu.csv' AS row
MERGE (p:Person {ID:row.ID, gen:row.Generation, sequence:row.Sequence, name:row.FirstName, spouseId:row.SpouseId, fatherId:row.FatherId, parentId:row.ParentId});

::Loading nodes command from https site
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/emarkandu/testdata/refs/heads/main/FamilyTree_G10_Muthu.csv' AS row
MERGE (p:Person {ID:row.ID, gen:row.Generation, sequence:row.Sequence, name:row.FirstName, spouseId: row.SpouseId, fatherId:row.FatherId});

::Loading relationship command from local import folder
LOAD CSV WITH HEADERS FROM 'file:///FamilyTree_G10_Muthu.csv'  AS row
MATCH (p1:Person {ID: row.ID})
MATCH (p2:Person {ID: row.FatherId})
MERGE (p2)-[r:FATHER_OF]->(p1);

::Loading relationship command from https site
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/emarkandu/testdata/refs/heads/main/FamilyTree_G10_Muthu.csv'   AS row
MATCH (p1:Person {ID: row.ID})
MATCH (p2:Person {ID: row.FartherId})
MERGE (p2)-[r:FARTHER_OF]->(p1);