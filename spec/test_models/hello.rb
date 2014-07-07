class Hello
  include SafetyCheck

  def greetings(subject)
    "Hello, #{subject}!"
  end
  safety_check :greetings, String

  def moshi_moshi(subject, location = '')
    if location == ''
      "Hello from Japan, #{subject}!"
    else
      "Hello from #{location}, #{subject}!"
    end
  end
  safety_check :moshi_moshi, String, String

  def hallo(subject)
    new_subject = yield subject

    "Hi, #{new_subject}!"
  end
  safety_check :hallo, String

  def salut(subject)
    "Salut, #{subject}!"
  end
  safety_check :salut, [String, Symbol]

  def self.salutations(subject)
    "Good day, #{subject}!"
  end
  safety_check :salutations, String

  def self.ohayou_gozaimasu(subject, location = '')
    if location == ''
      "Good morning from Japan, #{subject}!"
    else
      "Good morning from #{location}, #{subject}!"
    end
  end
  safety_check :ohayou_gozaimasu, String, String

  def self.guten_morgen(subject)
    new_subject = yield subject

    "Good morning, #{new_subject}!"
  end
  safety_check :guten_morgen, String

  def self.bonjour(subject)
    "Bonjour, #{subject}!"
  end
  safety_check :bonjour, [String, Symbol]
end
