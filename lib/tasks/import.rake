namespace :db do
  namespace :import do
    desc 'Import a production dump into development'
    task :production => [:protect_prod, :capture_prod_db, :download_prod_db, :environment] do
      target_db = YAML.load_file(File.join(Rails.root, 'config/database.yml'))[Rails.env]['database']
      puts `pg_restore --verbose --clean -d #{target_db} tmp/backup.dump`
      `rm tmp/backup.dump`
    end
  end

  namespace :push do
    desc 'Push production data out to staging'
    task :staging => [:capture_prod_db] do
      exec "heroku pg:backups capture DATABASE_URL '#{backup_url}' --remote staging"
    end
  end
end

task :protect_prod => :environment do
  return false if Rails.env.production?
end

task :capture_prod_db do
  puts `heroku pg:backups capture --remote heroku`
end

task :download_prod_db do
  `curl -o tmp/backup.dump -O "#{backup_url}"`
end

def backup_url
  `heroku pg:backups public-url --remote heroku`
end
