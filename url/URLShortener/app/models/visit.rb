class Visit < ApplicationRecord
  def self.record_visit!(user, shortened_url)
    options = {
      user_id: user.id,
      shortened_url_id: shortened_url.id
    }

    Visit.create!(options)
  end

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :shortened_url,
    primary_key: :id,
    foreign_key: :shortened_url_id,
    class_name: :ShortenedUrl

end
