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

  def add_scalar!(scalar_lhs)
    @x += scalar_lhs
    @y += scalar_lhs
    @z += scalar_lhs
    self
  end

  def add_scalar_from!(vec3_rhs, scalar_lhs)
    @x = vec3_rhs.x + scalar_lhs
    @y = vec3_rhs.y + scalar_lhs
    @z = vec3_rhs.z + scalar_lhs
    self
  end

  def add_scalar(scalar_lhs)
    dup.add_scalar!(scalar_lhs)
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

  def sub_scalar!(scalar_lhs)
    @x -= scalar_lhs
    @y -= scalar_lhs
    @z -= scalar_lhs
    self
  end

  def sub_scalar_from!(vec3_rhs, scalar_lhs)
    @x = vec3_rhs.x - scalar_lhs
    @y = vec3_rhs.y - scalar_lhs
    @z = vec3_rhs.z - scalar_lhs
    self
  end

  def sub_scalar(scalar_lhs)
    dup.sub_scalar!(scalar_lhs)
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
    other.respond_to?(:x) && @x == other.x && other.respond_to?(:y) && @y == other.y && other.respond_to?(:z) && @z == other.z
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

  def length_sq
    @x * @x + @y * @y + @z * @z
  end

  alias magnitude_sq length_sq

  def length
    Math.sqrt(@x * @x + @y * @y + @z * @z)
  end

  alias magnitude length

  def distance_sq(vec3_rhs)
    dx = @x - vec3_rhs.x
    dy = @y - vec3_rhs.y
    dz = @z - vec3_rhs.z
    dx * dx + dy * dy + dz * dz
  end

  def distance(vec3_rhs)
    dx = @x - vec3_rhs.x
    dy = @y - vec3_rhs.y
    dz = @z - vec3_rhs.z
    ::Math.sqrt(dx * dx + dy * dy + dz * dz)
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
  
  def zero!
    @x = 0.0
    @y = 0.0
    @z = 0.0
  end

  ZERO = Vec3.new(0.0, 0.0, 0.0).freeze
  
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

  def add_scalar!(scalar_lhs)
    @x += scalar_lhs
    @y += scalar_lhs
    @z += scalar_lhs
    @w += scalar_lhs
    self
  end

  def add_scalar_from!(vec4_rhs, scalar_lhs)
    @x = vec4_rhs.x + scalar_lhs
    @y = vec4_rhs.y + scalar_lhs
    @z = vec4_rhs.z + scalar_lhs
    @w = vec4_rhs.w + scalar_lhs

    self
  end

  def add_scalar(scalar_lhs)
    dup.add_scalar!(scalar_lhs)
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

  def sub_scalar!(scalar_lhs)
    @x -= scalar_lhs
    @y -= scalar_lhs
    @z -= scalar_lhs
    @w -= scalar_lhs
    self
  end

  def sub_scalar_from!(vec4_rhs, scalar_lhs)
    @x = vec4_rhs.x - scalar_lhs
    @y = vec4_rhs.y - scalar_lhs
    @z = vec4_rhs.z - scalar_lhs
    @w = vec4_rhs.w - scalar_lhs

    self
  end

  def sub_scalar(scalar_lhs)
    dup.sub_scalar!(scalar_lhs)
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

  def mul_mat!(mat4_rhs)
    _x = mat4_rhs.xx * @x + mat4_rhs.xy * @y + mat4_rhs.xz * @z + mat4_rhs.xw * @w
    _y = mat4_rhs.yx * @x + mat4_rhs.yy * @y + mat4_rhs.yz * @z + mat4_rhs.yw * @w
    _z = mat4_rhs.zx * @x + mat4_rhs.zy * @y + mat4_rhs.zz * @z + mat4_rhs.zw * @w
    _w = mat4_rhs.wx * @x + mat4_rhs.wy * @y + mat4_rhs.wz * @z + mat4_rhs.ww * @w
    @x = _x
    @y = _y
    @z = _z
    @w = _w
    self
  end

  def mul_mat_from!(vec4_lhs, mat4_rhs)
    @x = mat4_rhs.xx * vec4_lhs.x + mat4_rhs.xy * vec4_lhs.y + mat4_rhs.xz * vec4_lhs.z + mat4_rhs.xw * vec4_lhs.w
    @y = mat4_rhs.yx * vec4_lhs.x + mat4_rhs.yy * vec4_lhs.y + mat4_rhs.yz * vec4_lhs.z + mat4_rhs.yw * vec4_lhs.w
    @z = mat4_rhs.zx * vec4_lhs.x + mat4_rhs.zy * vec4_lhs.y + mat4_rhs.zz * vec4_lhs.z + mat4_rhs.zw * vec4_lhs.w
    @w = mat4_rhs.wx * vec4_lhs.x + mat4_rhs.wy * vec4_lhs.y + mat4_rhs.wz * vec4_lhs.z + mat4_rhs.ww * vec4_lhs.w
    self
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
    other.respond_to?(:x) && @x == other.x && other.respond_to?(:y) && @y == other.y && other.respond_to?(:z) && @z == other.z && other.respond_to?(:w) && @w == other.w
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

  def length_sq
    @x * @x + @y * @y + @z * @z + @w * @w
  end

  alias magnitude_sq length_sq

  def length
    Math.sqrt(@x * @x + @y * @y + @z * @z + @w * @w)
  end

  alias magnitude length

  def distance_sq(vec4_rhs)
    dx = @x - vec4_rhs.x
    dy = @y - vec4_rhs.y
    dz = @z - vec4_rhs.z
    dw = @w - vec4_rhs.w
    dx * dx + dy * dy + dz * dz + dw * dw
  end

  def distance(vec4_rhs)
    dx = @x - vec4_rhs.x
    dy = @y - vec4_rhs.y
    dz = @z - vec4_rhs.z
    dw = @w - vec4_rhs.w
    ::Math.sqrt(dx * dx + dy * dy + dz * dz + dw * dw)
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

  def zero!
    @x = 0.0
    @y = 0.0
    @z = 0.0
    @w = 0.0
  end
  
  ZERO = Vec4.new(0.0, 0.0, 0.0, 0.0).freeze
  
  alias + add
  alias - sub
  alias * mul
  alias / div
  alias == eq?
end

class Mat3x3
  attr_accessor(:xx, :xy, :xz, :yx, :yy, :yz, :zx, :zy, :zz)

  def initialize(xx = 0.0, xy = 0.0, xz = 0.0, yx = 0.0, yy = 0.0, yz = 0.0, zx = 0.0, zy = 0.0, zz = 0.0)
    @xx = xx
    @xy = xy
    @xz = xz
    @yx = yx
    @yy = yy
    @yz = yz
    @zx = zx
    @zy = zy
    @zz = zz
  end

  def to_a
    [[@xx, @xy, @xz], [@yx, @yy, @yz], [@zx, @zy, @zz]]
  end

  def set!(xx, xy, xz, yx, yy, yz,zx, zy, zz)
    @xx = xx
    @xy = xy
    @xz = xz
    @yx = yx
    @yy = yy
    @yz = yz
    @zx = zx
    @zy = zy
    @zz = zz
    self
  end

  def set_from!(mat3_other)
    @xx = mat3_other.xx
    @xy = mat3_other.xy
    @xz = mat3_other.xz
    @yx = mat3_other.yx
    @yy = mat3_other.yy
    @yz = mat3_other.yz
    @zx = mat3_other.zx
    @zy = mat3_other.zy
    @zz = mat3_other.zz
    self
  end

  def add!(mat3_rhs)
    @xx += mat3_rhs.xx
    @xy += mat3_rhs.xy
    @xz += mat3_rhs.xz
    @yx += mat3_rhs.yx
    @yy += mat3_rhs.yy
    @yz += mat3_rhs.yz
    @zx += mat3_rhs.zx
    @zy += mat3_rhs.zy
    @zz += mat3_rhs.zz
    self
  end

  def add_from!(mat3_lhs, mat3_rhs)
    @xx = mat3_lhs.xx + mat3_rhs.xx
    @xy = mat3_lhs.xy + mat3_rhs.xy
    @xz = mat3_lhs.xz + mat3_rhs.xz
    @yx = mat3_lhs.yx + mat3_rhs.yx
    @yy = mat3_lhs.yy + mat3_rhs.yy
    @yz = mat3_lhs.yz + mat3_rhs.yz
    @zx = mat3_lhs.zx + mat3_rhs.zx
    @zy = mat3_lhs.zy + mat3_rhs.zy
    @zz = mat3_lhs.zz + mat3_rhs.zz
    self
  end

  def add(mat3_rhs)
    Mat3x3.new(
      @xx + mat3_rhs.xx,
      @xy + mat3_rhs.xy,
      @xz + mat3_rhs.xz,
      @yx + mat3_rhs.yx,
      @yy + mat3_rhs.yy,
      @yz + mat3_rhs.yz,
      @zx + mat3_rhs.zx,
      @zy + mat3_rhs.zy,
      @zz + mat3_rhs.zz
    )
  end

  alias + add

  def sub!(mat3_rhs)
    @xx -= mat3_rhs.xx
    @xy -= mat3_rhs.xy
    @xz -= mat3_rhs.xz
    @yx -= mat3_rhs.yx
    @yy -= mat3_rhs.yy
    @yz -= mat3_rhs.yz
    @zx -= mat3_rhs.zx
    @zy -= mat3_rhs.zy
    @zz -= mat3_rhs.zz
    self
  end

  def sub_from!(mat3_lhs, mat3_rhs)
    @xx = mat3_lhs.xx - mat3_rhs.xx
    @xy = mat3_lhs.xy - mat3_rhs.xy
    @xz = mat3_lhs.xz - mat3_rhs.xz
    @yx = mat3_lhs.yx - mat3_rhs.yx
    @yy = mat3_lhs.yy - mat3_rhs.yy
    @yz = mat3_lhs.yz - mat3_rhs.yz
    @zx = mat3_lhs.zx - mat3_rhs.zx
    @zy = mat3_lhs.zy - mat3_rhs.zy
    @zz = mat3_lhs.zz - mat3_rhs.zz
    self
  end

  def sub(mat3_rhs)
    Mat3x3.new(
      @xx - mat3_rhs.xx,
      @xy - mat3_rhs.xy,
      @xz - mat3_rhs.xz,
      @yx - mat3_rhs.yx,
      @yy - mat3_rhs.yy,
      @yz - mat3_rhs.yz,
      @zx - mat3_rhs.zx,
      @zy - mat3_rhs.zy,
      @zz - mat3_rhs.zz
    )
  end

  alias - sub

  def eql?(other)
    @xx == other.xx && @xy == other.xy && @xz = other.xz &&
      @yx == other.yx && @yy == other.yy && @yz = other.yz &&
      @zx == other.zx && @zy == other.zy && @zz = other.zz
  end

  def inverse!
    m0 = @yy  * @zz -
      @zy  * @yz

    m3 = -@yx  * @zz +
      @zx  * @yz

    m6 = @yx  * @zy -
      @zx  * @yy

    m1 = -@xy  * @zz +
      @zy  * @xz

    m4 = @xx  * @zz -
      @zx  * @xz

    m7 = -@xx  * @zy +
      @zx  * @xy

    m2 = @xy  * @yz -
      @yy  * @xz

    m5 = -@xx  * @yz+
      @yx  * @xz

    m8 = @xx  * @yy -
      @yx  * @xy

    det = @xx * m0 + @xy * m3 + @xz * m6

    det = 1.0 / det

    @xx = m0 * det
    @xy = m1 * det
    @xz = m2 * det
    @yx = m3 * det
    @yy = m4 * det
    @yz = m5 * det
    @zx = m6 * det
    @zy = m7 * det
    @zz = m8 * det
    self
  end

  def inverse_from!(mat3_other)
    m0 = mat3_other.yy  * mat3_other.zz -
      mat3_other.zy  * mat3_other.yz

    m3 = -mat3_other.yx  * mat3_other.zz +
      mat3_other.zx  * mat3_other.yz

    m6 = mat3_other.yx  * mat3_other.zy -
      mat3_other.zx  * mat3_other.yy

    m1 = -mat3_other.xy  * mat3_other.zz +
      mat3_other.zy  * mat3_other.xz

    m4 = mat3_other.xx  * mat3_other.zz -
      mat3_other.zx  * mat3_other.xz

    m7 = -mat3_other.xx  * mat3_other.zy +
      mat3_other.zx  * mat3_other.xy

    m2 = mat3_other.xy  * mat3_other.yz -
      mat3_other.yy  * mat3_other.xz

    m5 = -mat3_other.xx  * mat3_other.yz +
      mat3_other.yx  * mat3_other.xz

    m8 = mat3_other.xx  * mat3_other.yy -
      mat3_other.yx  * mat3_other.xy

    det = mat3_other.xx * m0 + mat3_other.xy * m3 + mat3_other.xz * m6

    det = 1.0 / det

    @xx = m0 * det
    @xy = m1 * det
    @xz = m2 * det
    @yx = m3 * det
    @yy = m4 * det
    @yz = m5 * det
    @zx = m6 * det
    @zy = m7 * det
    @zz = m8 * det
    self
  end

  def inverse
    dup.inverse!
  end

  def identity!
    @xx = 1.0
    @xy = 0.0
    @xz = 0.0
    @yx = 0.0
    @yy = 1.0
    @yz = 0.0
    @zx = 0.0
    @zy = 0.0
    @zz = 1.0
    self
  end

  def identity
    dup.identity!
  end

  def transpose!
    _xy = @xy
    _xz = @xz
    _yz = @yz
    @xy = @yx
    @xz = @zx
    @yx = _xy
    @yz = @zy
    @zx = _xz
    @zy = _yz
    self
  end

  def transpose_from!(mat3_other)
    @xx = mat3_other.xx
    @xy = mat3_other.yx
    @xz = mat3_other.zx
    @yx = mat3_other.xy
    @yy = mat3_other.yy
    @yz = mat3_other.zy
    @zx = mat3_other.xz
    @zy = mat3_other.yz
    @zz = mat3_other.zz
    self
  end

  def transpose
    dup.transpose!
  end

  def determinant
    @xx * @yy * @zz + @xy * @yz * @zx + @xz * @yx * @zy - @zx * @yy * @xz - @zy * @yz * @xx - @zz * @yx * @xy
  end

  IDENTITY = Mat3x3.new(1.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0).freeze
  ZERO = Mat3x3.new.freeze
end

class Mat4x4
  attr_accessor(:xx, :xy, :xz, :xw, :yx, :yy, :yz, :yw, :zx, :zy, :zz, :zw, :wx, :wy, :wz, :ww)

  def initialize(xx = 0.0, xy = 0.0, xz = 0.0, xw = 0.0, yx = 0.0, yy = 0.0, yz = 0.0, yw = 0.0,
                 zx = 0.0, zy = 0.0, zz = 0.0, zw = 0.0, wx = 0.0, wy = 0.0, wz = 0.0, ww = 0.0)
    @xx = xx
    @xy = xy
    @xz = xz
    @xw = xw
    @yx = yx
    @yy = yy
    @yz = yz
    @yw = yw
    @zx = zx
    @zy = zy
    @zz = zz
    @zw = zw
    @wx = wx
    @wy = wy
    @wz = wz
    @ww = ww
  end

  def to_a
    [[@xx, @xy, @xz, @xw], [@yx, @yy, @yz, @yw], [@zx, @zy, @zz, @zw], [@wx, @wy, @wz, @ww]]
  end

  def set!(xx, xy, xz, xw, yx, yy, yz, yw, zx, zy, zz, zw, wx, wy, wz, ww)
    @xx = xx
    @xy = xy
    @xz = xz
    @xw = xw
    @yx = yx
    @yy = yy
    @yz = yz
    @yw = yw
    @zx = zx
    @zy = zy
    @zz = zz
    @zw = zw
    @wx = wx
    @wy = wy
    @wz = wz
    @ww = ww
    self
  end

  def set_from!(mat4_other)
    @xx = mat4_other.xx
    @xy = mat4_other.xy
    @xz = mat4_other.xz
    @xw = mat4_other.xw
    @yx = mat4_other.yx
    @yy = mat4_other.yy
    @yz = mat4_other.yz
    @yw = mat4_other.yw
    @zx = mat4_other.zx
    @zy = mat4_other.zy
    @zz = mat4_other.zz
    @zw = mat4_other.zw
    @wx = mat4_other.wx
    @wy = mat4_other.wy
    @wz = mat4_other.wz
    @ww = mat4_other.ww
    self
  end

  def add!(mat4_rhs)
    @xx += mat4_rhs.xx
    @xy += mat4_rhs.xy
    @xz += mat4_rhs.xz
    @xw += mat4_rhs.xw
    @yx += mat4_rhs.yx
    @yy += mat4_rhs.yy
    @yz += mat4_rhs.yz
    @yw += mat4_rhs.yw
    @zx += mat4_rhs.zx
    @zy += mat4_rhs.zy
    @zz += mat4_rhs.zz
    @zw += mat4_rhs.zw
    @wx += mat4_rhs.wx
    @wy += mat4_rhs.wy
    @wz += mat4_rhs.wz
    @ww += mat4_rhs.ww
    self
  end

  def add_from!(mat4_lhs, mat4_rhs)
    @xx = mat4_lhs.xx + mat4_rhs.xx
    @xy = mat4_lhs.xy + mat4_rhs.xy
    @xz = mat4_lhs.xz + mat4_rhs.xz
    @xw = mat4_lhs.xw + mat4_rhs.xw
    @yx = mat4_lhs.yx + mat4_rhs.yx
    @yy = mat4_lhs.yy + mat4_rhs.yy
    @yz = mat4_lhs.yz + mat4_rhs.yz
    @yw = mat4_lhs.yw + mat4_rhs.yw
    @zx = mat4_lhs.zx + mat4_rhs.zx
    @zy = mat4_lhs.zy + mat4_rhs.zy
    @zz = mat4_lhs.zz + mat4_rhs.zz
    @zw = mat4_lhs.zw + mat4_rhs.zw
    @wx = mat4_lhs.wx + mat4_rhs.wx
    @wy = mat4_lhs.wy + mat4_rhs.wy
    @wz = mat4_lhs.wz + mat4_rhs.wz
    @ww = mat4_lhs.ww + mat4_rhs.ww
    self
  end

  def add(mat4_rhs)
    Mat4x4.new(
      @xx + mat4_rhs.xx,
      @xy + mat4_rhs.xy,
      @xz + mat4_rhs.xz,
      @xw + mat4_rhs.xw,
      @yx + mat4_rhs.yx,
      @yy + mat4_rhs.yy,
      @yz + mat4_rhs.yz,
      @yw + mat4_rhs.yw,
      @zx + mat4_rhs.zx,
      @zy + mat4_rhs.zy,
      @zz + mat4_rhs.zz,
      @zw + mat4_rhs.zw,
      @wx + mat4_rhs.wx,
      @wy + mat4_rhs.wy,
      @wz + mat4_rhs.wz,
      @ww + mat4_rhs.ww
    )
  end

  alias + add

  def sub!(mat4_rhs)
    @xx -= mat4_rhs.xx
    @xy -= mat4_rhs.xy
    @xz -= mat4_rhs.xz
    @xw -= mat4_rhs.xw
    @yx -= mat4_rhs.yx
    @yy -= mat4_rhs.yy
    @yz -= mat4_rhs.yz
    @yw -= mat4_rhs.yw
    @zx -= mat4_rhs.zx
    @zy -= mat4_rhs.zy
    @zz -= mat4_rhs.zz
    @zw -= mat4_rhs.zw
    @wx -= mat4_rhs.wx
    @wy -= mat4_rhs.wy
    @wz -= mat4_rhs.wz
    @ww -= mat4_rhs.ww
    self
  end

  def sub_from!(mat4_lhs, mat4_rhs)
    @xx = mat4_lhs.xx - mat4_rhs.xx
    @xy = mat4_lhs.xy - mat4_rhs.xy
    @xz = mat4_lhs.xz - mat4_rhs.xz
    @xw = mat4_lhs.xw - mat4_rhs.xw
    @yx = mat4_lhs.yx - mat4_rhs.yx
    @yy = mat4_lhs.yy - mat4_rhs.yy
    @yz = mat4_lhs.yz - mat4_rhs.yz
    @yw = mat4_lhs.yw - mat4_rhs.yw
    @zx = mat4_lhs.zx - mat4_rhs.zx
    @zy = mat4_lhs.zy - mat4_rhs.zy
    @zz = mat4_lhs.zz - mat4_rhs.zz
    @zw = mat4_lhs.zw - mat4_rhs.zw
    @wx = mat4_lhs.wx - mat4_rhs.wx
    @wy = mat4_lhs.wy - mat4_rhs.wy
    @wz = mat4_lhs.wz - mat4_rhs.wz
    @ww = mat4_lhs.ww - mat4_rhs.ww
    self
  end

  def sub(mat4_rhs)
    Mat4x4.new(
      @xx - mat4_rhs.xx,
      @xy - mat4_rhs.xy,
      @xz - mat4_rhs.xz,
      @xw - mat4_rhs.xw,
      @yx - mat4_rhs.yx,
      @yy - mat4_rhs.yy,
      @yz - mat4_rhs.yz,
      @yw - mat4_rhs.yw,
      @zx - mat4_rhs.zx,
      @zy - mat4_rhs.zy,
      @zz - mat4_rhs.zz,
      @zw - mat4_rhs.zw,
      @wx - mat4_rhs.wx,
      @wy - mat4_rhs.wy,
      @wz - mat4_rhs.wz,
      @ww - mat4_rhs.ww
    )
  end

  def mul!(mat4_rhs)
    _xx = @xx * mat4_rhs.xx + @xy * mat4_rhs.yx + @xz * mat4_rhs.zx + @xw * mat4_rhs.wx
    _xy = @xx * mat4_rhs.xy + @xy * mat4_rhs.yy + @xz * mat4_rhs.zy + @xw * mat4_rhs.wy
    _xz = @xx * mat4_rhs.xz + @xy * mat4_rhs.yz + @xz * mat4_rhs.zz + @xw * mat4_rhs.wz
    _xw = @xx * mat4_rhs.xw + @xy * mat4_rhs.yw + @xz * mat4_rhs.zw + @xw * mat4_rhs.ww

    _yx = @yx * mat4_rhs.xx + @yy * mat4_rhs.yx + @yz * mat4_rhs.zx + @yw * mat4_rhs.wx
    _yy = @yx * mat4_rhs.xy + @yy * mat4_rhs.yy + @yz * mat4_rhs.zy + @yw * mat4_rhs.wy
    _yz = @yx * mat4_rhs.xz + @yy * mat4_rhs.yz + @yz * mat4_rhs.zz + @yw * mat4_rhs.wz
    _yw = @yx * mat4_rhs.xw + @yy * mat4_rhs.yw + @yz * mat4_rhs.zw + @yw * mat4_rhs.ww

    _zx = @zx * mat4_rhs.xx + @zy * mat4_rhs.yx + @zz * mat4_rhs.zx + @zw * mat4_rhs.wx
    _zy = @zx * mat4_rhs.xy + @zy * mat4_rhs.yy + @zz * mat4_rhs.zy + @zw * mat4_rhs.wy
    _zz = @zx * mat4_rhs.xz + @zy * mat4_rhs.yz + @zz * mat4_rhs.zz + @zw * mat4_rhs.wz
    _zw = @zx * mat4_rhs.xw + @zy * mat4_rhs.yw + @zz * mat4_rhs.zw + @zw * mat4_rhs.ww

    _wx = @wx * mat4_rhs.xx + @wy * mat4_rhs.yx + @wz * mat4_rhs.zx + @ww * mat4_rhs.wx
    _wy = @wx * mat4_rhs.xy + @wy * mat4_rhs.yy + @wz * mat4_rhs.zy + @ww * mat4_rhs.wy
    _wz = @wx * mat4_rhs.xz + @wy * mat4_rhs.yz + @wz * mat4_rhs.zz + @ww * mat4_rhs.wz
    _ww = @wx * mat4_rhs.xw + @wy * mat4_rhs.yw + @wz * mat4_rhs.zw + @ww * mat4_rhs.ww

    @xx = _xx
    @xy = _xy
    @xz = _xz
    @xw = _xw
    @yx = _yx
    @yy = _yy
    @yz = _yz
    @yw = _yw
    @zx = _zx
    @zy = _zy
    @zz = _zz
    @zw = _zw
    @wx = _wx
    @wy = _wy
    @wz = _wz
    @ww = _ww
    self
  end

  def mul_from!(mat4_lhs, mat4_rhs)
    @xx = mat4_lhs.xx * mat4_rhs.xx + mat4_lhs.xy * mat4_rhs.yx + mat4_lhs.xz * mat4_rhs.zx + mat4_lhs.xw * mat4_rhs.wx
    @xy = mat4_lhs.xx * mat4_rhs.xy + mat4_lhs.xy * mat4_rhs.yy + mat4_lhs.xz * mat4_rhs.zy + mat4_lhs.xw * mat4_rhs.wy
    @xz = mat4_lhs.xx * mat4_rhs.xz + mat4_lhs.xy * mat4_rhs.yz + mat4_lhs.xz * mat4_rhs.zz + mat4_lhs.xw * mat4_rhs.wz
    @xw = mat4_lhs.xx * mat4_rhs.xw + mat4_lhs.xy * mat4_rhs.yw + mat4_lhs.xz * mat4_rhs.zw + mat4_lhs.xw * mat4_rhs.ww

    @yx = mat4_lhs.yx * mat4_rhs.xx + mat4_lhs.yy * mat4_rhs.yx + mat4_lhs.yz * mat4_rhs.zx + mat4_lhs.yw * mat4_rhs.wx
    @yy = mat4_lhs.yx * mat4_rhs.xy + mat4_lhs.yy * mat4_rhs.yy + mat4_lhs.yz * mat4_rhs.zy + mat4_lhs.yw * mat4_rhs.wy
    @yz = mat4_lhs.yx * mat4_rhs.xz + mat4_lhs.yy * mat4_rhs.yz + mat4_lhs.yz * mat4_rhs.zz + mat4_lhs.yw * mat4_rhs.wz
    @yw = mat4_lhs.yx * mat4_rhs.xw + mat4_lhs.yy * mat4_rhs.yw + mat4_lhs.yz * mat4_rhs.zw + mat4_lhs.yw * mat4_rhs.ww

    @zx = mat4_lhs.zx * mat4_rhs.xx + mat4_lhs.zy * mat4_rhs.yx + mat4_lhs.zz * mat4_rhs.zx + mat4_lhs.zw * mat4_rhs.wx
    @zy = mat4_lhs.zx * mat4_rhs.xy + mat4_lhs.zy * mat4_rhs.yy + mat4_lhs.zz * mat4_rhs.zy + mat4_lhs.zw * mat4_rhs.wy
    @zz = mat4_lhs.zx * mat4_rhs.xz + mat4_lhs.zy * mat4_rhs.yz + mat4_lhs.zz * mat4_rhs.zz + mat4_lhs.zw * mat4_rhs.wz
    @zw = mat4_lhs.zx * mat4_rhs.xw + mat4_lhs.zy * mat4_rhs.yw + mat4_lhs.zz * mat4_rhs.zw + mat4_lhs.zw * mat4_rhs.ww

    @wx = mat4_lhs.wx * mat4_rhs.xx + mat4_lhs.wy * mat4_rhs.yx + mat4_lhs.wz * mat4_rhs.zx + mat4_lhs.ww * mat4_rhs.wx
    @wy = mat4_lhs.wx * mat4_rhs.xy + mat4_lhs.wy * mat4_rhs.yy + mat4_lhs.wz * mat4_rhs.zy + mat4_lhs.ww * mat4_rhs.wy
    @wz = mat4_lhs.wx * mat4_rhs.xz + mat4_lhs.wy * mat4_rhs.yz + mat4_lhs.wz * mat4_rhs.zz + mat4_lhs.ww * mat4_rhs.wz
    @ww = mat4_lhs.wx * mat4_rhs.xw + mat4_lhs.wy * mat4_rhs.yw + mat4_lhs.wz * mat4_rhs.zw + mat4_lhs.ww * mat4_rhs.ww
    self
  end
  
  def eql?(other)
    @xx == other.xx && @xy == other.xy && @xz = other.xz && @xw = other.xw &&
      @yx == other.yx && @yy == other.yy && @yz = other.yz && @yw = other.yw &&
      @zx == other.zx && @zy == other.zy && @zz = other.zz && @zw = other.zw &&
      @wx == other.wx && @wy == other.wy && @wz = other.wz && @ww = other.ww
  end

  def inverse!
    m0 = @yy  * @zz * @ww -
      @yy  * @zw * @wz -
      @zy  * @yz  * @ww +
      @zy  * @yw  * @wz +
      @wy * @yz  * @zw -
      @wy * @yw  * @zz

    m4 = -@yx  * @zz * @ww +
      @yx  * @zw * @wz +
      @zx  * @yz  * @ww -
      @zx  * @yw  * @wz -
      @wx * @yz  * @zw +
      @wx * @yw  * @zz

    m8 = @yx  * @zy * @ww -
      @yx  * @zw * @wy -
      @zx  * @yy * @ww +
      @zx  * @yw * @wy +
      @wx * @yy * @zw -
      @wx * @yw * @zy

    m12 = -@yx  * @zy * @wz +
      @yx  * @zz * @wy +
      @zx  * @yy * @wz -
      @zx  * @yz * @wy -
      @wx * @yy * @zz +
      @wx * @yz * @zy

    m1 = -@xy  * @zz * @ww +
      @xy  * @zw * @wz +
      @zy  * @xz * @ww -
      @zy  * @xw * @wz -
      @wy * @xz * @zw +
      @wy * @xw * @zz

    m5 = @xx  * @zz * @ww -
      @xx  * @zw * @wz -
      @zx  * @xz * @ww +
      @zx  * @xw * @wz +
      @wx * @xz * @zw -
      @wx * @xw * @zz

    m9 = -@xx  * @zy * @ww +
      @xx  * @zw * @wy +
      @zx  * @xy * @ww -
      @zx  * @xw * @wy -
      @wx * @xy * @zw +
      @wx * @xw * @zy

    m13 = @xx  * @zy * @wz -
      @xx  * @zz * @wy -
      @zx  * @xy * @wz +
      @zx  * @xz * @wy +
      @wx * @xy * @zz -
      @wx * @xz * @zy

    m2 = @xy  * @yz * @ww -
      @xy  * @yw * @wz -
      @yy  * @xz * @ww +
      @yy  * @xw * @wz +
      @wy * @xz * @yw -
      @wy * @xw * @yz

    m6 = -@xx  * @yz * @ww +
      @xx  * @yw * @wz +
      @yx  * @xz * @ww -
      @yx  * @xw * @wz -
      @wx * @xz * @yw +
      @wx * @xw * @yz

    m10 = @xx  * @yy * @ww -
      @xx  * @yw * @wy -
      @yx  * @xy * @ww +
      @yx  * @xw * @wy +
      @wx * @xy * @yw -
      @wx * @xw * @yy

    m14 = -@xx  * @yy * @wz +
      @xx  * @yz * @wy +
      @yx  * @xy * @wz -
      @yx  * @xz * @wy -
      @wx * @xy * @yz +
      @wx * @xz * @yy

    m3 = -@xy * @yz * @zw +
      @xy * @yw * @zz +
      @yy * @xz * @zw -
      @yy * @xw * @zz -
      @zy * @xz * @yw +
      @zy * @xw * @yz

    m7 = @xx * @yz * @zw -
      @xx * @yw * @zz -
      @yx * @xz * @zw +
      @yx * @xw * @zz +
      @zx * @xz * @yw -
      @zx * @xw * @yz

    m11 = -@xx * @yy * @zw +
      @xx * @yw * @zy +
      @yx * @xy * @zw -
      @yx * @xw * @zy -
      @zx * @xy * @yw +
      @zx * @xw * @yy

    m15 = @xx * @yy * @zz -
      @xx * @yz * @zy -
      @yx * @xy * @zz +
      @yx * @xz * @zy +
      @zx * @xy * @yz -
      @zx * @xz * @yy

    det = @xx * m0 + @xy * m4 + @xz * m8 + @xw * m12

    det = 1.0 / det

    @xx = m0 * det
    @xy = m1 * det
    @xz = m2 * det
    @xw = m3 * det
    @yx = m4 * det
    @yy = m5 * det
    @yz = m6 * det
    @yw = m7 * det
    @zx = m8 * det
    @zy = m9 * det
    @zz = m10 * det
    @zw = m11 * det
    @wx = m12 * det
    @wy = m13 * det
    @wz = m14 * det
    @ww = m15 * det
    self
  end

  def inverse_from!(mat4_other)
    m0 = mat4_other.yy  * mat4_other.zz * mat4_other.ww -
      mat4_other.yy  * mat4_other.zw * mat4_other.wz -
      mat4_other.zy  * mat4_other.yz  * mat4_other.ww +
      mat4_other.zy  * mat4_other.yw  * mat4_other.wz +
      mat4_other.wy * mat4_other.yz  * mat4_other.zw -
      mat4_other.wy * mat4_other.yw  * mat4_other.zz

    m4 = -mat4_other.yx  * mat4_other.zz * mat4_other.ww +
      mat4_other.yx  * mat4_other.zw * mat4_other.wz +
      mat4_other.zx  * mat4_other.yz  * mat4_other.ww -
      mat4_other.zx  * mat4_other.yw  * mat4_other.wz -
      mat4_other.wx * mat4_other.yz  * mat4_other.zw +
      mat4_other.wx * mat4_other.yw  * mat4_other.zz

    m8 = mat4_other.yx  * mat4_other.zy * mat4_other.ww -
      mat4_other.yx  * mat4_other.zw * mat4_other.wy -
      mat4_other.zx  * mat4_other.yy * mat4_other.ww +
      mat4_other.zx  * mat4_other.yw * mat4_other.wy +
      mat4_other.wx * mat4_other.yy * mat4_other.zw -
      mat4_other.wx * mat4_other.yw * mat4_other.zy

    m12 = -mat4_other.yx  * mat4_other.zy * mat4_other.wz +
      mat4_other.yx  * mat4_other.zz * mat4_other.wy +
      mat4_other.zx  * mat4_other.yy * mat4_other.wz -
      mat4_other.zx  * mat4_other.yz * mat4_other.wy -
      mat4_other.wx * mat4_other.yy * mat4_other.zz +
      mat4_other.wx * mat4_other.yz * mat4_other.zy

    m1 = -mat4_other.xy  * mat4_other.zz * mat4_other.ww +
      mat4_other.xy  * mat4_other.zw * mat4_other.wz +
      mat4_other.zy  * mat4_other.xz * mat4_other.ww -
      mat4_other.zy  * mat4_other.xw * mat4_other.wz -
      mat4_other.wy * mat4_other.xz * mat4_other.zw +
      mat4_other.wy * mat4_other.xw * mat4_other.zz

    m5 = mat4_other.xx  * mat4_other.zz * mat4_other.ww -
      mat4_other.xx  * mat4_other.zw * mat4_other.wz -
      mat4_other.zx  * mat4_other.xz * mat4_other.ww +
      mat4_other.zx  * mat4_other.xw * mat4_other.wz +
      mat4_other.wx * mat4_other.xz * mat4_other.zw -
      mat4_other.wx * mat4_other.xw * mat4_other.zz

    m9 = -mat4_other.xx  * mat4_other.zy * mat4_other.ww +
      mat4_other.xx  * mat4_other.zw * mat4_other.wy +
      mat4_other.zx  * mat4_other.xy * mat4_other.ww -
      mat4_other.zx  * mat4_other.xw * mat4_other.wy -
      mat4_other.wx * mat4_other.xy * mat4_other.zw +
      mat4_other.wx * mat4_other.xw * mat4_other.zy

    m13 = mat4_other.xx  * mat4_other.zy * mat4_other.wz -
      mat4_other.xx  * mat4_other.zz * mat4_other.wy -
      mat4_other.zx  * mat4_other.xy * mat4_other.wz +
      mat4_other.zx  * mat4_other.xz * mat4_other.wy +
      mat4_other.wx * mat4_other.xy * mat4_other.zz -
      mat4_other.wx * mat4_other.xz * mat4_other.zy

    m2 = mat4_other.xy  * mat4_other.yz * mat4_other.ww -
      mat4_other.xy  * mat4_other.yw * mat4_other.wz -
      mat4_other.yy  * mat4_other.xz * mat4_other.ww +
      mat4_other.yy  * mat4_other.xw * mat4_other.wz +
      mat4_other.wy * mat4_other.xz * mat4_other.yw -
      mat4_other.wy * mat4_other.xw * mat4_other.yz

    m6 = -mat4_other.xx  * mat4_other.yz * mat4_other.ww +
      mat4_other.xx  * mat4_other.yw * mat4_other.wz +
      mat4_other.yx  * mat4_other.xz * mat4_other.ww -
      mat4_other.yx  * mat4_other.xw * mat4_other.wz -
      mat4_other.wx * mat4_other.xz * mat4_other.yw +
      mat4_other.wx * mat4_other.xw * mat4_other.yz

    m10 = mat4_other.xx  * mat4_other.yy * mat4_other.ww -
      mat4_other.xx  * mat4_other.yw * mat4_other.wy -
      mat4_other.yx  * mat4_other.xy * mat4_other.ww +
      mat4_other.yx  * mat4_other.xw * mat4_other.wy +
      mat4_other.wx * mat4_other.xy * mat4_other.yw -
      mat4_other.wx * mat4_other.xw * mat4_other.yy

    m14 = -mat4_other.xx  * mat4_other.yy * mat4_other.wz +
      mat4_other.xx  * mat4_other.yz * mat4_other.wy +
      mat4_other.yx  * mat4_other.xy * mat4_other.wz -
      mat4_other.yx  * mat4_other.xz * mat4_other.wy -
      mat4_other.wx * mat4_other.xy * mat4_other.yz +
      mat4_other.wx * mat4_other.xz * mat4_other.yy

    m3 = -mat4_other.xy * mat4_other.yz * mat4_other.zw +
      mat4_other.xy * mat4_other.yw * mat4_other.zz +
      mat4_other.yy * mat4_other.xz * mat4_other.zw -
      mat4_other.yy * mat4_other.xw * mat4_other.zz -
      mat4_other.zy * mat4_other.xz * mat4_other.yw +
      mat4_other.zy * mat4_other.xw * mat4_other.yz

    m7 = mat4_other.xx * mat4_other.yz * mat4_other.zw -
      mat4_other.xx * mat4_other.yw * mat4_other.zz -
      mat4_other.yx * mat4_other.xz * mat4_other.zw +
      mat4_other.yx * mat4_other.xw * mat4_other.zz +
      mat4_other.zx * mat4_other.xz * mat4_other.yw -
      mat4_other.zx * mat4_other.xw * mat4_other.yz

    m11 = -mat4_other.xx * mat4_other.yy * mat4_other.zw +
      mat4_other.xx * mat4_other.yw * mat4_other.zy +
      mat4_other.yx * mat4_other.xy * mat4_other.zw -
      mat4_other.yx * mat4_other.xw * mat4_other.zy -
      mat4_other.zx * mat4_other.xy * mat4_other.yw +
      mat4_other.zx * mat4_other.xw * mat4_other.yy

    m15 = mat4_other.xx * mat4_other.yy * mat4_other.zz -
      mat4_other.xx * mat4_other.yz * mat4_other.zy -
      mat4_other.yx * mat4_other.xy * mat4_other.zz +
      mat4_other.yx * mat4_other.xz * mat4_other.zy +
      mat4_other.zx * mat4_other.xy * mat4_other.yz -
      mat4_other.zx * mat4_other.xz * mat4_other.yy

    det = mat4_other.xx * m0 + mat4_other.xy * m4 + mat4_other.xz * m8 + mat4_other.xw * m12

    det = 1.0 / det

    @xx = m0 * det
    @xy = m1 * det
    @xz = m2 * det
    @xw = m3 * det
    @yx = m4 * det
    @yy = m5 * det
    @yz = m6 * det
    @yw = m7 * det
    @zx = m8 * det
    @zy = m9 * det
    @zz = m10 * det
    @zw = m11 * det
    @wx = m12 * det
    @wy = m13 * det
    @wz = m14 * det
    @ww = m15 * det
    self
  end

  def inverse
    dup.inverse!
  end

  def identity!
    @xx = 1.0
    @xy = 0.0
    @xz = 0.0
    @xw = 0.0
    @yx = 0.0
    @yy = 1.0
    @yz = 0.0
    @yw = 0.0
    @zx = 0.0
    @zy = 0.0
    @zz = 1.0
    @zw = 0.0
    @wx = 0.0
    @wy = 0.0
    @wz = 0.0
    @ww = 1.0
    self
  end

  def identity
    dup.identity!
  end

  def transpose!
    _xy = @xy
    _xz = @xz
    _xw = @xw
    _yz = @yz
    _yw = @yw
    _zw = @zw
    @xy = @yx
    @xz = @zx
    @xw = @wx
    @yx = _xy
    @yz = @zy
    @yw = @wy
    @zx = _xz
    @zy = _yz
    @zw = @wz
    @wx = _xw
    @wy = _yw
    @wz = _zw
    self
  end

  def transpose_from!(mat4_other)
    @xx = mat4_other.xx
    @xy = mat4_other.yx
    @xz = mat4_other.zx
    @xw = mat4_other.wx
    @yx = mat4_other.xy
    @yy = mat4_other.yy
    @yz = mat4_other.zy
    @yw = mat4_other.wy
    @zx = mat4_other.xz
    @zy = mat4_other.yz
    @zz = mat4_other.zz
    @zw = mat4_other.wz
    @wx = mat4_other.xw
    @wy = mat4_other.yw
    @wz = mat4_other.zw
    @ww = mat4_other.ww
    self
  end

  def transpose
    dup.transpose!
  end

  def determinant
    m00 = @xx * @yy - @xy * @yx
    m01 = @xx * @yz - @xz * @yx
    m02 = @xx * @yw - @xw * @yx
    m03 = @xy * @yz - @xz * @yy
    m04 = @xy * @yw - @xw * @yy
    m05 = @xz * @yw - @xw * @yz
    m06 = @zx * @wy - @zy * @wx
    m07 = @zx * @wz - @zz * @wx
    m08 = @zx * @ww - @zw * @wx
    m09 = @zy * @wz - @zz * @wy
    m10 = @zy * @ww - @zw * @wy
    m11 = @zz * @ww - @zw * @wz

    m00 * m11 - m01 * m10 + m02 * m09 + m03 * m08 - m04 * m07 + m05 * m06
  end

  alias - sub
  
  IDENTITY = Mat4x4.new(1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0,
                        0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0).freeze
  ZERO = Mat4x4.new.freeze

end
