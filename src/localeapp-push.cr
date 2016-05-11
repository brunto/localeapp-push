require "./localeapp-push/*"
require "progress"

module Localeapp::Push
  unless ARGV.size == 2
    puts "Usage: localeapp-push /path/to/my/locales LocaleAppKey"
    exit
  end

  green = "\u001b[42m \u001b[0m"
  red = "\u001b[41m \u001b[0m"

  bar = ProgressBar.new
  bar.complete = green
  bar.incomplete = red

  dir = File.join(ARGV[0], "*")
  files = Dir[dir]
  bar.total = files.size
  
  files.each do |file|
    bar.inc
    puts "\n"
    puts `localeapp -k #{ARGV[1]} push #{file}`
    sleep 1.5
  end
end
