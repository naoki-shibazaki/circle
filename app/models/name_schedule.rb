# == Schema Information
#
# Table name: name_schedules
#
#  id          :integer          not null, primary key
#  answer      :integer
#  comment     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  name_id     :integer
#  schedule_id :integer
#
# Indexes
#
#  index_name_schedules_on_name_id      (name_id)
#  index_name_schedules_on_schedule_id  (schedule_id)
#
# Foreign Keys
#
#  name_id      (name_id => names.id)
#  schedule_id  (schedule_id => schedules.id)
#
class NameSchedule < ApplicationRecord
  belongs_to :name
  belongs_to :schedule
end
