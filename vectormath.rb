PI_OVER_180 = Math::PI / 180.0

# Vector2 ##############################################################################################################
class Vec2
  attr_accessor(:x, :y)

  def initialize(x = 0.0, y = 0.0)
    @x = x
    @y = y
  end

  def add!(vec2_rhs)
    @x += vec2_rhs.x
    @y += vec2_rhs.y
  end

  def add2_self!(vec2_lhs, vec2_rhs)
    @x = vec2_lhs.x + vec2_rhs.x
    @y = vec2_rhs.y + vec2_rhs.y
  end

  def add2!(vec2_lhs, vec2_rhs)
    @x = vec2_lhs.x + vec2_rhs.x
    @y = vec2_rhs.y + vec2_rhs.y
  end

  def sub!(vec2_rhs)
    @x -= vec2_rhs.x
    @y -= vec2_rhs.y
  end

  def sub2!(vec2_lhs, vec2_rhs)
    @x = vec2_lhs.x - vec2_rhs.x
    @y = vec2_lhs.y - vec2_lhs.y
  end

  def mul!(scalar_rhs)
    @x *= scalar_rhs
    @y *= scalar_rhs
  end

  def mul2!(vec2_lhs, scalar_rhs)
    @x = vec2_lhs.x * scalar_rhs
    @y = vec2_lhs.y * scalar_rhs
  end

  def mul_add!(vec2_rhs, scalar_mul)
    @x += vec2_rhs * scalar_mul
    @y += vec2_rhs * scalar_mul
  end

  def mul_add2!(vec2_lhs, vec2_rhs, scalar_rhs)
    @x = vec2_lhs.x + vec2_rhs.x * scalar_rhs
    @y = vec2_lhs.y + vec2_rhs.y * scalar_rhs
  end

  def element_mul!(vec2_rhs)
    @x *= vec2_rhs.x
    @y *= vec2_rhs.x
  end

  def element_mul2!(vec2_lhs, vec2_rhs)
    @x = vec2_lhs.x * vec2_rhs.x
    @y = vec2_lhs.y * vec2_rhs.y
  end

  def element_div!(vec2_rhs)
    @x /= vec2_rhs.x
    @y /= vec2_rhs.y
  end

  def element_div2!(vec2_lhs, vec2_rhs)
    @x = vec2_lhs.x / vec2_rhs.x
    @y = vec2_lhs.y / vec2_rhs.y
  end

  def dot(vec2_rhs)
    @x * vec2_rhs.x + @y * vec2_rhs.y
  end

  def cross(vec2_rhs)
    @y * vec2_rhs.x - @y * vec2_rhs.y
  end

  def min!(vec2_rhs)
    @x = @x < vec2_rhs.x ? @x : vec2_rhs.x
    @y = @y < vec2_rhs.y ? @y : vec2_rhs.y
  end

  def min2!(vec2_lhs, vec2_rhs)
    @x = vec2_lhs.x < vec2_rhs.x ? vec2_lhs.x : vec2_rhs.x
    @y = vec2_lhs.y < vec2_rhs.y ? vec2_lhs.y : vec2_rhs.y
  end

  def max!(vec2_rhs)
    @x = @x > vec2_rhs.x ? @x : vec2_rhs.x
    @y = @y > vec2_rhs.y ? @y : vec2_rhs.y
  end

  def max2!(vec2_lhs, vec2_rhs)
    @x = vec2_lhs.x > vec2_rhs.x ? vec2_lhs.x : vec2_rhs.x
    @y = vec2_lhs.y > vec2_rhs.y ? vec2_lhs.y : vec2_rhs.y
  end

  def abs!
    @x = @x.abs
    @y = @y.abs
  end

  def lerp!(vec2_rhs, scalar_t)
    @x += scalar_t * (vec2_rhs.x - @x)
    @y += scalar_t * (vec2_rhs.y - @y)
  end

  def lerp2!(vec2_lhs, vec2_rhs, scalar_t)
    @x = vec2_lhs.x + scalar_t * (vec2_rhs.x - vec2_lhs.x)
    @y = vec2_lhs.y + scalar_t * (vec2_rhs.y - vec2_lhs.y)
  end

  def distance(vec2_rhs)
    Math.sqrt(@x * @x + @y * @y) - Math.sqrt(vec2_rhs.x * vec2_rhs.x + vec2_rhs.y * vec2_rhs.y)
  end

  def length
    Math.sqrt(@x * @x + @y * @y)
  end

  def length_sq
    @x * @x + @y * @y
  end

  def normalize!
    inverse_length = 1.0 / Math.sqrt(@x * @x + @y * @y)
    @x *= inverse_length
    @y *= inverse_length
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
end

# Matrix 2x2 ###########################################################################################################
Mat2 = Struct.new(:m00, :m01, :m10, :m11)

def mat2_add_mat2(mat2_out, mat2_a, mat2_b)
  mat2_out.x = mat2_a.x + mat2_b.x
  mat2_out.y = mat2_a.y + mat2_b.y
  mat2_out
end

def mat2_mul_scalar(mat2_out, mat2_a, scalar)
  mat2_out.x = mat2_a.x * scalar
  mat2_out.y = mat2_a.y * scalar
  mat2_out
end

def mat2_mul_mat2(mat2_out, mat2_a, mat2_b)
  mat2_out.x.x = mat2_a.x.x * mat2_b.x.x + mat2_a.x.y * mat2_b.y.x
  mat2_out.x.y = mat2_a.x.x * mat2_b.x.y + mat2_a.x.y * mat2_b.y.y
  mat2_out.y.x = mat2_a.y.x * mat2_b.x.x + mat2_a.y.y * mat2_b.y.x
  mat2_out.y.y = mat2_a.y.x * mat2_b.x.y + mat2_a.y.y * mat2_b.y.y
  mat2_out
end

def mat2_eq(mat2_a, mat2_b)
  mat2_a.x.x == mat2_b.x.x && mat2_a.x.y == mat2_b.x.y && mat2_a.y.x == mat2_b.y.x && mat2_a.y.y == mat2_b.y.y
end

def mat2_zero(mat2_out)
  mat2_out
end

def mat2_inverse(mat2_out, mat2_a)
  a = mat2_a.x.x
  b = mat2_a.y.x
  c = mat2_a.x.y
  d = mat2_a.y.y
  determinant = (1.0 / a * d - b * c)

  mat2_out.x.x = d *  determinant
  mat2_out.x.y = c * -determinant
  mat2_out.y.x = b * -determinant
  mat2_out.y.y = a *  determinant
  mat2_out
end

def mat2_identity(mat2_out)
  mat2_out.x.x = 1.0
  mat2_out.x.y = 0.0
  mat2_out.y.x = 0.0
  mat2_out.y.y = 1.0
  mat2_out
end

def mat2_transpose(mat2_out, mat2_a)
  mat2_out.x.x = mat2_a.x.x
  mat2_out.x.y = mat2_a.y.x
  mat2_out.y.x = mat2_a.x.y
  mat2_out.y.y = mat2_a.y.y
  mat2_out
end
