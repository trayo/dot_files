Pry::Commands.block_command 'jk', "Alias for 'exit!'" do
  exit
end

Pry::Commands.block_command 'pl', "Alias for 'play -l'" do |lines|
  _pry_.run_command("play -l #{lines}")
end

Pry.config.editor = "vim"

Pry.config.prompt_name = "🙏  "

