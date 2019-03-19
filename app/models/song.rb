class Song < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: {scope: [:release_year, :artist_name]}
  validates :released, inclusion: { in: [true,false]}
  validates :artist_name, presence: true

  validates :release_year, numericality: { less_than_or_equal_to: Time.now.year },
    if: :released_status

  def released_status
    released
  end 

end
