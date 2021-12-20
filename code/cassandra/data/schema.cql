CREATE KEYSPACE killrvideo WITH REPLICATION = { 'class': 'SimpleStrategy', 'replication_factor' : 1 };

USE killrvideo;

CREATE TABLE videos( 
  video_id TIMEUUID, 
  added_date TIMESTAMP,
  description TEXT, 
  title TEXT, 
  user_id uuid,
  PRIMARY KEY (video_id) 
);

COPY videos FROM '/videos.csv' WITH HEADER=true;

SELECT * FROM videos;