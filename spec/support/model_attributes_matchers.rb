RSpec::Matchers.define :be_accessible do |attribute|
  match do |response|
    response.send "#{attribute}=", :foo
    response.send("#{attribute}").eql? :foo
  end
  description { "be accessible :#{attribute}" }
  failure_message_for_should { ":#{attribute} should be accessible" }
  failure_message_for_should_not { ":#{attribute} should not be accessible" }
end

RSpec::Matchers.define :be_readable do |attribute, value|
  match do |response|
    response.send("#{attribute}").eql? value
  end
  description { "be readable :#{attribute}" }
  failure_message_for_should { ":#{attribute} should be readable" }
  failure_message_for_should_not { ":#{attribute} should not be readable" }
end