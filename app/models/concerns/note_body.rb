module NoteBody
  extend ActiveSupport::Concern

  included do
    has_one :note, as: :body
    after_save :touch_note
  end

  private

  def touch_note
    note.touch
  end
end
