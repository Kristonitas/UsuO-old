class Form < ActiveRecord::Base
  belongs_to :student
  belongs_to :institution
end
