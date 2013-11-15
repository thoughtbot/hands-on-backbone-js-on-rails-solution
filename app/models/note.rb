class Note < ActiveRecord::Base
  validate :body, presence: true

  belongs_to :body, polymorphic: true, autosave: true, inverse_of: :note, dependent: :destroy
end
