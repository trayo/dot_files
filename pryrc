Pry::Commands.block_command /(jk)(jk)*/, "Alias for exit" do
   captures[1] ? _pry_.run_command('exit') : exit
end

Pry::Commands.block_command 'pl', "Alias for 'play -l'" do |lines|
  _pry_.run_command("play -l #{lines}")
end

Pry.config.editor = "vim"

Pry.config.prompt_name = "🙏  "

