class Hello
  include SafetyCheck

  def greetings(subject)
    "Hello, #{subject}!"
  end
  safety_check :greetings, String

  def self.salutations(subject)
    "Good day, #{subject}!"
  end
  safety_check :salutations, String
end
