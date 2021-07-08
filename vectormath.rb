PI_OVER_180 = Math::PI / 180.0

# Vector2 ##############################################################################################################
Vec2 = Struct.new(:x, :y)

def vec2_dot(vec2_a, vec2_b)
  vec2_a.x * vec2_b.x + vec2_a.y * vec2_b.y
end

def vec2_cross(vec2_lhs, vec2_rhs)
  vec2_lhs.x * vec2_rhs.y - vec2_lhs.y * vec2_rhs.y
end

def vec2_add(vec2_out, vec2_lhs, vec2_rhs)
  vec2_out.x = vec2_lhs.x + vec2_rhs.x
  vec2_out.y = vec2_lhs.y + vec2_rhs.y
  vec2_out
end

def vec2_sub(vec2_out, vec2_lhs, vec2_rhs)
  vec2_out.x = vec2_lhs.x - vec2_rhs.x
  vec2_out.y = vec2_lhs.y - vec2_rhs.y
  vec2_out
end

def vec2_mul(vec2_out, vec2_lhs, scalar_rhs)
  vec2_out.x = vec2_lhs.x * scalar_rhs
  vec2_out.y = vec2_lhs.y * scalar_rhs
  vec2_out
end

def vec2_mul_add(vec2_out, vec2_lhs, scalar_rhs)
  vec2_out = vec2_lhs.x * scalar_rhs
  vec2_out = vec2_lhs.y * scalar_rhs
  vec2_out
end

def vec2_mul_mat2(vec2_out, vec2_a, mat2_a)
  vec2_out.x = mat2_a.x.x * vec2_a.x + mat2_a.y.x * vec2_a.y
  vec2_out.y = mat2_a.x.y * vec2_a.x + mat2_a.y.y * vec2_a.y
  vec2_out
end

def vec2_element_mul(vec2_out, vec2_lhs, vec2_rhs)
  vec2_out.x = vec2_lhs.x * vec2_rhs.x
  vec2_out.y = vec2_lhs.y * vec2_rhs.y
  vec2_out
end

def vec2_element_div(vec2_out, vec2_lhs, vec2_rhs)
  vec2_out.x = vec2_lhs.x / vec2_rhs.x
  vec2_out.y = vec2_lhs.y / vec2_rhs.y
  vec2_out
end

def vec2_min(vec2_out, vec2_a, vec2_b)
  vec2_out.x = vec2_a.x < vec2_b.x ? vec2_a.x : vec2_b.x
  vec2_out.y = vec2_a.y < vec2_b.y ? vec2_a.y : vec2_b.y
  vec2_out
end

def vec2_max(vec2_out, vec2_a, vec2_b)
  vec2_out.x = vec2_a.x > vec2_b.x ? vec2_a.x : vec2_b.x
  vec2_out.y = vec2_a.y > vec2_b.y ? vec2_a.y : vec2_b.y
  vec2_out
end

def vec2_abs(vec2_out, vec2_a)
  vec2_out.x = vec2_a.x.abs
  vec2_out.y = vec2_a.y.abs
  vec2_out
end

def vec2_eq(vec2_a, vec2_b)
  vec2_a.x == vec2_b.x && vec2_a.y == vec2_b.y
end

def vec2_lerp(vec2_out, vec2_a, vec2_b, scalar_t)
  vec2_out.x = vec2_a.x + scalar_t * (vec2_b.x - vec2_a.x)
  vec2_out.y = vec2_a.y + scalar_t * (vec2_b.y - vec2_a.y)
  vec2_out
end

def vec2_scale(vec2_out, vec2_a, scalar)
  vec2_out.x = vec2_a.x * scalar
  vec2_out.y = vec2_a.y * scalar
  vec2_out
end

def vec2_rotate_by(vec2_out, vec2_a, scalar_degrees, vec2_center)
  radians = scalar_degrees * PI_OVER_180
  cos = Math.cos(radians)
  sin = Math.sin(radians)

  vec2_out.x = vec2_a.x - vec2_center.x
  vec2_out.y = vec2_a.y - vec2_center.y
  vec2_out.x = (vec2_out.x * cos - vec2_out.y * sin) + vec2_center.x
  vec2_out.y = (vec2_out.x * sin + vec2_out.y * cos) + vec2_center.y
  vec2_out
end

def vec2_distance(vec2_a, vec2_b)
  Math.sqrt(vec2_a.x * vec2_a.x + vec2_a.y * vec2_a.y) - Math.sqrt(vec2_b.x * vec2_b.x + vec2_b.y * vec2_b.y)
end

def vec2_length(vec2_a)
  Math.sqrt(vec2_a.x * vec2_a.x + vec2_a.y * vec2_a.y)
end

def vec2_length_sq(vec2_a)
  vec2_a.x * vec2_a.x + vec2_a.y * vec2_a.y
end

def vec2_normalize(vec2_out, vec2_a)
  inverse_length = 1.0 / Math.sqrt(vector_a.x * vector_a.x + vector_a.y * vector_a.y)
  vec2_out.x = vec2_a.x * inverse_length
  vec2_out.y = vec2_a.y * inverse_length
  vec2_out
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
