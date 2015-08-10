namespace :pg do
  desc "Drop the postgresql connections"
  task :disconnect do
    conf = Rails.configuration.database_configuration[Rails.env]
    return unless conf['adapter'] == 'postgresql'
    db   = conf['database']
    cmd  = "psql postgres -c \"select pg_terminate_backend(pid) from pg_stat_activity where datname='#{db}'\""
    system(cmd)
  end
end

namespace :rebuild do
  desc "Rebuild from backup"
  task :from_production => %w(pg:disconnect db:drop db:create) do
    exec({'HOME'=>ENV['HOME'],'PATH'=>ENV['PATH']},"development restore production && bundle exec rake db:migrate", :unsetenv_others => true)
  end

  desc "Rebuild the staging heroku environment"
  task :staging do
    exec({'HOME'=>ENV['HOME'],'PATH'=>ENV['PATH']},"staging pg:reset DATABASE_URL --confirm staging-lms && staging run rake db:migrate db:seed", :unsetenv_others => true)
  end

  desc "Rebuild a base version"
  task :base =>  %w(pg:disconnect db:drop db:create db:migrate) unless Rails.env.production?

  desc "Rebuild for development"
  task :development  =>  %w(rebuild:base db:seed)  unless Rails.env.production?

  desc "Rebuild for heroku"
  task :heroku =>  %w(db:migrate db:seed)

  desc "Rebuild a review version after a switch"
  task :review =>  %w(pg:disconnect db:drop db:create db:migrate db:seed) if Rails.env.development?
end

task :rebuild => "rebuild:development"

task :clean => %w(assets:clobber log:clear) do
  `rm -rf docs coverage tmp`
end