class Note < ActiveRecord::Base
  validate :ensure_title_or_content

  private

  def ensure_title_or_content
    unless title.present? or content.present?
      errors.add(:title, "Must provide a title or content")
    end
  end
end
