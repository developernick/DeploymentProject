class User < ActiveRecord::Base
  has_many(:chirps)
  def to_s
    self.to_s + 'Shall We Play A Game?'
  end
end
