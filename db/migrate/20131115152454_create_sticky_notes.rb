class CreateStickyNotes < ActiveRecord::Migration
  def change
    create_table :sticky_notes do |t|
      t.string :content

      t.timestamps
    end

    change_table :notes do |t|
      t.belongs_to :body, polymorphic: true
    end

    reversible do |dir|
      dir.down { add_column :notes, :content, :string }

      Note.reset_column_information
      Note.all.each do |note|
        dir.up { note.body = StickyNote.create(content: note.send(:read_attribute, :content)) }
        dir.down { note.send(:write_attribute, :content, note.body.content) }
        note.save!
      end

      dir.up { remove_column :notes, :content }
    end
  end
end
