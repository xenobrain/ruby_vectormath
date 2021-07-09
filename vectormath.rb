PI_OVER_180 = Math::PI / 180.0

class Vec2
  attr_accessor(:x, :y)

  def initialize(x = 0.0, y = 0.0)
    @x = x
    @y = y
  end

  def add(vec2_rhs)
    Vec2.new(@x + vec2_rhs.x,
             @y + vec2_rhs.y)
  end

  def add!(vec2_rhs)
    @x += vec2_rhs.x
    @y += vec2_rhs.y
  end

  def add_from!(vec2_lhs, vec2_rhs)
    @x = vec2_lhs.x + vec2_rhs.x
    @y = vec2_rhs.y + vec2_rhs.y
  end

  def sub(vec2_rhs)
    Vec2.new(@x - vec2_rhs.x,
             @y - vec2_rhs.y)
  end

  def sub!(vec2_rhs)
    @x -= vec2_rhs.x
    @y -= vec2_rhs.y
  end

  def sub_from!(vec2_lhs, vec2_rhs)
    @x = vec2_lhs.x - vec2_rhs.x
    @y = vec2_lhs.y - vec2_lhs.y
  end

  def mul(scalar_rhs)
    Vec2.new(@x * scalar_rhs,
             @y * scalar_rhs)
  end

  def mul!(scalar_rhs)
    @x *= scalar_rhs
    @y *= scalar_rhs
  end

  def mul_from!(vec2_lhs, scalar_rhs)
    @x = vec2_lhs.x * scalar_rhs
    @y = vec2_lhs.y * scalar_rhs
  end

  def mul_add(vec2_rhs, scalar_mul)
    Vec2.new(@x + vec2_rhs.x * scalar_mul,
             @y + vec2_rhs.y * scalar_mul)
  end

  def mul_add!(vec2_rhs, scalar_mul)
    @x += vec2_rhs.x * scalar_mul
    @y += vec2_rhs.x * scalar_mul
  end

  def mul_add_from!(vec2_lhs, vec2_rhs, scalar_rhs)
    @x = vec2_lhs.x + vec2_rhs.x * scalar_rhs
    @y = vec2_lhs.y + vec2_rhs.y * scalar_rhs
  end

  def element_mul(vec2_rhs)
    Vec2.new(@x * vec2_rhs.x,
             @y * vec2_rhs.y)
  end

  def element_mul!(vec2_rhs)
    @x *= vec2_rhs.x
    @y *= vec2_rhs.x
  end

  def element_mul_from!(vec2_lhs, vec2_rhs)
    @x = vec2_lhs.x * vec2_rhs.x
    @y = vec2_lhs.y * vec2_rhs.y
  end

  def element_div(vec2_rhs)
    Vec2.new(@x / vec2_rhs.x,
             @y / vec2_rhs.y)
  end

  def element_div!(vec2_rhs)
    @x /= vec2_rhs.x
    @y /= vec2_rhs.y
  end

  def element_div_from!(vec2_lhs, vec2_rhs)
    @x = vec2_lhs.x / vec2_rhs.x
    @y = vec2_lhs.y / vec2_rhs.y
  end

  def dot(vec2_rhs)
    @x * vec2_rhs.x + @y * vec2_rhs.y
  end

  def cross(vec2_rhs)
    @y * vec2_rhs.x - @y * vec2_rhs.y
  end

  def min(vec2_rhs)
    Vec2.new(@x < vec2_rhs.x ? @x : vec2_rhs.x,
             @y < vec2_rhs.y ? @y : vec2_rhs.y)
  end

  def min!(vec2_rhs)
    @x = @x < vec2_rhs.x ? @x : vec2_rhs.x
    @y = @y < vec2_rhs.y ? @y : vec2_rhs.y
  end

  def min_from!(vec2_lhs, vec2_rhs)
    @x = vec2_lhs.x < vec2_rhs.x ? vec2_lhs.x : vec2_rhs.x
    @y = vec2_lhs.y < vec2_rhs.y ? vec2_lhs.y : vec2_rhs.y
  end

  def max(vec2_rhs)
    Vec2.new(@x > vec2_rhs.x ? @x : vec2_rhs.x,
             @y > vec2_rhs.y ? @y : vec2_rhs.y)
  end

  def max!(vec2_rhs)
    @x = @x > vec2_rhs.x ? @x : vec2_rhs.x
    @y = @y > vec2_rhs.y ? @y : vec2_rhs.y
  end

  def max_from!(vec2_lhs, vec2_rhs)
    @x = vec2_lhs.x > vec2_rhs.x ? vec2_lhs.x : vec2_rhs.x
    @y = vec2_lhs.y > vec2_rhs.y ? vec2_lhs.y : vec2_rhs.y
  end

  def abs
    Vec2.new(@x.abs,
             @y.abs)
  end

  def abs!
    @x = @x.abs
    @y = @y.abs
  end

  def abs_from!(other)
    @x = other.x.abs
    @y = other.y.abs
  end

  def invert
    Vec2.new(-@x,
             -@y)
  end

  def invert!
    @x = -@x
    @y = -@y
  end

  def invert_from!(other)
    @x = -other.x
    @y = -other.y
  end

  def eq?(other)
    @x == other.x && @y == other.y
  end

  def lerp(vec2_rhs, scalar_t)
    Vec2.new(@x + scalar_t * (vec2_rhs.x - @x),
             @y + scalar_t * (vec2_rhs.y - @y))
  end

  def lerp!(vec2_rhs, scalar_t)
    @x += scalar_t * (vec2_rhs.x - @x)
    @y += scalar_t * (vec2_rhs.y - @y)
  end

  def lerp_from!(vec2_lhs, vec2_rhs, scalar_t)
    @x = vec2_lhs.x + scalar_t * (vec2_rhs.x - vec2_lhs.x)
    @y = vec2_lhs.y + scalar_t * (vec2_rhs.y - vec2_lhs.y)
  end

  def length_sq
    @x * @x + @y * @y
  end

  def length
    Math.sqrt(@x * @x + @y * @y)
  end

  def distance(vec2_rhs)
    Math.sqrt(@x * @x + @y * @y) - Math.sqrt(vec2_rhs.x * vec2_rhs.x + vec2_rhs.y * vec2_rhs.y)
  end

  def normalize
    inverse_length = 1.0 / Math.sqrt(@x * @x + @y * @y)
    Vec2.new(@x * inverse_length,
             @y * inverse_length)
  end

  def normalize!
    inverse_length = 1.0 / Math.sqrt(@x * @x + @y * @y)
    @x *= inverse_length
    @y *= inverse_length
  end

  def normalize_from!(vec2_other)
    inverse_length = 1.0 / Math.sqrt(vec2_other.x * vec2_other.x + vec2_other.y * vec2_other.y)
    @x = vec2_other.x * inverse_length
    @y = vec2_other.y * inverse_length
  end

  def rotate_by(vec2_center, scalar_degrees)
    radians = scalar_degrees * PI_OVER_180
    cos = Math.cos(radians)
    sin = Math.sin(radians)

    dx = @x - vec2_center.x
    dy = @y - vec2_center.y

    Vec2.new((dx * cos - dy * sin) + vec2_center.x,
             (dx * sin + dy * cos) + vec2_center.y)
  end

  def rotate_by!(vec2_center, scalar_degrees)
    radians = scalar_degrees * PI_OVER_180
    cos = Math.cos(radians)
    sin = Math.sin(radians)

    @x -= vec2_center.x
    @y -= vec2_center.y
    @x = (@x * cos - @y * sin) + vec2_center.x
    @y = (@x * sin + @y * cos) + vec2_center.y
  end

  def rotate_by_from!(vec2_other, vec2_center, scalar_degrees)
    radians = scalar_degrees * PI_OVER_180
    cos = Math.cos(radians)
    sin = Math.sin(radians)

    @x = vec2_other.x - vec2_center.x
    @y = vec2_other.x - vec2_center.y
    @x = (vec2_other.x * cos - vec2_other.y * sin) + vec2_center.x
    @y = (vec2_other.x * sin + vec2_other.y * cos) + vec2_center.y
  end
end

class Mat2
  attr_accessor(:m11, :m12, :m21, :m22)

  def initialize(m11 = 0.0, m12 = 0.0, m21 = 0.0, m22 = 0.0)
    @m11 = m11
    @m12 = m12
    @m21 = m21
    @m22 = m22
  end

  def add!(mat2_rhs)

  end

  def add2!(mat2_lhs, mat2_rhs)

  end

  def mul!

  end

  def eql?(other)
    @m11 == other.m11 && @m12 == other.m12 && @m21 = other.m21 && @m22 = other.m22
  end

  def inverse!
    determinant = (1.0 / @m11 * @m22 - @m21 * @m12)

    @m11 = @m22 * determinant
    @m22 = @m11 * determinant
    @m12 *= -determinant
    @m21 *= -determinant
  end

  def identity!
    @m11 = 1.0
    @m12 = 0.0
    @m21 = 0.0
    @m22 = 1.0
  end

  def transpose!
    m12 = @m12
    @m12 = @m21
    @m21 = m12
  end

  def determinant
    1.0 / @m11 * @m22 - @m21 * @m22
  end
end
