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

      if arg_types.length != receiver.instance_method(method_name).arity
        raise ArgumentError, "wrong number of arguments for #{method_name.inspect} (#{arg_types.length} for #{receiver.instance_method(method_name).arity})"
      end

      receiver.send(:alias_method, unsafe_method_name, method_name)

      receiver.send(:define_method, method_name) do |*args|
        if args.length != arg_types.length
          raise ArgumentError, "wrong number of arguments (#{args.length} for #{arg_types.length}) when calling #{method_name.inspect}"
        end

        arg_types.zip(args).each do |arg_type, arg|
          unless arg.is_a? arg_type
            raise ArgumentError, "expected #{arg.inspect} to be a #{arg_type} when calling #{method_name.inspect}"
          end
        end

        self.send(unsafe_method_name, *args)
      end
    end
  end
end
