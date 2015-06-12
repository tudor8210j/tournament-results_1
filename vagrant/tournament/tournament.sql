-- Program: Tournament
-- Module: tournament
-- Programmer: Jon Tudor
-- Purpose: To allow for all the funcationality needed to run a Swiss System tournamnet. This module speicifically creates the database tables and strucutre needed for the application.
--
-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

-- Drop any existing tables or views to reset the tournament
DROP TABLE IF EXISTS player CASCADE;
DROP TABLE IF EXISTS match CASCADE;
DROP VIEW IF EXISTS tournament_standings CASCADE;

-- Create the player table
CREATE TABLE player(
	id SERIAL PRIMARY KEY,
	name TEXT);

-- Create the match table
CREATE TABLE match(
	id SERIAL PRIMARY KEY,
	w_id INTEGER REFERENCES player,
	l_id INTEGER REFERENCES player);

-- Create a tournament standings view
CREATE VIEW tournament_standings AS
	SELECT player.id as player_id, player.name,
		(SELECT count(*) FROM match WHERE match.w_id = player.id) AS matches_won,
		(SELECT count(*) FROM match WHERE player.id in (w_id, l_id)) AS matches_played
		FROM player
	GROUP BY player.id
	ORDER BY matches_won DESC;
