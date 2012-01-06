# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

['Acme Quote', 'Big Business Quote', 'Google Quote'].each do |title|
  Quote.find_or_create_by_title title
end

Section.find_or_create_by_description('Engineering', quote: Quote.first).tap do |section|
  Item.find_or_create_by_description 'Determine / validate data model and generate Entity Relationship Diagram', parent: section, min_hours: 2, max_hours: 4
  Item.find_or_create_by_description 'Application modeling / high-level system planning - diagram each portion of the UI / wireframing', parent: section, min_hours: 4, max_hours: 8
  Item.find_or_create_by_description "Generate user stories to outline the system's functionality from the business's perspective", parent: section, min_hours: 2, max_hours: 4
  Item.find_or_create_by_description 'Server setup, SSL procurement, etc.', parent: section, min_hours: 0, max_hours: 0
end

Section.find_or_create_by_description 'Design', quote: Quote.first
Section.find_or_create_by_description 'Development', quote: Quote.first
Section.find_or_create_by_description 'Testing', quote: Quote.first
Section.find_or_create_by_description 'QA', quote: Quote.first

