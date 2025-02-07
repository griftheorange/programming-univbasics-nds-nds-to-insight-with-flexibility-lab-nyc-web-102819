# Provided, don't edit
require 'directors_database'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point

def movies_with_director_key(name, movies_collection)
  movies_collection.length.times { |i|
    movies_collection[i][:director_name] = name
  }
  movies_collection
end


def gross_per_studio(collection)
  studio_names = []
  collection.length.times{ |i|
    studio_names.append(collection[i][:studio])
  }
  studio_names = studio_names.uniq
  studio_names_hash = {}
  
  collection.length.times{ |i|
    if studio_names_hash[collection[i][:studio]]
      studio_names_hash[collection[i][:studio]] += collection[i][:worldwide_gross]
    else
      studio_names_hash[collection[i][:studio]] = collection[i][:worldwide_gross]
    end
  }
  studio_names_hash
  
end

def movies_with_directors_set(source)
  new_array = []
  source.length.times { |i|
    new_array.append(movies_with_director_key(source[i][:name], source[i][:movies]))
  }
  new_array
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
