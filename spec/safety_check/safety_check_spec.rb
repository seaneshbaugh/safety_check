require 'spec_helper'

describe SafetyCheck do
  describe 'safety_check' do
    it 'instance methods should not raise an error when the correct type of argument is used' do
      hi = Hello.new

      expect(hi.greetings('world')).to eq("Hello, world!")
    end

    it 'instance methods should raise an error when the wrong type of argument is used' do
      hi = Hello.new

      expect { hi.greetings(5) }.to raise_error
    end

    it 'instance methods should raise an error when the wrong number of argument is used' do
      hi = Hello.new

      expect { hi.greetings('world', 'lol') }.to raise_error
    end

    it 'class methods should not raise an error when the correct type of argument is used' do
      expect(Hello.salutations('world')).to eq("Good day, world!")
    end

    it 'class methods should raise an error when the wrong type of argument is used' do
      expect { Hello.salutations(5) }.to raise_error
    end

    it 'class methods should raise an error when the wrong number of argument is used' do
      expect { Hello.salutations('world', 'lol') }.to raise_error
    end
  end
end
