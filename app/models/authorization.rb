class Authorization < ActiveRecord::Base
  belongs_to :created_by_api_key, :class_name => "ApiKey"
end
