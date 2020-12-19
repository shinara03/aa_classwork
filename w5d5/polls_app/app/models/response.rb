# == Schema Information
#
# Table name: responses
#
#  id               :bigint           not null, primary key
#  user_id          :integer          not null
#  answer_choice_id :integer          not null
#
class Response < ApplicationRecord
  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
end
