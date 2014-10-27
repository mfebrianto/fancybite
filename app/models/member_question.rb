class MemberQuestion

  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :join

  validates :join, presence: true
  validates :join, inclusion: %w(true false)

end