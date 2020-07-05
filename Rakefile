# frozen_string_literal: true

require 'rake/testtask'

task default: :unit_tests

Rake::TestTask.new(:unit_tests) do |t|
  t.libs << 'tests'
  t.pattern = 'tests/**/*_tests\.rb'
  t.warning = false
end
