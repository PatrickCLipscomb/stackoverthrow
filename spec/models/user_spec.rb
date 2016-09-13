require 'rails_helper'

describe User do
  it { should validate_presence_of :email }
  it { should validate_presence_of :password_hash }
  it { should validate_presence_of :password_salt }
  it {should have_many :questions }
end
