# frozen_string_literal: true

require 'rake/testtask'
require 'sequel'
require 'sequel/extensions/migration'
require_relative 'database/seeder'

task default: :unit_tests

Rake::TestTask.new(:unit_tests) do |t|
  t.libs << 'tests'
  t.pattern = 'tests/**/*_tests\.rb'
  t.warning = false
end

namespace :db do
  desc 'Run database migrations'
  task :migrations do
    Sequel::Migrator.run(Services[:database],
                         File.join(File.dirname(__FILE__), 'database/migrations'),
                         use_transactions: true)
  end

  desc 'Run database seeds'
  task :seeds, :environment do |_task, args|
    Seeder.run_seeds!(args[:environment])
  end
end
