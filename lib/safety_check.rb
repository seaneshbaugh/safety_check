module SafetyCheck
  def self.included(base)
    base.send :extend, ClassMethods
  end

  module ClassMethods
    def safety_check(method_name, *arg_types)
      if self.methods.include?(method_name)
        receiver = self.singleton_class
      elsif self.instance_methods.include?(method_name)
        receiver = self
      else
        raise NoMethodError, "undefined method '#{method_name}' for #{receiver.inspect}"
      end

      unsafe_method_name = "#{method_name.to_s}_without_type_safety".to_sym

      required_arity = receiver.instance_method(method_name).parameters.select { |type, name| type == :req }.length

      if arg_types.length < required_arity
        raise ArgumentError, "wrong number of arguments for #{method_name.inspect} (#{arg_types.length} for #{required_arity})"
      end

      receiver.send(:alias_method, unsafe_method_name, method_name)

      receiver.send(:define_method, method_name) do |*args, &block|
        if args.length < required_arity
          raise ArgumentError, "wrong number of arguments (#{args.length} for #{arg_types.length}) when calling #{method_name.inspect}"
        end

        args.zip(arg_types).each do |arg, arg_type|
          unless arg.is_a? arg_type
            raise ArgumentError, "expected #{arg.inspect} to be a #{arg_type} when calling #{method_name.inspect}"
          end
        end

        self.send(unsafe_method_name, *args, &block)
      end
    end
  end
end
