require 'socket'
 
server  = 'irc.libera.chat'
port    = 6667
socket  = TCPSocket.open(server, port)
 
nickname = 'SkillcrushBotOMG'
channel = "#bananastandnew890"
 
socket.puts "NICK #{nickname}"
socket.puts "USER #{nickname} 0 * #{nickname}"
socket.puts "JOIN #{channel}"

socket.puts "PRIVMSG #{channel} :I am so happy to be here!"
 



while message = socket.gets do 
    puts message

    if message.match('^PING :')
        server = message.split(':').last
        puts "PONG #{server}"
        socket.puts "PONG #{server}"
    elsif message.match('How are you?')
        puts "PRIVMSG #{channel} :I'm great, thanks!"
        socket.puts "PRIVMSG #{channel} :I'm great, thanks!"
    elsif message.match('BFFBot I feel down, inspire me!')
        puts "PRIVMSG #{channel} :It is during our darkest moments that we must focus to see the light. - Aristotle"
        socket.puts "PRIVMSG #{channel} :It is during our darkest moments that we must focus to see the light. - Aristotle"
    elsif message.match("BFFBot, who is your best friend?")
        friendName = File.read("name.txt")
        socket.puts "PRIVMSG #{channel} :#{friendName}!"
    

    end
end


