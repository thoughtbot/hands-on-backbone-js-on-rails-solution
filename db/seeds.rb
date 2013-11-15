Note.destroy_all

Note.create(title: "The first note",  body: StickyNote.new(content: "I am a note!"))
Note.create(title: "The second note", body: StickyNote.new(content: ""))
Note.create(title: "The third note",  body: StickyNote.new(content: "more notes"))
