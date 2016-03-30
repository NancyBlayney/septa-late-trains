class Reminder < ActiveRecord::Base
belongs_to :user
attr_accessor :monday,:tuesday,:wednesday,:thursday,:friday,:saturday,:sunday


end
