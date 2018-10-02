# frozen_string_literal: true

# rubocop:disable all
# Seeds for a Language model in a standard Relational Database.
# Schema is:
# Country { name: 'String', native: 'String', family: 'String', scope: 'String', type_of: 'String', iso_639_1: 'String', iso_639_2b: 'String', iso_639_3: 'String' }
#
[
  { name: '', native: '', family: '', scope: '', type_of: '', iso_639_1: '', iso_639_2b: '', iso_639_3: '' },
  { name: '', native: '', family: '', scope: '', type_of: '', iso_639_1: '', iso_639_2b: '', iso_639_3: '' },
  { name: '', native: '', family: '', scope: '', type_of: '', iso_639_1: '', iso_639_2b: '', iso_639_3: '' },
  { name: '', native: '', family: '', scope: '', type_of: '', iso_639_1: '', iso_639_2b: '', iso_639_3: '' },
  { name: '', native: '', family: '', scope: '', type_of: '', iso_639_1: '', iso_639_2b: '', iso_639_3: '' },
  { name: '', native: '', family: '', scope: '', type_of: '', iso_639_1: '', iso_639_2b: '', iso_639_3: '' },
  { name: '', native: '', family: '', scope: '', type_of: '', iso_639_1: '', iso_639_2b: '', iso_639_3: '' },
  { name: '', native: '', family: '', scope: '', type_of: '', iso_639_1: '', iso_639_2b: '', iso_639_3: '' },
].each do |l|
  Language.create(name: l[:name], native: l[:native], family: l[:family], scope: l[:scope], type_of: l[:type_of], iso_639_1: l[:iso_639_1], iso_639_2b: l[:iso_639_2b], iso_639_3: l[:iso_639_3])
end
