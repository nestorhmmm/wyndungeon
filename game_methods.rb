module GameMethods
  def set_health(input, human_health)
    if input == "1"
      human_health = 70
    else
      human_health = 80
    end
      human_health
  end

  def set_name(input)
    if input == "1"
      character_name = "Mario"
    else
      character_name = "Peach"
    end
      character_name
  end

  def set_voice(input)
    if input == "1"
      voice = "Luca"
    else
      voice = "Kyoko"
    end
     voice
  end

  def troll_attack
    troll_attack = rand(20..40)
  end

  def personal_attack
    attack_strength = rand(30..60)
  end

  def troll_turn(human_health, character_name)
    puts "======TROLL TURN=====",
         "Troll ATTACKS!"
    2.times { sleep 1; print "." }
    space
    human_health = human_health - troll_attack
    puts "Troll does #{troll_attack} damage.",
         "#{character_name}'s health is #{human_health}",
    `say -v "Daniel" "Ouch! Your health is now down to #{human_health}."`
     human_health
  end

  def personal_turn(troll_health, character_name, voice)
    puts "======#{character_name.upcase}'s' TURN=====",
         "#{character_name} ATTACKS!"
    2.times { sleep 1; print "." }
    space
    troll_health = troll_health - personal_attack
    puts "#{character_name} does #{personal_attack} damage.",
         "Troll health is #{troll_health}."
     troll_health
  end

  def space
    puts ""
  end

  def input_require(input, option1, option2)
    until input == option1 || input == option2
      puts "Enter #{option1} or #{option2}"
      input = gets.chomp.to_s.downcase
    end
    input
  end

  ####### Game Scenes #######

  def chicken_scene
    puts "You are walking through Wynwood late at night and notice a light shining through some windows."  
    sleep 2
    space
    puts "You walk over to further investigate and realize that there is some strange activity in Wyncode." 
    space
    puts "You step inside and notice there is a split in the path." 
    sleep 3
    space
    puts  "On the left you here faint voices and on the right you smell what seems to be fried chicken."  
    sleep 2
    space
    puts  "Do you go (left) to voices or (right) to the fried chicken?"
    space
  end

  def chicken_scene_2(voice, character_name, human_health)
    puts "You are starving and can't help but follow the smell of chicken."
    space

    `say -v "#{voice}" "I must follow the smell of the chicken!"`


    sleep 2
    puts "You continue down the path and notice an enormous chicken roasting over an open fire."
    sleep 2
    `say -v "#{voice}" "My god. This chicken looks amazing! I must take a little bite."`
    `say -v "Daniel" "#{character_name} heads towards the chicken and takes a rediculously big bite."`
    `say -v "#{voice}" "Wow. This is the best chicken I have ever had."`

    system "clear"
    sleep 1
    `say -v "Daniel" "#{character_name}'s health has increased by 10 points to #{human_health.to_s} points. 
    However, as #{character_name} is enjoying the delicious chicken, 
    five furious trolls emerge."`

    WynDungeon.new.print_troll

    3.times do |f|
      `afplay /System/Library/Sounds/Sosumi.aiff` * f
    end

    system "clear"

    puts "One of the trolls comes running towards you.",
    "Do you fight with the troll?",
    "(y) or (n)"
  end
end