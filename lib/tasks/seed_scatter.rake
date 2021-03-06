namespace :db do
  task :seed => :environment do
    SeedScatter::Engine.load_seed
  end
  desc "Dump model seeds"
  task :harvest, [:model] => :environment do |t,args|
    args.with_defaults(:model => :all)
    SeedScatter::Harvester.new.init args[:model]
  end
  task :reseed, [:model] => :environment do |t,args|
    SeedScatter::Harvester.new.reseed args[:model]
  end
end
