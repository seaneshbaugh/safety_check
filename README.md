#Safety Check

Selectively add type safety to your methods.

# Usage

```ruby
class Widget
  include SafetyCheck

  def foo(a, b, c)
    # ...
  end
  safety_check :foo, String, Fixnum, Symbol
end
```
