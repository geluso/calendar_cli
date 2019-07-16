require 'pry'

def game_hash
	{
		home: {
			team_name: "Brooklynn Nets",
			colors: ["Black", "White"],
			team_members: {
				"Josh" => {points: 19},
				"Samm" => {points: 10},
				"Mike" => {points: 10},
			}
		}
	}
end

def find_person_by_iterating(player_name)
	game_hash[:home][:team_members].each do |name, stats|
		if name == player_name
			return stats
		end
	end
end

def find_person_by_direct_key_access(player_name)
	game_hash[:home][:team_members][player_name]
end

puts "Finding person by iterating through key/value pairs"
puts find_person_by_iterating("Josh")
puts

puts "Finding person by direct key access"
puts find_person_by_direct_key_access("Josh")
