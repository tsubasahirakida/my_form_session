class UserForm
  include ActiveModel::Model

  attr_accessor :name, :email, :verify_code

  def initialize(attribute = {})
    @name = attribute['name']
    @email = attribute['email']
  end
end
