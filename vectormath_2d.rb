DEG2RAD = Math::PI / 180.0
RAD2DEG = 360.0 / (Math::PI * 2.0);

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

  def add_scalar!(scalar_lhs)
    @x += scalar_lhs
    @y += scalar_lhs
    self
  end

  def add_scalar_from!(vec2_rhs, scalar_lhs)
    @x = vec2_rhs.x + scalar_lhs
    @y = vec2_rhs.y + scalar_lhs
    self
  end

  def add_scalar(scalar_lhs)
    dup.add_scalar!(scalar_lhs)
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

  def sub_scalar!(scalar_lhs)
    @x -= scalar_lhs
    @y -= scalar_lhs
    self
  end

  def sub_scalar_from!(vec2_rhs, scalar_lhs)
    @x = vec2_rhs.x - scalar_lhs
    @y = vec2_rhs.y - scalar_lhs
    self
  end

  def sub_scalar(scalar_lhs)
    dup.sub_scalar!(scalar_lhs)
  end

  def mul_scalar!(scalar_rhs)
    @x *= scalar_rhs
    @y *= scalar_rhs
    self
  end

  def mul_scalar_from!(vec2_lhs, scalar_rhs)
    @x = vec2_lhs.x * scalar_rhs
    @y = vec2_lhs.y * scalar_rhs
    self
  end

  def mul_scalar(scalar_rhs)
    dup.mul_scalar!(scalar_rhs)
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

  def div_scalar!(scalar_rhs)
    @x /= scalar_rhs
    @y /= scalar_rhs
    self
  end

  def div_scalar_from!(vec2_lhs, scalar_rhs)
    @x = vec2_lhs.x / scalar_rhs
    @y = vec2_lhs.y / scalar_rhs
    self
  end

  def div_scalar(scalar_rhs)
    dup.div_scalar!(scalar_rhs)
  end

  def dot(vec2_rhs)
    @x * vec2_rhs.x + @y * vec2_rhs.y
  end

  def cross(vec2_rhs)
    @x * vec2_rhs.y - @y * vec2_rhs.x
  end

  def cross_scalar!(scalar_lhs)
    @x = @y * -scalar_lhs
    @y = @x *  scalar_lhs
    self
  end

  def cross_scalar_from!(vec2_rhs, scalar_lhs)
    @x = vec2_rhs.y * -scalar_lhs
    @y = vec2_rhs.x *  scalar_lhs
    self
  end

  def cross_scalar(scalar_lhs)
    dup.cross_scalar!(scalar_lhs)
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

  def slerp!(vec2_rhs, scalar_t)
    lhs_x = @x
    lhs_y = @y
    rhs_x = vec2_rhs.x
    rhs_y = vec2_rhs.y
    
    # Normalize the vectors
    length_sq = lhs_x * lhs_x + lhs_y * lhs_y
    rhs_length_sq = rhs_x * rhs_x + rhs_y * rhs_y

    return self if length_sq.zero? || rhs_length_sq.zero?

    inverse_length = 1.0 / Math.sqrt(length_sq)
    rhs_inverse_length = 1.0 / Math.sqrt(rhs_length_sq)

    lhs_x *= inverse_length
    lhs_y *= inverse_length
    rhs_x *= rhs_inverse_length
    rhs_y *= rhs_inverse_length

    omega = Math.acos(lhs_x * rhs_x + lhs_y * rhs_y)
    inverse_denominator = 1.0 / Math.sin(omega)
    
    a = Math.sin((1.0 - scalar_t) * omega) * inverse_denominator
    b = Math.sin(scalar_t * omega) * inverse_denominator

    @x = @x * a + vec2_rhs.x * b
    @y = @y * a + vec2_rhs.y * b

    self
  end

  def slerp_from!(vec2_lhs, vec2_rhs, scalar_t)
    lhs_x = vec2_lhs.x
    lhs_y = vec2_lhs.y
    rhs_x = vec2_rhs.x
    rhs_y = vec2_rhs.y
    
    # Normalize the vectors
    length_sq = lhs_x * lhs_x + lhs_y * lhs_y
    rhs_length_sq = rhs_x * rhs_x + rhs_y * rhs_y

    return self if length_sq.zero? || rhs_length_sq.zero?

    inverse_length = 1.0 / Math.sqrt(length_sq)
    rhs_inverse_length = 1.0 / Math.sqrt(rhs_length_sq)

    lhs_x *= inverse_length
    lhs_y *= inverse_length
    rhs_x *= rhs_inverse_length
    rhs_y *= rhs_inverse_length

    omega = Math.acos(lhs_x * rhs_x + lhs_y * rhs_y)
    inverse_denominator = 1.0 / Math.sin(omega)
    
    a = Math.sin((1.0 - scalar_t) * omega) * inverse_denominator
    b = Math.sin(scalar_t * omega) * inverse_denominator

    @x = vec2_lhs.x * a + vec2_rhs.x * b
    @y = vec2_lhs.y * a + vec2_rhs.y * b
    self
  end

  def slerp(vec2_rhs, scalar_t)
    dup.slerp(vec2_rhs, scalar_t)
  end

  def length_sq
    @x * @x + @y * @y
  end

  def length
    Math.sqrt(@x * @x + @y * @y)
  end

  def distance_sq(vec2_rhs)
    dx = @x - vec2_rhs.x
    dy = @y - vec2_rhs.y
    dx * dx + dy * dy
  end

  def distance(vec2_rhs)
    dx = @x - vec2_rhs.x
    dy = @y - vec2_rhs.y
    ::Math.sqrt(dx * dx + dy * dy)
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

 def rotate_by!(vec2_center, scalar_degrees)
    scalar_degrees *= DEG2RAD
    cos = Math.cos(scalar_degrees)
    sin = Math.sin(scalar_degrees)

    @x -= vec2_center.x
    @y -= vec2_center.y

    x = @x * cos - @y * sin + vec2_center.x
    @y = @x * sin + @y * cos + vec2_center.y
    @x = x
    self
 end

  def rotate_by(vec2_center, scalar_degrees)
    dup.rotate_by!(vec2_center, scalar_degrees)
  end

  def zero!
    @x = 0.0
    @y = 0.0
  end
  
  alias + add
  alias - sub
  alias * mul
  alias / div
  alias == eq?
  alias != neq?

  alias scale mul_scalar
  alias scale! mul_scalar!
  alias scale_from! mul_scalar_from!

  alias negate invert
  alias negate! invert!

  alias magnitude length
  alias magnitude_sq length_sq
  
  ZERO = Vec2.new(0.0, 0.0).freeze
end

class Mat2x2
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
    @xy += mat2_rhs.xy
    @yx += mat2_rhs.yx
    @yy += mat2_rhs.yy
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
    @xy -= mat2_rhs.xy
    @yx -= mat2_rhs.yx
    @yy -= mat2_rhs.yy
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
    @xx == other.xx && @xy == other.xy &&
      @yx == other.yx && @yy == other.yy
  end

  def inverse!
    det = 1 / (@xx * @yy - @xy * @yx)

    _xx = @yy * det
    _xy = -@xy * det
    _yx = -@yx * det
    _yy = @xx * det
    @xx = _xx
    @xy = _xy
    @yx = _yx
    @yy = _yy

    self
  end

  def inverse_from!(mat2_other)
    det = 1 / (mat2_other.xx * mat2_other.yy - mat2_other.xy * mat2_other.yx)

    @xx = mat2_other.yy * det
    @xy = -mat2_other.xy * det
    @yx = -mat2_other.yx * det
    @yy = mat2_other.xx * det
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
    _xy = @xy
    @xy = @yx
    @yx = _xy
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
    @xx * @yy - @xy * @yx
  end

  IDENTITY = Mat2x2.new(1.0, 0.0, 0.0, 1.0).freeze
  ZERO = Mat2x2.new.freeze
end
