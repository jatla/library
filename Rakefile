# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.
require 'rdoc/task'
require File.expand_path('../config/application', __FILE__)

Library::Application.load_tasks

RDoc::Task.new :rdoc do |rdoc|
  rdoc.main = "README.rdoc"

  rdoc.rdoc_files.include("README.rdoc", "doc/*.rdoc", "app/**/*.rb", "lib/*.rb", "config/**/*.rb")
  #change above to fit needs

  rdoc.title = "Documentation for 'Library'"
  rdoc.options << "--all" 
end