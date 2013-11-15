class StickyNote < ActiveRecord::Base
  has_one :note, as: :body
  after_save :touch_note

  private

  def touch_note
    note.touch
  end
end
