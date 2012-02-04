require 'spec_helper'

describe TokenSerializer do
  let(:token) { stub_model(Token,
                           user: stub_model(User,
                                            id: 17,
                                            email: 'tom@smith.net'),
                           created_at: Time.parse('January 22, 2010 5:55PM'),
                           updated_at: Time.parse('January 22, 2010 5:56PM')) }
  let(:serializer) { TokenSerializer.new(token) }
  let(:json) { JSON.parse(serializer.to_json) }

  describe "#to_json" do
    it "should include created_at" do
      Time.parse(json['created_at']).should == token.created_at
    end

    it "should include updated_at" do
      Time.parse(json['updated_at']).should == token.updated_at
    end

    it "should include the user's e-mail address" do
      json['user']['email'].should == 'tom@smith.net'
    end

    it "should include the user's unique id" do
      json['user']['id'].should == 17
    end
  end
end
