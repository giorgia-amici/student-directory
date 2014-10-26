def get_response(input)
  key = RESPONSES.keys.select {|k| /#{k}/ =~ input }.sample
  /#{key}/ =~ input
  response = RESPONSES[key]
  response.nil? ? 'sorry?' : response % { c1: $1, c2: $2}
end

def colorize(text, color_code)
  "\e[#{color_code}m#{text}\e[0m"
end

def red(text)
 colorize(text, 31)
end

def green(text) 
  colorize(text, 32)
end

def display_bot_conversations
  File.open('conversations.txt', 'a+') do |sentence|
    while line = sentence.gets
      puts line
    end
  end
end

def save_conversations(bot_input)
  File.open('conversations.txt', 'a+') do |file|   
    file.write("Bot>> " + bot_input + "\n")
  end 
end



RESPONSES = { 'goodbye' => 'bye', 
              'sayonara' => 'sayonara', 
              'the weather is (.*)' => 'I hate it when it\'s %{c1}', 
              'I love (.*)' => 'I love %{c1} too', 
              'I groove to (.*) and (.*)' => 'I love %{c1} but I hate %{c2}',
          		'(.*) bot' => 'You need to ask my creator, about me being a bot ',
          		'(.*) human' => 'I\'m a different sort of human',
          		'(\d)' => 'Not sure if that\'s a bit too much',
          		'(.*) or' => 'I think I prefer the first option',
          		"(.*\"\?\")" => 'I don\'t know what to say to that',
          		'(.*)' => 'I can\'t help you with that statement, please can you refrase'
          	}

display_bot_conversations

puts "Bot>> " + green("Hello, what's your name?")
print "Human>> "
name = gets.chomp
puts "Human>> " + red(name)
puts "Bot>> " + green("Hello #{name}\"")
while true do
	print "Human>> "
	input = gets.chomp
	puts "Human>> " + red(input)

	break if input == "quit"
  puts "Bot>> " + green(get_response(input))
  save_conversations(get_response(input))
end