class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :captured_images, dependent: :destroy

  accepts_nested_attributes_for :captured_images, reject_if: :reject_sub_images, allow_destroy: true

  validates :title,
            :catch_copy,
            :concept,
            presence: true

  def reject_sub_images(attributed)
    attributed['content'].blank?
    attributes.merge!(_destroy: 1) if attributed['content'].blank?
  end

  def set_main_thumbnail
    captured_images.main.first.content
  end

  def set_sub_thumbnail
    captured_images.sub
  end

  def posted_date
    created_at.strftime('%b %d %a')
  end
end
