require 'pry'

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson": {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
                        },
        "Reggie Evans": {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez": {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee": {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry": {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien": {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismack Biyombo": {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop": {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon": {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood": {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
    }
  }
  }
end

def num_points_scored(player)
  game_hash.each do |locale, team_details|
      team_details.each do |team_info, team_deets|
        if team_info == :players
          team_deets.each do |names, stats|
            if names.to_s == player
              stats.each do |stat, num|
                if stat == :points
                  return num
                end
              end
            end
          end
        end
      end
  end
end

def shoe_size(player)
  game_hash.each do |locale, team_details|
      team_details.each do |team_info, team_deets|
        if team_info == :players
          team_deets.each do |names, stats|
            if names.to_s == player
              stats.each do |stat, num|
                if stat == :shoe
                  return num
                end
              end
            end
          end
        end
      end
  end
end

def team_colors(team)
  game_hash.each do |locale, team_details|
      team_details.each do |team_info, team_deets|
        if team_deets.to_s == team
          return game_hash.fetch(locale).fetch(:colors)
        end
      end
  end
end

def team_names
  names = []
  game_hash.each do |locale, team_details|
      team_details.each do |team_info, team_deets|
        if team_info == :team_name
          names.push(team_deets)
        end
      end
  end
  names
end

def player_numbers(team)
  jersey_nums = []
  game_hash.each do |locale, team_details|
      team_details.each do |team_info, team_deets|
        if team_deets == team
          team_details.each do |team_info, team_deets|
            if team_info == :players
              team_deets.each do |names, stats|
                stats.each do |stat, num|
                if stat == :number
                  jersey_nums.push(num)
                end
              end
            end
          end
        end
      end
    end
  end
  jersey_nums
end

def player_stats(player_name)
  game_hash.each do |locale, team_details|
      team_details.each do |team_info, team_deets|
        if team_info == :players
          team_deets.each do |names, stats|
            if names.to_s == player_name
              return stats
            end
          end
        end
      end
  end
end

def big_shoe_rebounds
  all_players = {}
  game_hash.each do |locale, team_details|
      team_details.each do |team_info, team_deets|
        if team_info == :players
          all_players.merge!(team_deets)
        end
      end # builds me a player hash for sorting
  end
  players_sorted_by_shoe = all_players.sort_by { |k, v| v[:shoe] } # creates a sorted array of kay/val (ie. player/stats hash)
  players_sorted_by_shoe[-1][-1].each do |stat, num| # finds rebounds of biggest footed player
    if stat == :rebounds
      return num
    end
  end
end
