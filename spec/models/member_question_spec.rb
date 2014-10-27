require 'rails_helper'

describe MemberQuestion do

  it {should validate_presence_of :join}

  it 'should return errors if join value other than true or false' do
    %w(test test2).each do |value|
      member_question = MemberQuestion.new
      member_question.join=value
      expect(member_question.valid?).to be false
    end
  end

end