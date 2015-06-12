Program Name: Tournament
Programmer: Jon Tudor
Purpose: To allow for all the functionality needed to run a Swiss System tournament.
Version: 1.0
Other Contributors/Credits: Udacity Full Stack Developer Nanodegree
Quick Start:

- In order to install this program, first clone the repository.
- Once cloned, navigate to the Tournament-Project/vagrant folder on your computer via the command line.
- Next use the "vagrant up" command to bring the VM up. You will need Vagrant and Virtual Box installed to do this.
- SSH into the VM using the command "vagrant ssh" and then navigate to the \vagrant\tournament directory.
- Issue the psql command and issue a "create database tournament;" command to create the tournamen database.
- Exit psql with  the "^d" command and then use "psql tournament" to connect to the tournament database via psql.
- Run the "\i tournament.sql" command to create the database tables and views needed for a tournament.
- Exit psql again with a "^d" command and you are ready to run your tournament by running any of the functions below.

Note: You can test to make sure all functions are working by running the "python tournament_test.py" command.

Available Tournament Functions:


def connect():
    """Connect to the PostgreSQL database.  Returns a database db."""



def deleteMatches():
    """Remove all the match records from the database."""



def deletePlayers():
    """Remove all the player records from the database."""



def countPlayers():
    """Returns the number of players currently registered."""


def registerPlayer(name):
    """Adds a player to the tournament database.

    The database assigns a unique serial id number for the player.  (This
    should be handled by your SQL database schema, not in your Python code.)

    Args:
      name: the player's full name (need not be unique).
    """



def playerStandings():
    """Returns a list of the players and their win records, sorted by wins.
    The first entry in the list should be the player in first place, or a player
    tied for first place if there is currently a tie.
    Returns:
      A list of tuples, each of which contains (id, name, wins, matches):
        id: the player's unique id (assigned by the database)
        name: the player's full name (as registered)
        wins: the number of matches the player has won
        matches: the number of matches the player has played
    """


def reportMatch(winner, loser):
    """Records the outcome of a single match between two players.
    Args:
      winner:  the id number of the player who won
      loser:  the id number of the player who lost
    """


def swissPairings():
    """Returns a list of pairs of players for the next round of a match.

    Assuming that there are an even number of players registered, each player
    appears exactly once in the pairings.  Each player is paired with another
    player with an equal or nearly-equal win record, that is, a player adjacent
    to him or her in the standings.

    Returns:
      A list of tuples, each of which contains (id1, name1, id2, name2)
        id1: the first player's unique id
        name1: the first player's name
        id2: the second player's unique id
        name2: the second player's name
