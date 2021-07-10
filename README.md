# ruby_vectormath

Vector Math library written in carefully optimized pure Ruby.  Supports usage patterns that avoid any implicit memory allocation.

```ruby
vec2_a = Vec2.new(1.1, 2.2)
vec2_b = Vec2.new(3.3, 4.4)

# mutates vec2_a
vec2_a.add!(vec2_b)

# shallow copy of vec2_a
vec2_result = vec2_a + vec2_b

# sets vec2_result to the result
vec2_result.add_from!(vec2_a, vec2_b)
```
