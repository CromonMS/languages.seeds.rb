# frozen_string_literal: true

#   rails g model Language name:string:index native:string family:string scope:string type_of:string iso_639_1:string iso_639_2b:string iso_639_3:integer:index

# Create Countries migration
class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :name
      t.string :native
      t.string :family
      t.string :scope
      t.string :type_of
      t.string :iso_639_1
      t.string :iso_639_2b
      t.string :iso_639_3

      t.timestamps null: false

      add_index(:countries, :name)
      add_index(:countries, :iso_639_3)
    end
  end
end
