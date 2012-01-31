# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create! email: 'user@example.com', password: 'secretpass', password_confirmation: 'secretpass'

['Adjustments Calculator', 'Transaction Processor', 'Flight Plan Recorder'].each do |description|
  Quote.find_or_create_by_description description
end

Quote.first.tap do |quote|
  Section.find_or_create_by_description('Engineering', parent: quote).tap do |section|
    Item.find_or_create_by_description 'Determine / validate data model and generate Entity Relationship Diagram', parent: section, min_hours: 2, max_hours: 4
    Item.find_or_create_by_description 'Application modeling / high-level system planning - diagram each portion of the UI / wireframing', parent: section, min_hours: 4, max_hours: 8
    Item.find_or_create_by_description "Generate user stories to outline the system's functionality from the business's perspective", parent: section, min_hours: 2, max_hours: 4
    Item.find_or_create_by_description 'Server setup, SSL procurement, etc.', parent: section, min_hours: 0, max_hours: 0
  end

  Section.find_or_create_by_description('Design', parent: quote).tap do |section|
    Item.find_or_create_by_description 'UI/UX Design, Layout for main application, associated stylesheets / html mockups', parent: section, min_hours: 12, max_hours: 18
  end

  Section.find_or_create_by_description('Development', parent: quote).tap do |section|
    Section.find_or_create_by_description('Supporting Library Development', parent: section).tap do |subsection|
      Item.find_or_create_by_description 'Importer libraries (import CSV exports of all data needed for backend for calculation)', parent: subsection, min_hours: 8, max_hours: 10
      Item.find_or_create_by_description 'Calculator library', parent: subsection, min_hours: 26, max_hours: 45
    end
    Section.find_or_create_by_description('Data Models', parent: section).tap do |subsection|
      Item.find_or_create_by_description 'User authentication, registration, roles system - implementing Devise + CanCan', parent: subsection, min_hours: 0, max_hours: 0
      Item.find_or_create_by_description 'Data models to support various import files (these should be basic)', parent: subsection, min_hours: 4, max_hours: 6
      Item.find_or_create_by_description 'Forecast data model (to store a given forecast)', parent: subsection, min_hours: 6, max_hours: 10
    end
  end

  Section.find_or_create_by_description('Testing', parent: quote).tap do |section|
    Item.find_or_create_by_description 'Supporting libraries - unit tests', parent: section, min_hours: 6, max_hours: 12
  end

  Section.find_or_create_by_description('QA', parent: quote).tap do |section|
    Item.find_or_create_by_description 'Cross Browser testing/fixes', parent: section, min_hours: 12, max_hours: 16
  end
end

ItemTemplate.create description: 'Default Template', min_hours: 0, max_hours: 0
