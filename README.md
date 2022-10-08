# ruby_vectormath

Vector Math library written in pure Ruby

Vec2 and Mat2x2 are in 'vectormath_2d.rb'.  Vec3, Vec4, Mat3x3, Mat4x4 are in 'vectormath_3d.rb'

It's designed to be:

## Fast!
Virtually every design decision was arrived at through extensive benchmarking in the DragonRuby runtime.
The key feature and reason for the library's creation are the #_from! methods which perform computation with the provided parameters and set the result to the calling vector.
This allows the user to fully control when memory allocation occurs for a *massive* performance increase in loops with high iteration counts

## Nice!
The API is as nice and ruby-ish as possible without trading performance.  Lots of functions!

## Free!
Released under public domain / Unlicense so copy/paste away

## Contributors
Thanks to Lyniat for the matrix code!

[![Coverity Scan Build Status](https://scan.coverity.com/projects/24654/badge.svg)](https://scan.coverity.com/projects/xenobrain-ruby_vectormath)

## Example

# Given
```ruby
vec2_a = Vec2.new(1.1, 2.2)
vec2_b = Vec2.new(3.3, 4.4)
vec2_c = Vec2.new(4.4, 5.5)
```

Mutating methods are suffixed with '!'
```ruby
# vec2_a is now (4.4, 6.6)
vec2_a.add!(vec2_b)
```

Operators are non mutating
```ruby
# vec2_result is now (4.4, 6.6) but memory was allocated for it, which is slow
vec2_result = vec2_a + vec2_b
```

*_from! methods are mutating and meant to be used on predeclared temporary variables
```ruby
# sets a previously declared vec2_result to (4.4, 6.6) without changing vec2_a or vec2_b.  Much faster!
@vec2_result.add_from!(vec2_a, vec2_b)
```

Methods can be chained
```ruby
@vec2_result.add_from!(vec2_a, vec2_b)
            .normalize!
            .mul!(vec2_c)
```
