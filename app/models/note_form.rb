class NoteForm < Struct.new(:note, :params)
  def save
    note.body ||= StickyNote.new
    note.attributes = note_attributes
    note.body.attributes = body_attributes
    note.save
  end

  private

  def note_attributes
    params.permit(:title)
  end

  def body_attributes
    params.require(:body).require(:sticky_note).permit(:content)
  end
end
