class MemberQuestion

  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :join

  validates :join, presence: true

end