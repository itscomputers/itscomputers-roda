module Helpers
  Dir["./helpers/*.rb"].each do |helper_file|
    load helper_file
    module_name = helper_file.split("/").last.gsub(".rb", "")
    object = Helpers.const_get module_name.split("_").map(&:capitalize).join
    include object unless object.is_a? Class
  end
end

