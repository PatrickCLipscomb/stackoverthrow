require 'rails_helper'

describe Response do
  it { should validate_presence_of :author}
  it { should validate_presence_of :content}
  it { should belong_to :question}
end
