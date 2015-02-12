# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'factory_girl_rails'
require_relative '../test/support/factories'

FactoryGirl.create(:user, email: 'user@example.com', password: 'secretpass', password_confirmation: 'secretpass')

['Adjustments Calculator', 'Transaction Processor', 'Flight Plan Recorder'].each do |description|
  FactoryGirl.create(:quote, description: description)
end

Quote.first.tap do |quote|
  FactoryGirl.create(:section, description: 'Engineering', parent: quote).tap do |section|
    FactoryGirl.create :item, description: 'Determine / validate data model and generate Entity Relationship Diagram', parent: section, min_hours: 2, max_hours: 4
    FactoryGirl.create :item, description: 'Application modeling / high-level system planning - diagram each portion of the UI / wireframing', parent: section, min_hours: 4, max_hours: 8
    FactoryGirl.create :item, description: "Generate user stories to outline the system's functionality from the business's perspective", parent: section, min_hours: 2, max_hours: 4
    FactoryGirl.create :item, description: 'Server setup, SSL procurement, etc.', parent: section, min_hours: 0, max_hours: 0
  end

  FactoryGirl.create(:section, description: 'Design', parent: quote).tap do |section|
    FactoryGirl.create :item, description: 'UI/UX Design, Layout for main application, associated stylesheets / html mockups', parent: section, min_hours: 12, max_hours: 18
  end

  FactoryGirl.create(:section, description: 'Development', parent: quote).tap do |section|
    FactoryGirl.create(:section, description: 'Supporting Library Development', parent: section).tap do |subsection|
      FactoryGirl.create :item, description: 'Importer libraries (import CSV exports of all data needed for backend for calculation)', parent: subsection, min_hours: 8, max_hours: 10
      FactoryGirl.create :item, description: 'Calculator library', parent: subsection, min_hours: 26, max_hours: 45
    end
    FactoryGirl.create(:section, description: 'Data Models', parent: section).tap do |subsection|
      FactoryGirl.create :item, description: 'User authentication, registration, roles system - implementing Devise + CanCan', parent: subsection, min_hours: 0, max_hours: 0
      FactoryGirl.create :item, description: 'Data models to support various import files (these should be basic)', parent: subsection, min_hours: 4, max_hours: 6
      FactoryGirl.create :item, description: 'Forecast data model (to store a given forecast)', parent: subsection, min_hours: 6, max_hours: 10
    end
  end

  FactoryGirl.create(:section, description: 'Testing', parent: quote).tap do |section|
    FactoryGirl.create :item, description: 'Supporting libraries - unit tests', parent: section, min_hours: 6, max_hours: 12
  end

  FactoryGirl.create(:section, description: 'QA', parent: quote).tap do |section|
    FactoryGirl.create :item, description: 'Cross Browser testing/fixes', parent: section, min_hours: 12, max_hours: 16
  end
end

FactoryGirl.create :item_template, description: 'Default Template', min_hours: 0, max_hours: 0
