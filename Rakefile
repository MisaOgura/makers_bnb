require 'data_mapper'
require './app/controller'

namespace :db do

  desc 'Non destructive upgrade'
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts 'auto_upgrade complete, no data loss'
  end

  desc 'Destructive upgrade'
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts 'auto_migrate complete, data was lost'
  end
end
