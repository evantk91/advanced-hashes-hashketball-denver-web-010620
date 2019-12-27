# Write your code here!
def game_hash
  { :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
          { :player_name => "Alan Anderson",
            :number => 0,
            :shoe => 16,
            :points => 22,
            :rebounds => 12,
            :assists => 12,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 1
          },
          { :player_name => "Reggie Evans",
            :number => 30,
            :shoe => 14,
            :points => 12,
            :rebounds => 12,
            :assists => 12,
            :steals => 12,
            :blocks => 12,
            :slam_dunks => 7
          },
          { :player_name => "Brook Lopez",
            :number => 11,
            :shoe => 17,
            :points => 17,
            :rebounds => 19,
            :assists => 10,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 15
          },
          { :player_name => "Mason Plumlee",
            :number => 1,
            :shoe => 19,
            :points => 26,
            :rebounds => 11,
            :assists => 6,
            :steals => 3,
            :blocks => 8,
            :slam_dunks => 5
          },
          { :player_name => "Jason Terry",
            :number => 31,
            :shoe => 15,
            :points => 19,
            :rebounds => 2,
            :assists => 2,
            :steals => 4,
            :blocks => 11,
            :slam_dunks => 1
          }
      ]
    }, 
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
          { :player_name => "Jeff Adrien",
            :number => 4,
            :shoe => 18,
            :points => 10,
            :rebounds => 1,
            :assists => 1,
            :steals => 2,
            :blocks => 7,
            :slam_dunks => 2
          },
          { :player_name => "Bismack Biyombo",
            :number => 0,
            :shoe => 16,
            :points => 12,
            :rebounds => 4,
            :assists => 7,
            :steals => 22,
            :blocks => 15,
            :slam_dunks => 10
          },
          { :player_name => "DeSagna Diop",
            :number => 2,
            :shoe => 14,
            :points => 24,
            :rebounds => 12,
            :assists => 12,
            :steals => 4,
            :blocks => 5,
            :slam_dunks => 5
          },
          { :player_name => "Ben Gordon",
            :number => 8,
            :shoe => 15,
            :points => 33,
            :rebounds => 3,
            :assists => 2,
            :steals => 1,
            :blocks => 1,
            :slam_dunks => 0
          },
          { :player_name => "Kemba Walker",
            :number => 33,
            :shoe => 15,
            :points => 6,
            :rebounds => 12,
            :assists => 12,
            :steals => 7,
            :blocks => 5,
            :slam_dunks => 12
          }
      ]
    }
  }
end

def num_points_scored(players_name)
  game_hash.each do |home_away, team_info|
    team_info[:players].each do |player|
      if player[:player_name] == players_name
        return player[:points]
      end
    end
  end
end

def shoe_size(players_name)
  game_hash.each do |home_away, team_info|
    team_info[:players].each do |player|
      if player[:player_name] == players_name
        return player[:shoe]
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |home_away, team_info|
    if team_info[:team_name] == team_name
        return team_info[:colors]
    end
  end
end

def team_names
  teams = []
  game_hash.each do |home_away, team_info|
    teams << team_info[:team_name]
  end
  
  teams
end

def player_numbers(team)
  team_numbers = []
  game_hash.each do |home_away, team_info|
    if team_info[:team_name] == team
      team_info[:players].each do |player|
        team_numbers << player[:number]
      end
    end
  end
  
  team_numbers
end

def player_stats(players_name)
  player_stats = {}
  game_hash.each do |home_away, team_info|
    team_info[:players].each do |player|
      if player[:player_name] == players_name
        player_stats[:number] = player[:number]
        player_stats[:shoe] = player[:shoe]
        player_stats[:points] = player[:points]
        player_stats[:rebounds] = player[:rebounds]
        player_stats[:assists] = player[:assists]
        player_stats[:steals] = player[:steals]
        player_stats[:blocks] = player[:blocks]
        player_stats[:slam_dunks] = player[:slam_dunks]
      end
    end
  end
  
  player_stats
end

def big_shoe_rebounds
  largest_shoe = 0
  rebounds = 0

  game_hash.each do |home_away, team_info|
    team_info[:players].each do |player|
      if player[:shoe] > largest_shoe
        largest_shoe = player[:shoe]
        rebounds = player[:rebounds]
      end
    end
  end

  rebounds
end

def most_points_scored
  highest_scorer = ''
  highest_score = 0

  game_hash.each do |home_away, team_info|
    team_info[:players].each do |player|
      if player[:points] > highest_score
        highest_score = player[:points]
        highest_scorer = player[:player_name]
      end
    end
  end
  
  highest_scorer
end

def winning_team
  total = 0
  team_totals = {}

  game_hash.each do |home_away, team_info|
    team_info[:players].each do |player|
      total += player[:points]
    end
    team = team_info[:team_name]
    team_total[team] = total
  end
  
  highest_scorer
end

def winning_team
  total = 0
  winning_team = ''
  winning_team_total = 0
  team_totals = {}

  game_hash.each do |home_away, team_info|
    team_info[:players].each do |player|
      total += player[:points]
    end

    if total > winning_team_total
      winning_team = team_info[:team_name]
      winning_team_total = total
    end

    total = 0
  end

  winning_team
end

def player_with_longest_name
  longest_name = ''
  
  game_hash.each do |home_away, team_info|
    team_info[:players].each do |player|
      if player[:player_name].length > longest_name.length
        longest_name = player[:player_name]
      end
    end
  end
  
  longest_name
end

def long_name_steals_a_ton?
  longest_name = ''
  longest_name_steals = 0
  most_steals = 0
  
  game_hash.each do |home_away, team_info|
    team_info[:players].each do |player|
      if player[:player_name].length > longest_name.length
        longest_name = player[:player_name]
        longest_name_steals = player[:steals]
      end
      
      if player[:steals] > most_steals
        most_steals = player[:steals]
      end
    end
  end
  
  longest_name_steals == most_steals
end



