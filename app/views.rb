require_relative './views/base'

module Views
  Dir["app/views/**/*.rb"].each(&method(:load))
end

