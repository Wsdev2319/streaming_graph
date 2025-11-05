// ===== CONSTRAINTS =====
CREATE CONSTRAINT user_id IF NOT EXISTS FOR (u:User) REQUIRE u.id IS UNIQUE;
CREATE CONSTRAINT movie_id IF NOT EXISTS FOR (m:Movie) REQUIRE m.id IS UNIQUE;
CREATE CONSTRAINT series_id IF NOT EXISTS FOR (s:Series) REQUIRE s.id IS UNIQUE;
CREATE CONSTRAINT genre_name IF NOT EXISTS FOR (g:Genre) REQUIRE g.name IS UNIQUE;
CREATE CONSTRAINT actor_name IF NOT EXISTS FOR (a:Actor) REQUIRE a.name IS UNIQUE;
CREATE CONSTRAINT director_name IF NOT EXISTS FOR (d:Director) REQUIRE d.name IS UNIQUE;

// ===== GENRES =====
CREATE (g1:Genre {name: "Action"}),
       (g2:Genre {name: "Comedy"}),
       (g3:Genre {name: "Drama"}),
       (g4:Genre {name: "Sci-Fi"}),
       (g5:Genre {name: "Thriller"});

// ===== MOVIES =====
CREATE (m1:Movie {id: 1, title: "Edge of Tomorrow", year: 2014}),
       (m2:Movie {id: 2, title: "Inception", year: 2010}),
       (m3:Movie {id: 3, title: "The Dark Knight", year: 2008}),
       (m4:Movie {id: 4, title: "The Hangover", year: 2009}),
       (m5:Movie {id: 5, title: "Interstellar", year: 2014});

// ===== SERIES =====
CREATE (s1:Series {id: 1, title: "Breaking Bad", seasons: 5}),
       (s2:Series {id: 2, title: "Stranger Things", seasons: 4}),
       (s3:Series {id: 3, title: "Friends", seasons: 10}),
       (s4:Series {id: 4, title: "The Office", seasons: 9}),
       (s5:Series {id: 5, title: "The Mandalorian", seasons: 3});

// ===== ACTORS =====
CREATE (a1:Actor {name: "Tom Cruise"}),
       (a2:Actor {name: "Leonardo DiCaprio"}),
       (a3:Actor {name: "Christian Bale"}),
       (a4:Actor {name: "Bryan Cranston"}),
       (a5:Actor {name: "Millie Bobby Brown"});

// ===== DIRECTORS =====
CREATE (d1:Director {name: "Christopher Nolan"}),
       (d2:Director {name: "Todd Phillips"}),
       (d3:Director {name: "Vince Gilligan"}),
       (d4:Director {name: "Matt Duffer"});

// ===== RELATIONSHIPS =====
MATCH (m1:Movie {id: 1}), (g4:Genre {name:"Sci-Fi"}), (a1:Actor {name:"Tom Cruise"}), (d1:Director {name:"Christopher Nolan"})
CREATE (m1)-[:IN_GENRE]->(g4),
       (a1)-[:ACTED_IN]->(m1),
       (d1)-[:DIRECTED]->(m1);

MATCH (m2:Movie {id: 2}), (g4:Genre {name:"Sci-Fi"}), (a2:Actor {name:"Leonardo DiCaprio"}), (d1:Director {name:"Christopher Nolan"})
CREATE (m2)-[:IN_GENRE]->(g4),
       (a2)-[:ACTED_IN]->(m2),
       (d1)-[:DIRECTED]->(m2);

MATCH (s1:Series {id: 1}), (g3:Genre {name:"Drama"}), (a4:Actor {name:"Bryan Cranston"}), (d3:Director {name:"Vince Gilligan"})
CREATE (s1)-[:IN_GENRE]->(g3),
       (a4)-[:ACTED_IN]->(s1),
       (d3)-[:DIRECTED]->(s1);

MATCH (s2:Series {id: 2}), (g4:Genre {name:"Sci-Fi"}), (a5:Actor {name:"Millie Bobby Brown"}), (d4:Director {name:"Matt Duffer"})
CREATE (s2)-[:IN_GENRE]->(g4),
       (a5)-[:ACTED_IN]->(s2),
       (d4)-[:DIRECTED]->(s2);

// ===== USERS + WATCHED =====
UNWIND range(1,10) AS id
CREATE (u:User {id:id, name:"User " + id});

MATCH (u1:User {id:1}), (m2:Movie {id:2}) CREATE (u1)-[:WATCHED {rating:9.5}]->(m2);
MATCH (u2:User {id:2}), (m1:Movie {id:1}) CREATE (u2)-[:WATCHED {rating:8.7}]->(m1);
MATCH (u3:User {id:3}), (s1:Series {id:1}) CREATE (u3)-[:WATCHED {rating:9.8}]->(s1);
MATCH (u4:User {id:4}), (s2:Series {id:2}) CREATE (u4)-[:WATCHED {rating:8.9}]->(s2);
MATCH (u5:User {id:5}), (m3:Movie {id:3}) CREATE (u5)-[:WATCHED {rating:9.7}]->(m3);
MATCH (u6:User {id:6}), (s3:Series {id:3}) CREATE (u6)-[:WATCHED {rating:8.4}]->(s3);
MATCH (u7:User {id:7}), (m4:Movie {id:4}) CREATE (u7)-[:WATCHED {rating:7.9}]->(m4);
MATCH (u8:User {id:8}), (m5:Movie {id:5}) CREATE (u8)-[:WATCHED {rating:9.2}]->(m5);
MATCH (u9:User {id:9}), (s4:Series {id:4}) CREATE (u9)-[:WATCHED {rating:8.5}]->(s4);
MATCH (u10:User {id:10}), (s5:Series {id:5}) CREATE (u10)-[:WATCHED {rating:9.0}]->(s5);
