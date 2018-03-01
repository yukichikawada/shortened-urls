class ShortenedUrl < ApplicationRecord
  validates :long_url, :short_url, :user_id, presence: true, uniqueness: true

  def self.random_code
    random_num = SecureRandom::urlsafe_base64(16)

    while ShortenedUrl.exists?(:short_url => random_num)
      random_num = SecureRandom::urlsafe_base64(16)
    end

    random_num
  end

  def self.factory_shortened_url(user, long_url)
    shortened_url = ShortenedUrl.random_code

    options = {
      long_url: long_url,
      short_url: shortened_url,
      user_id: user.id
    }

    ShortenedUrl.create!(options)
  end

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
end
