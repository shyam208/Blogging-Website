class Current < ApplicationRecord
    class << self
        attr_accessor :user
    end
end
