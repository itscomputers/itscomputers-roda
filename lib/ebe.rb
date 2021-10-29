module Ebe
  Dir["lib/ebe/**/*.rb"].each(&method(:load))

  extend Ebe::Division
end

