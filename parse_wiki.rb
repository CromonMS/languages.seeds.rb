require 'nokogiri'
require 'open-uri'

# Fetch and parse the Wikipedia page
url = 'https://en.wikipedia.org/wiki/List_of_ISO_639_language_codes'
html = URI.open(url)
doc = Nokogiri::HTML(html)

# Locate the first table with class 'wikitable'
table = doc.at('table.wikitable')

# Initialize an array to hold the language data
languages = []

# Iterate over each row in the table
table.css('tr').each do |row|
  cells = row.css('td')
  next if cells.empty?  # Skip header or empty rows

  # Extract the relevant data from each cell, stripping whitespace and handling nil values
  name = cells[0]&.text&.strip || ''
  iso_639_1 = cells[1]&.text&.strip || ''
  iso_639_2t = cells[2]&.text&.strip || ''
  iso_639_2b = cells[3]&.text&.strip || ''
  iso_639_3 = cells[4]&.text&.strip&.slice(0, 3) || ''  # Take only the first 3 characters
  scope = cells[5]&.text&.strip || ''
  type_of = cells[6]&.text&.strip || ''
  endonyms = cells[7]&.text&.strip || ''
  other_names = cells[8]&.text&.strip || ''
  notes = cells[9]&.text&.strip || ''

  # Escape single quotes in the text
  name = name.gsub("'", "\\\\'")
  endonyms = endonyms.gsub("'", "\\\\'")
  other_names = other_names.gsub("'", "\\\\'")
  notes = notes.gsub("'", "\\\\'")

  # Append the data to the languages array
  languages << {
    name: name,
    iso_639_1: iso_639_1,
    iso_639_2t: iso_639_2t,
    iso_639_2b: iso_639_2b,
    iso_639_3: iso_639_3,
    scope: scope,
    type_of: type_of,
    endonyms: endonyms,
    other_names: other_names,
    notes: notes
  }
end

# Write the languages data to a seeds file
File.open('languages.seeds.rb', 'w') do |file|
  file.write("languages = [\n")
  languages.each do |language|
    file.write("  { name: '#{language[:name]}', iso_639_1: '#{language[:iso_639_1]}', iso_639_2t: '#{language[:iso_639_2t]}', iso_639_2b: '#{language[:iso_639_2b]}', iso_639_3: '#{language[:iso_639_3]}', scope: '#{language[:scope]}', type_of: '#{language[:type_of]}', endonyms: '#{language[:endonyms]}', other_names: '#{language[:other_names]}', notes: '#{language[:notes]}' },\n")
  end
  file.write("]\n\n")
  file.write("languages.each do |language|\n")
  file.write("  Language.create!(language)\n")
  file.write("end\n")
end

puts 'languages.seeds.rb file has been generated.'
