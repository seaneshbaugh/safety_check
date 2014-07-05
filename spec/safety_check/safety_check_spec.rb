require 'spec_helper'

describe SafetyCheck do
  describe 'safety_check' do
    it 'instance methods should not raise an error when the correct type of argument is used' do
      hi = Hello.new

      expect(hi.greetings('world')).to eq('Hello, world!')
    end

    it 'instance methods should raise an error when the wrong type of argument is used' do
      hi = Hello.new

      expect { hi.greetings(5) }.to raise_error
    end

    it 'instance methods should raise an error when the wrong number of argument is used' do
      hi = Hello.new

      expect { hi.greetings('world', 'lol') }.to raise_error
    end

    it 'instance methods should not raise an error if optional arguments are ommited' do
      hi = Hello.new

      expect(hi.moshi_moshi('world')).to eq('Hello from Japan, world!')
    end

    it 'instance methods should not raise an error when the correct type of argument is used for optional arguments' do
      hi = Hello.new

      expect(hi.moshi_moshi('world', 'Sweden')).to eq('Hello from Sweden, world!')
    end

    it 'instance methods should raise an error when the wrong type of argument is used for optional arguments' do
      hi = Hello.new

      expect { hi.moshi_moshi('world', 5) }.to raise_error
    end

    it 'instance methods should not raise an error when the correct type of argument is used and a block is passed' do
      hi = Hello.new

      expect(
        hi.hallo('world') do |subject|
          "what a wonderful #{subject}"
        end
      ).to eq('Hi, what a wonderful world!')
    end

    it 'instance methods should raise an error when the wrong type of argument is used and a block is passed' do
      hi = Hello.new

      expect do
        hi.hallo(5) do |subject|
          "what a wonderful #{subject}"
        end
      end.to raise_error
    end

    it 'class methods should not raise an error when the correct type of argument is used' do
      expect(Hello.salutations('world')).to eq('Good day, world!')
    end

    it 'class methods should raise an error when the wrong type of argument is used' do
      expect { Hello.salutations(5) }.to raise_error
    end

    it 'class methods should raise an error when the wrong number of argument is used' do
      expect { Hello.salutations('world', 'lol') }.to raise_error
    end

    it 'class methods should not raise an error if optional arguments are ommited' do
      expect(Hello.ohayou_gozaimasu('world')).to eq('Good morning from Japan, world!')
    end

    it 'class methods should not raise an error when the correct type of argument is used for optional arguments' do
      expect(Hello.ohayou_gozaimasu('world', 'Sweden')).to eq('Good morning from Sweden, world!')
    end

    it 'class methods should raise an error when the wrong type of argument is used for optional arguments' do
      expect { Hello.ohayou_gozaimasu('world', 5) }.to raise_error
    end

    it 'class methods should not raise an error when the correct type of argument is used and a block is passed' do
      expect(
        Hello.guten_morgen('world') do |subject|
          "from a distant #{subject}"
        end
      ).to eq('Good morning, from a distant world!')
    end

    it 'class methods should raise an error when the wrong type of argument is used and a block is passed' do
      expect do
        Hello.guten_morgen(5) do |subject|
          "from a distant #{subject}"
        end
      end.to raise_error
    end
  end
end
