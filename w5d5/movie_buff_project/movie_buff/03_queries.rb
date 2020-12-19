def what_was_that_one_with(those_actors)
  # Find the movies starring all `those_actors` (an array of actor names).
  # Show each movie's title and id.
  # Casting.joins(:movie, :actor).select("movies.title, movies.id").where("actors.name IN (?)", those_actors)
  Movie.joins(:actors)
  .select("movies.title, movies.id")
  .group('movies.id')
  .having('count(actors.id) >= (?)', those_actors.length)
  .where("actors.name IN (?)", those_actors)
end

def golden_age
  # Find the decade with the highest average movie score.
  Movie.group('floor(yr/10) * 10').order('avg(score) DESC').limit(1).pluck('floor(yr/10) * 10')[0].to_i
end

def costars(name)
  # List the names of the actors that the named actor has ever
  # appeared with.
  # Hint: use a subquery
  result = Movie.joins(:actors).where('actors.name = ?', name).pluck('movies.title')
  Movie.joins(:actors).select("actors.name").where("actors.name != ? AND movies.title IN (?)", name, result)
  
  # get all the movies that the actor's name was in 
  # from those movies, get all the actors except the given actor

end

def actor_out_of_work
  # Find the number of actors in the database who have not appeared in a movie

end

def starring(whazzername)
  # Find the movies with an actor who had a name like `whazzername`.
  # A name is like whazzername if the actor's name contains all of the
  # letters in whazzername, ignoring case, in order.

  # ex. "Sylvester Stallone" is like "sylvester" and "lester stone" but
  # not like "stallone sylvester" or "zylvester ztallone"

end

def longest_career
  # Find the 3 actors who had the longest careers
  # (the greatest time between first and last movie).
  # Order by actor names. Show each actor's id, name, and the length of
  # their career.

end
