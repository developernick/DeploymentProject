class Chirp < ActiveRecrod::Base
  belongs_to(:users)
  def to_s
    self.to_s + 'chirpidy chirpidy chirp'
  end
end
