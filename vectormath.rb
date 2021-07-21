DEG2RAD = Math::PI / 180.0
RAD2DEG = 180.0 / Math::PI

class Vec2
  attr_accessor(:x, :y)

  def initialize(x = 0.0, y = 0.0)
    @x = x
    @y = y
  end

  def to_a
    [@x, @y]
  end

  def set!(x, y)
    @x = x
    @y = y
    self
  end

  def set_from!(vec2_other)
    @x = vec2_other.x
    @y = vec2_other.y
    self
  end

  def add!(vec2_rhs)
    @x += vec2_rhs.x
    @y += vec2_rhs.y
    self
  end

  def add_from!(vec2_lhs, vec2_rhs)
    @x = vec2_lhs.x + vec2_rhs.x
    @y = vec2_lhs.y + vec2_rhs.y
    self
  end

  def add(vec2_rhs)
    dup.add!(vec2_rhs)
  end

  def sub!(vec2_rhs)
    @x -= vec2_rhs.x
    @y -= vec2_rhs.y
    self
  end

  def sub_from!(vec2_lhs, vec2_rhs)
    @x = vec2_lhs.x - vec2_rhs.x
    @y = vec2_lhs.y - vec2_lhs.y
    self
  end

  def sub(vec2_rhs)
    dup.sub!(vec2_rhs)
  end

  def scale!(scalar_rhs)
    @x *= scalar_rhs
    @y *= scalar_rhs
    self
  end

  def scale_from!(vec2_lhs, scalar_rhs)
    @x = vec2_lhs.x * scalar_rhs
    @y = vec2_lhs.y * scalar_rhs
    self
  end

  def scale(scalar_rhs)
    dup.scale!(scalar_rhs)
  end

  def mul!(vec2_rhs)
    @x *= vec2_rhs.x
    @y *= vec2_rhs.y
    self
  end

  def mul_from!(vec2_lhs, vec2_rhs)
    @x = vec2_lhs.x * vec2_rhs.x
    @y = vec2_lhs.y * vec2_rhs.y
    self
  end

  def mul(vec2_rhs)
    dup.mul!(vec2_rhs)
  end

  def div!(vec2_rhs)
    @x /= vec2_rhs.x
    @y /= vec2_rhs.y
    self
  end

  def div_from!(vec2_lhs, vec2_rhs)
    @x = vec2_lhs.x / vec2_rhs.x
    @y = vec2_lhs.y / vec2_rhs.y
    self
  end

  def div(vec2_rhs)
    dup.div!(vec2_rhs)
  end

  def dot(vec2_rhs)
    @x * vec2_rhs.x + @y * vec2_rhs.y
  end

  def cross(vec2_rhs)
    @x * vec2_rhs.y - @y * vec2_rhs.x
  end

  def min!(vec2_rhs)
    @x = @x < vec2_rhs.x ? @x : vec2_rhs.x
    @y = @y < vec2_rhs.y ? @y : vec2_rhs.y
    self
  end

  def min_from!(vec2_lhs, vec2_rhs)
    @x = vec2_lhs.x < vec2_rhs.x ? vec2_lhs.x : vec2_rhs.x
    @y = vec2_lhs.y < vec2_rhs.y ? vec2_lhs.y : vec2_rhs.y
    self
  end

  def min(vec2_rhs)
    dup.min!(vec2_rhs)
  end

  def max!(vec2_rhs)
    @x = @x > vec2_rhs.x ? @x : vec2_rhs.x
    @y = @y > vec2_rhs.y ? @y : vec2_rhs.y
    self
  end

  def max_from!(vec2_lhs, vec2_rhs)
    @x = vec2_lhs.x > vec2_rhs.x ? vec2_lhs.x : vec2_rhs.x
    @y = vec2_lhs.y > vec2_rhs.y ? vec2_lhs.y : vec2_rhs.y
    self
  end

  def max(vec2_rhs)
    dup.max!(vec2_rhs)
  end

  def abs!
    @x = @x.abs
    @y = @y.abs
    self
  end

  def abs_from!(vec2_other)
    @x = vec2_other.x.abs
    @y = vec2_other.y.abs
    self
  end

  def abs
    dup.abs!
  end

  def invert!
    @x = -@x
    @y = -@y
    self
  end

  def invert_from!(vec2_other)
    @x = -vec2_other.x
    @y = -vec2_other.y
    self
  end

  def invert
    dup.invert!
  end

  alias negate! invert!
  alias negate invert

  def eq?(other)
    @x == other.x && @y == other.y
  end

  def neq?(other)
    @x != other.x || @y != other.y
  end

  def angle
    Math.atan2(@y, @x)
  end

  def angle_to(vec2_rhs)
    inverse_length_lhs = 1.0 / Math.sqrt(@x * @x + @y * @y)
    lhs_x = @x * inverse_length_lhs
    lhs_y = @y * inverse_length_lhs

    inverse_length_rhs = 1.0 / Math.sqrt(vec2_rhs.x * vec2_rhs.x + vec2_rhs.y * vec2_rhs.y)
    rhs_x = vec2_rhs.x * inverse_length_rhs
    rhs_y = vec2_rhs.y * inverse_length_rhs

    angle = Math.atan2((lhs_x * rhs_y - lhs_y * rhs_x), (lhs_x * rhs_x + lhs_y * rhs_y))
    angle.abs < Float::EPSILON ? 0.0 : angle
  end

  def lerp!(vec2_rhs, scalar_t)
    @x += scalar_t * (vec2_rhs.x - @x)
    @y += scalar_t * (vec2_rhs.y - @y)
    self
  end

  def lerp_from!(vec2_lhs, vec2_rhs, scalar_t)
    @x = vec2_lhs.x + scalar_t * (vec2_rhs.x - vec2_lhs.x)
    @y = vec2_lhs.y + scalar_t * (vec2_rhs.y - vec2_lhs.y)
    self
  end

  def lerp(vec2_rhs, scalar_t)
    dup.lerp!(vec2_rhs, scalar_t)
  end

  def length_sq
    @x * @x + @y * @y
  end

  alias magnitude_sq length_sq

  def length
    Math.sqrt(@x * @x + @y * @y)
  end

  alias magnitude length

  def distance_sq(vec2_rhs)
    (@x * @x + @y * @y) - (vec2_rhs.x * vec2_rhs.x + vec2_rhs.y * vec2_rhs.y)
  end

  def distance(vec2_rhs)
    Math.sqrt(@x * @x + @y * @y) - Math.sqrt(vec2_rhs.x * vec2_rhs.x + vec2_rhs.y * vec2_rhs.y)
  end

  def normalize!
    length_sq = @x * @x + @y * @y
    return self if length_sq == 0

    inverse_length = 1.0 / Math.sqrt(length_sq)

    @x *= inverse_length
    @y *= inverse_length
    self
  end

  def normalize_from!(vec2_other)
    length_sq = vec2_other.x * vec2_other.x + vec2_other.y * vec2_other.y
    if length_sq == 0
      @x = vec2_other.x
      @y = vec2_other.y
      return self
    end

    inverse_length = 1.0 / Math.sqrt(vec2_other.x * vec2_other.x + vec2_other.y * vec2_other.y)

    @x = vec2_other.x * inverse_length
    @y = vec2_other.y * inverse_length
    self
  end

  def normalize
    dup.normalize!
  end

  def rotate!(vec2_center, scalar_degrees)
    radians = scalar_degrees * DEG2RAD
    cos = Math.cos(radians)
    sin = Math.sin(radians)

    @x -= vec2_center.x
    @y -= vec2_center.y
    @x = (@x * cos - @y * sin) + vec2_center.x
    @y = (@x * sin + @y * cos) + vec2_center.y
    self
  end

  def rotate_from!(vec2_other, vec2_center, scalar_degrees)
    radians = scalar_degrees * DEG2RAD
    cos = Math.cos(radians)
    sin = Math.sin(radians)

    @x = vec2_other.x - vec2_center.x
    @y = vec2_other.x - vec2_center.y
    @x = (vec2_other.x * cos - vec2_other.y * sin) + vec2_center.x
    @y = (vec2_other.x * sin + vec2_other.y * cos) + vec2_center.y
    self
  end

  def rotate(vec2_center, scalar_degrees)
    dup.rotate!(vec2_center, scalar_degrees)
  end

  alias + add
  alias - sub
  alias * mul
  alias / div
  alias == eq?
  alias != neq?

end
class Vec3
  attr_accessor(:x, :y, :z, :w)

  def initialize(x = 0.0, y = 0.0, z = 0.0)
    @x = x
    @y = y
    @z = z
  end

  def to_a
    [@x, @y, @z]
  end

  def set!(x, y, z)
    @x = x
    @y = y
    @z = z
    self
  end

  def set_from!(vec3_other)
    @x = vec3_other.x
    @y = vec3_other.y
    @z = vec3_other.z
    self
  end

  def add!(vec3_rhs)
    @x += vec3_rhs.x
    @y += vec3_rhs.y
    @z += vec3_rhs.z
    self
  end

  def add_from!(vec3_lhs, vec3_rhs)
    @x = vec3_lhs.x + vec3_rhs.x
    @y = vec3_lhs.y + vec3_rhs.y
    @z = vec3_lhs.z + vec3_rhs.z
    self
  end

  def add(vec3_rhs)
    dup.add!(vec3_rhs)
  end

  def sub!(vec3_rhs)
    @x -= vec3_rhs.x
    @y -= vec3_rhs.y
    @z -= vec3_rhs.z
    self
  end

  def sub_from!(vec3_lhs, vec3_rhs)
    @x = vec3_lhs.x - vec3_rhs.x
    @y = vec3_lhs.y - vec3_lhs.y
    @z = vec3_lhs.z - vec3_lhs.z
    self
  end

  def sub(vec3_rhs)
    dup.sub!(vec3_rhs)
  end

  def scale!(scalar_rhs)
    @x *= scalar_rhs
    @y *= scalar_rhs
    @z *= scalar_rhs
    self
  end

  def scale_from!(vec3_lhs, scalar_rhs)
    @x = vec3_lhs.x * scalar_rhs
    @y = vec3_lhs.y * scalar_rhs
    @z = vec3_lhs.z * scalar_rhs
    self
  end

  def scale(scalar_rhs)
    dup.scale!(scalar_rhs)
  end

  def mul!(vec3_rhs)
    @x *= vec3_rhs.x
    @y *= vec3_rhs.y
    @z *= vec3_rhs.z
    self
  end

  def mul_from!(vec3_lhs, vec3_rhs)
    @x = vec3_lhs.x * vec3_rhs.x
    @y = vec3_lhs.y * vec3_rhs.y
    @z = vec3_lhs.z * vec3_rhs.z
    self
  end

  def mul(vec3_rhs)
    dup.mul!(vec3_rhs)
  end

  def div!(vec3_rhs)
    @x /= vec3_rhs.x
    @y /= vec3_rhs.y
    @z /= vec3_rhs.z
    self
  end

  def div_from!(vec3_lhs, vec3_rhs)
    @x = vec3_lhs.x / vec3_rhs.x
    @y = vec3_lhs.y / vec3_rhs.y
    @z = vec3_lhs.z / vec3_rhs.z
    self
  end

  def div(vec3_rhs)
    dup.div!(vec3_rhs)
  end

  def dot(vec3_rhs)
    @x * vec3_rhs.x + @y * vec3_rhs.y + @z * vec3_rhs.z
  end

  def cross!(vec3_rhs)
    x = @y * vec3_rhs.z - @z * vec3_rhs.y
    y = @z * vec3_rhs.x - @x * vec3_rhs.z
    z = @x * vec3_rhs.y - @y * vec3_rhs.x

    @x = x
    @y = y
    @z = z
    self
  end

  def cross_from!(vec3_lhs, vec3_rhs)
    @x = vec3_lhs.y * vec3_rhs.z - vec3_lhs.z * vec3_rhs.y
    @y = vec3_lhs.z * vec3_rhs.x - vec3_lhs.x * vec3_rhs.z
    @z = vec3_lhs.x * vec3_rhs.y - vec3_lhs.y * vec3_rhs.x
    self
  end

  def cross(vec3_rhs)
    dup.cross!(vec3_rhs)
  end

  def min!(vec3_rhs)
    @x = @x < vec3_rhs.x ? @x : vec3_rhs.x
    @y = @y < vec3_rhs.y ? @y : vec3_rhs.y
    @z = @z < vec3_rhs.z ? @z : vec3_rhs.z
    self
  end

  def min_from!(vec3_lhs, vec3_rhs)
    @x = vec3_lhs.x < vec3_rhs.x ? vec3_lhs.x : vec3_rhs.x
    @y = vec3_lhs.y < vec3_rhs.y ? vec3_lhs.y : vec3_rhs.y
    @z = vec3_lhs.z < vec3_rhs.z ? vec3_lhs.z : vec3_rhs.z
    self
  end

  def min(vec3_rhs)
    dup.min!(vec3_rhs)
  end

  def max!(vec3_rhs)
    @x = @x > vec3_rhs.x ? @x : vec3_rhs.x
    @y = @y > vec3_rhs.y ? @y : vec3_rhs.y
    @z = @z > vec3_rhs.z ? @z : vec3_rhs.z
    self
  end

  def max_from!(vec3_lhs, vec3_rhs)
    @x = vec3_lhs.x > vec3_rhs.x ? vec3_lhs.x : vec3_rhs.x
    @y = vec3_lhs.y > vec3_rhs.y ? vec3_lhs.y : vec3_rhs.y
    @z = vec3_lhs.z > vec3_rhs.z ? vec3_lhs.z : vec3_rhs.z
    self
  end

  def max(vec3_rhs)
    dup.max!(vec3_rhs)
  end

  def abs!
    @x = @x.abs
    @y = @y.abs
    @z = @z.abs
    self
  end

  def abs_from!(vec3_other)
    @x = vec3_other.x.abs
    @y = vec3_other.y.abs
    @z = vec3_other.z.abs
    self
  end

  def abs
    dup.abs!
  end

  def invert!
    @x = -@x
    @y = -@y
    @z = -@z
    self
  end

  def invert_from!(vec3_other)
    @x = -vec3_other.x
    @y = -vec3_other.y
    @z = -vec3_other.z
    self
  end

  def invert
    dup.invert!
  end

  alias negate! invert!
  alias negate invert

  def eq?(other)
    @x == other.x && @y == other.y && @z == other.z
  end

  def lerp!(vec3_rhs, scalar_t)
    @x += scalar_t * (vec3_rhs.x - @x)
    @y += scalar_t * (vec3_rhs.y - @y)
    @z += scalar_t * (vec3_rhs.z - @z)
    self
  end

  def lerp_from!(vec3_lhs, vec3_rhs, scalar_t)
    @x = vec3_lhs.x + scalar_t * (vec3_rhs.x - vec3_lhs.x)
    @y = vec3_lhs.y + scalar_t * (vec3_rhs.y - vec3_lhs.y)
    @z = vec3_lhs.z + scalar_t * (vec3_rhs.z - vec3_lhs.z)
    self
  end

  def lerp(vec3_rhs, scalar_t)
    dup.lerp!(vec3_rhs, scalar_t)
  end

  def slerp!(vec3_rhs, scalar_t)
    raise 'not implemented'
    self
  end

  def slerp_from!(vec3_lhs, vec3_rhs, scalar_t)
    raise 'not implemented'
    self
  end

  def slerp(vec3_rhs, scalar_t)
    dup.slerp!(vec3_rhs, scalar_t)
  end

  def length_sq
    @x * @x + @y * @y + @z * @z
  end

  alias magnitude_sq length_sq

  def length
    Math.sqrt(@x * @x + @y * @y + @z * @z)
  end

  alias magnitude length

  def distance_sq(vec3_rhs)
    (@x * @x + @y * @y + @z * @z) - (vec3_rhs.x * vec3_rhs.x + vec3_rhs.y * vec3_rhs.y + vec3_rhs.z * vec3_rhs.z)
  end

  def distance(vec3_rhs)
    Math.sqrt(@x * @x + @y * @y + @z * @z) - Math.sqrt(vec3_rhs.x * vec3_rhs.x + vec3_rhs.y * vec3_rhs.y + vec3_rhs.z * vec3_rhs.z)
  end

  def normalize!
    length_sq = @x * @x + @y * @y + @z * @z
    return self if length_sq == 0

    inverse_length = 1.0 / Math.sqrt(@x * @x + @y * @y + @z * @z)

    @x *= inverse_length
    @y *= inverse_length
    @z *= inverse_length
    self
  end

  def normalize_from!(vec3_other)
    length_sq = vec3_other.x * vec3_other.x + vec3_other.y * vec3_other.y + vec3_other.z * vec3_other.z

    if length_sq == 0
      @x = vec3_other.x
      @y = vec3_other.y
      @z = vec3_other.z
      return self
    end

    inverse_length = 1.0 / Math.sqrt(vec3_other.x * vec3_other.x + vec3_other.y * vec3_other.y + vec3_other.z * vec3_other.z)

    @x = vec3_other.x * inverse_length
    @y = vec3_other.y * inverse_length
    @z = vec3_other.z * inverse_length
    self
  end

  def normalize
    dup.normalize!
  end

  def rotatation_to_direction!(vec3_forwards)
    raise 'not implemented'
    self
  end

  def rotation_to_direction_from!(vec3_lhs, vec3_forwards)
    raise 'not implemented'
    self
  end

  def rotatation_to_direction(vec3_forwards)
    dup.rotation_to_direction!(vec3_forwards)
  end

  alias + add
  alias - sub
  alias * mul
  alias / div
  alias == eq?
end

class Vec4
  attr_accessor(:x, :y, :z, :w)

  def initialize(x = 0.0, y = 0.0, z = 0.0, w = 0.0)
    @x = x
    @y = y
    @z = z
    @w = w
  end

  def to_a
    [@x, @y, @z, @w]
  end

  def set!(x, y, z, w)
    @x = x
    @y = y
    @z = z
    @w = w
    self
  end

  def set_from!(vec4_other)
    @x = vec4_other.x
    @y = vec4_other.y
    @z = vec4_other.z
    @w = vec4_other.w
    self
  end

  def add!(vec4_rhs)
    @x += vec4_rhs.x
    @y += vec4_rhs.y
    @z += vec4_rhs.z
    @w += vec4_rhs.w
    self
  end

  def add_from!(vec4_lhs, vec4_rhs)
    @x = vec4_lhs.x + vec4_rhs.x
    @y = vec4_lhs.y + vec4_rhs.y
    @z = vec4_lhs.z + vec4_rhs.z
    @z = vec4_lhs.w + vec4_rhs.w
    self
  end

  def add(vec4_rhs)
    dup.add!(vec4_rhs)
  end

  def sub!(vec4_rhs)
    @x -= vec4_rhs.x
    @y -= vec4_rhs.y
    @z -= vec4_rhs.z
    @w -= vec4_rhs.w
    self
  end

  def sub_from!(vec4_lhs, vec4_rhs)
    @x = vec4_lhs.x - vec4_rhs.x
    @y = vec4_lhs.y - vec4_lhs.y
    @z = vec4_lhs.z - vec4_lhs.z
    @w = vec4_lhs.w - vec4_lhs.w
    self
  end

  def sub(vec4_rhs)
    dup.sub!(vec4_rhs)
  end

  def scale!(scalar_rhs)
    @x *= scalar_rhs
    @y *= scalar_rhs
    @z *= scalar_rhs
    @w *= scalar_rhs
    self
  end

  def scale_from!(vec4_lhs, scalar_rhs)
    @x = vec4_lhs.x * scalar_rhs
    @y = vec4_lhs.y * scalar_rhs
    @z = vec4_lhs.z * scalar_rhs
    @w = vec4_lhs.w * scalar_rhs
    self
  end

  def scale(scalar_rhs)
    dup.scale!(scalar_rhs)
  end

  def mul!(vec4_rhs)
    @x *= vec4_rhs.x
    @y *= vec4_rhs.y
    @z *= vec4_rhs.z
    @w *= vec4_rhs.w
    self
  end

  def mul_from!(vec4_lhs, vec4_rhs)
    @x = vec4_lhs.x * vec4_rhs.x
    @y = vec4_lhs.y * vec4_rhs.y
    @z = vec4_lhs.z * vec4_rhs.z
    @w = vec4_lhs.w * vec4_rhs.w
    self
  end

  def mul(vec4_rhs)
    dup.mul!(vec4_rhs)
  end

  def div!(vec4_rhs)
    @x /= vec4_rhs.x
    @y /= vec4_rhs.y
    @z /= vec4_rhs.z
    @w /= vec4_rhs.w
    self
  end

  def div_from!(vec4_lhs, vec4_rhs)
    @x = vec4_lhs.x / vec4_rhs.x
    @y = vec4_lhs.y / vec4_rhs.y
    @z = vec4_lhs.z / vec4_rhs.z
    @w = vec4_lhs.w / vec4_rhs.w
    self
  end

  def div(vec4_rhs)
    dup.div!(vec4_rhs)
  end

  def dot(vec4_rhs)
    @x * vec4_rhs.x + @y * vec4_rhs.y + @z * vec4_rhs.z + @w * vec4_rhs.w
  end

  def min!(vec4_rhs)
    @x = @x < vec4_rhs.x ? @x : vec4_rhs.x
    @y = @y < vec4_rhs.y ? @y : vec4_rhs.y
    @z = @z < vec4_rhs.z ? @z : vec4_rhs.z
    @w = @w < vec4_rhs.w ? @w : vec4_rhs.w
    self
  end

  def min_from!(vec4_lhs, vec4_rhs)
    @x = vec4_lhs.x < vec4_rhs.x ? vec4_lhs.x : vec4_rhs.x
    @y = vec4_lhs.y < vec4_rhs.y ? vec4_lhs.y : vec4_rhs.y
    @z = vec4_lhs.z < vec4_rhs.z ? vec4_lhs.z : vec4_rhs.z
    @w = vec4_lhs.w < vec4_rhs.w ? vec4_lhs.w : vec4_rhs.w
    self
  end

  def min(vec4_rhs)
    dup.min!(vec4_rhs)
  end

  def max!(vec4_rhs)
    @x = @x > vec4_rhs.x ? @x : vec4_rhs.x
    @y = @y > vec4_rhs.y ? @y : vec4_rhs.y
    @z = @z > vec4_rhs.z ? @z : vec4_rhs.z
    @w = @w > vec4_rhs.w ? @w : vec4_rhs.w
    self
  end

  def max_from!(vec4_lhs, vec4_rhs)
    @x = vec4_lhs.x > vec4_rhs.x ? vec4_lhs.x : vec4_rhs.x
    @y = vec4_lhs.y > vec4_rhs.y ? vec4_lhs.y : vec4_rhs.y
    @z = vec4_lhs.z > vec4_rhs.z ? vec4_lhs.z : vec4_rhs.z
    @w = vec4_lhs.w > vec4_rhs.w ? vec4_lhs.w : vec4_rhs.w
    self
  end

  def max(vec4_rhs)
    dup.max!(vec4_rhs)
  end

  def abs!
    @x = @x.abs
    @y = @y.abs
    @z = @z.abs
    @w = @w.abs
    self
  end

  def abs_from!(vec4_other)
    @x = vec4_other.x.abs
    @y = vec4_other.y.abs
    @z = vec4_other.z.abs
    @w = vec4_other.w.abs
    self
  end

  def abs
    dup.abs!
  end

  def invert!
    @x = -@x
    @y = -@y
    @z = -@z
    @w = -@w
    self
  end

  def invert_from!(vec4_other)
    @x = -vec4_other.x
    @y = -vec4_other.y
    @z = -vec4_other.z
    @w = -vec4_other.w
    self
  end

  def invert
    dup.invert!
  end

  alias negate! invert!
  alias negate invert

  def eq?(other)
    @x == other.x && @y == other.y && @z == other.z && @w == other.w
  end

  def lerp!(vec4_rhs, scalar_t)
    @x += scalar_t * (vec4_rhs.x - @x)
    @y += scalar_t * (vec4_rhs.y - @y)
    @z += scalar_t * (vec4_rhs.z - @z)
    @w += scalar_t * (vec4_rhs.w - @w)
    self
  end

  def lerp_from!(vec4_lhs, vec4_rhs, scalar_t)
    @x = vec4_lhs.x + scalar_t * (vec4_rhs.x - vec4_lhs.x)
    @y = vec4_lhs.y + scalar_t * (vec4_rhs.y - vec4_lhs.y)
    @z = vec4_lhs.z + scalar_t * (vec4_rhs.z - vec4_lhs.z)
    @w = vec4_lhs.w + scalar_t * (vec4_rhs.w - vec4_lhs.w)
    self
  end

  def lerp(vec4_rhs, scalar_t)
    dup.lerp!(vec4_rhs, scalar_t)
  end

  def slerp!(vec4_rhs, scalar_t)
    raise 'not implemented'
    self
  end

  def slerp_from!(vec4_lhs, vec4_rhs, scalar_t)
    raise 'not implemented'
    self
  end

  def slerp(vec4_rhs, scalar_t)
    dup.slerp!(vec4_rhs, scalar_t)
  end

  def length_sq
    @x * @x + @y * @y + @z * @z + @w * @w
  end

  alias magnitude_sq length_sq

  def length
    Math.sqrt(@x * @x + @y * @y + @z * @z + @w * @w)
  end

  alias magnitude length

  def distance_sq(vec4_rhs)
    (@x * @x + @y * @y + @z * @z + @w * @w) - (vec4_rhs.x * vec4_rhs.x + vec4_rhs.y * vec4_rhs.y + vec4_rhs.z * vec4_rhs.z + vec4_rhs.w * vec4_rhs.w)
  end

  def distance(vec4_rhs)
    Math.sqrt(@x * @x + @y * @y + @z * @z + @w * @w) - Math.sqrt(vec4_rhs.x * vec4_rhs.x + vec4_rhs.y * vec4_rhs.y + vec4_rhs.z * vec4_rhs.z + vec4_rhs.w * vec4_rhs.w)
  end

  def normalize!
    inverse_length = 1.0 / Math.sqrt(@x * @x + @y * @y + @z * @z + @w * @w)
    return self if inverse_length == Float::INFINITY

    @x *= inverse_length
    @y *= inverse_length
    @z *= inverse_length
    @w *= inverse_length
    self
  end

  def normalize_from!(vec4_other)
    length_sq = vec4_other.x * vec4_other.x + vec4_other.y * vec4_other.y + vec4_other.z * vec4_other.z + vec4_other.w * vec4_other.w
    if length_sq == 0
      @x = vec4_other.x
      @y = vec4_other.y
      @z = vec4_other.z
      @w = vec4_other.w
      return self
    end

    inverse_length = 1.0 / Math.sqrt(length_sq)

    @x = vec4_other.x * inverse_length
    @y = vec4_other.y * inverse_length
    @z = vec4_other.z * inverse_length
    @w = vec4_other.w * inverse_length
    self
  end

  def normalize
    dup.normalize!
  end

  alias + add
  alias - sub
  alias * mul
  alias / div
  alias == eq?
end

class Mat2
  attr_accessor(:xx, :xy, :yx, :yy)

  def initialize(xx = 0.0, xy = 0.0, yx = 0.0, yy = 0.0)
    @xx = xx
    @xy = xy
    @yx = yx
    @yy = yy
  end

  def to_a
    [[@xx, @xy], [@yx, @yy]]
  end

  def set!(xx, xy, yx, yy)
    @xx = xx
    @xy = xy
    @yx = yx
    @yy = yy
    self
  end

  def set_from!(mat2_other)
    @xx = mat2_other.xx
    @xy = mat2_other.xy
    @yx = mat2_other.yx
    @yy = mat2_other.yy
    self
  end

  def add!(mat2_rhs)
    @xx += mat2_rhs.xx
    @xy += mat2_rhs.xx
    @yx += mat2_rhs.xx
    @yy += mat2_rhs.xx
    self
  end

  def add_from!(mat2_lhs, mat2_rhs)
    @xx = mat2_lhs.xx + mat2_rhs.xx
    @xy = mat2_lhs.xy + mat2_rhs.xy
    @yx = mat2_lhs.yx + mat2_rhs.yx
    @yy = mat2_lhs.yy + mat2_rhs.yy
    self
  end

  def add(mat2_rhs)
    dup.add!(mat2_rhs)
  end

  alias + add

  def sub!(mat2_rhs)
    @xx -= mat2_rhs.xx
    @xy -= mat2_rhs.xx
    @yx -= mat2_rhs.xx
    @yy -= mat2_rhs.xx
    self
  end

  def sub_from!(mat2_lhs, mat2_rhs)
    @xx = mat2_lhs.xx - mat2_rhs.xx
    @xy = mat2_lhs.xy - mat2_rhs.xy
    @yx = mat2_lhs.yx - mat2_rhs.yx
    @yy = mat2_lhs.yy - mat2_rhs.yy
    self
  end

  def sub(mat2_rhs)
    dup.sub!(mat2_rhs)
  end

  alias - sub
  
  def eql?(other)
    @xx == other.xx && @xy == other.xy && @yx = other.yx && @yy = other.yy
  end

  def inverse!
    determinant = (1.0 / @xx * @yy - @yx * @xy)

    @xx = @yy * determinant
    @yy = @xx * determinant
    @xy *= -determinant
    @yx *= -determinant
    self
  end

  def inverse_from!(mat2_other)
    determinant = (1.0 / mat2_other.xx * mat2_other.yy - mat2_other.yx * mat2_other.xy)

    @xx = mat2_other.xx * determinant
    @yy = mat2_other.yy * determinant
    @xy *= -determinant
    @yx *= -determinant
    self
  end

  def inverse
    dup.inverse!
  end

  def identity!
    @xx = 1.0
    @xy = 0.0
    @yx = 0.0
    @yy = 1.0
    self
  end

  def identity
    dup.identity!
  end

  def transpose!
    m12 = @xy
    @xy = @yx
    @yx = m12
    self
  end

  def transpose_from!(mat2_other)
    @xx = mat2_other.xx
    @xy = mat2_other.yx
    @yx = mat2_other.xy
    @yy = mat2_other.yy
    self
  end

  def transpose
    dup.transpose!
  end

  def determinant
    1.0 / @xx * @yy - @yx * @yy
  end

  IDENTITY = Mat2.new(1.0, 0.0, 0.0, 1.0).freeze
  ZERO = Mat2.new.freeze
end
