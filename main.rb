require "./classes.rb"

puts "Welcome to Dojo Figher, what's your name?"
name = gets.chomp

# Create charactera
Player = Fighter.new("#{name}", 0,0,0,20)
Akuma = Fighter.new("Akuma", 4,4,4,20)


# Training Loop
week = 1
while week < 11
    puts "How would you like to train? Do you want to [l]ift weights, do [e]ndurance training, or practice [c]oin in fountain?"
    input = gets.chomp
    if input == "l"
        Dojo.lift_weights(Player)
    elsif input == "e"
        Dojo.endurance_training(Player)
    else input == "c"
        Dojo.coin_in_fountain(Player)
    end
    week += 1
end

# The Battle
while true
    puts "Do you want to [f]ight or [r]un? "
    input = gets.chomp

    if input == "f"
        Player.attack(Akuma)
        Akuma.attack(Player)
        
        if Player.life <= 0 
            puts "#{name}, you lose."
            break
        elsif Player.strength < Akuma.defense && Akuma.strength < Player.defense
            puts "Both fighters could not damage their opponent. This is a tie."
            break
        end
        if Akuma.life <= 0 
            puts "#{name} you win the battle!"
            break
        end
        puts "Akuma's Life: #{Akuma.life} - #{name}'s Life: #{Player.life}"
    end
    
    if input == "r"
        puts "You have escaped."
        break
    end
end

