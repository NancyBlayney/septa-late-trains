desc "Runs the scheduler to check for reminders and send out alerts"
task :check_reminders => :environment do
  Scheduler.run
end
