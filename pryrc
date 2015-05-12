Pry::Commands.block_command /(jk)(jk)*/, "Alias for exit" do
   captures[1] ? _pry_.run_command('exit') : exit
end

Pry.config.editor = "vim"

Pry.config.prompt_name = "🙏  "

