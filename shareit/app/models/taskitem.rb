class Taskitem < ActiveRecord::Base
  belongs_to :list
  belongs_to :volunteer, class_name: "Board"
end
