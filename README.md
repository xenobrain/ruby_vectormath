# ruby_vectormath

Vector Math library written in pure Ruby

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
