require 'spec_helper'

describe Authorization do
  it { should belong_to(:created_by_api_key) }
  it { should belong_to(:user) }
end
