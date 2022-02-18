def test
  #
  # Matrix4x4
  #
  mat4x4 = Mat4x4.new(1,2,3,-4,1,1,-1,1,1,-1,1,1,-2,1,1,1)
  mat4x4.inverse!
  eq = mat4x4.to_a == [[0.08, 0.28, 0.24, -0.2], [0.12, 0.42, -0.14, 0.2], [0.12, -0.08, 0.36, 0.2], [-0.08, 0.22, 0.26, 0.2]] ? 'passed' : 'failed'
  puts "Mat4x4 inverse! #{eq}"

  mat4x4 = Mat4x4.new(1,2,3,-4,5,6,-7,8,9,-1,1,1,-2,1,1,1)
  mat4x4.inverse_from!(Mat4x4.new(1,2,3,-4,1,1,-1,1,1,-1,1,1,-2,1,1,1))
  eq = mat4x4.to_a == [[0.08, 0.28, 0.24, -0.2], [0.12, 0.42, -0.14, 0.2], [0.12, -0.08, 0.36, 0.2], [-0.08, 0.22, 0.26, 0.2]] ? 'passed' : 'failed'
  puts "Mat4x4 inverse_from! #{eq}"

  mat4x4 = Mat4x4.new(1,2,3,-4,1,1,-1,1,1,-1,1,1,-2,1,1,1)
  mat4x4.add!(Mat4x4.new(1,2,3,-4,1,1,-1,1,1,-1,1,1,-2,1,1,1))
  mat4x4.sub!(Mat4x4.new(1,2,3,-4,1,1,-1,1,1,-1,1,1,-2,1,1,1))
  eq = mat4x4.to_a == [[1,2,3,-4], [1,1,-1,1], [1,-1,1,1], [-2,1,1,1]] ? 'passed' : 'failed'

  puts "Mat4x4 add! and subtract! #{eq}"

  mat4x4 = Mat4x4.new(1,2,3,-4,1,1,-1,1,1,-1,1,1,-2,1,1,1)
  mat4x4.set_from!(Mat4x4.new(-1,-2,-3,4,-1,-1,1,-1,-1,1,-1,-1,2,-1,-1,-1))
  eq = mat4x4.to_a == [[-1,-2,-3,4], [-1,-1,1,-1], [-1,1,-1,-1], [2,-1,-1,-1]] ? 'passed' : 'failed'

  puts "Mat4x4 set_from! #{eq}"

  mat4x4 = Mat4x4.new(1,2,3,-4,1,1,-1,1,1,-1,1,1,-2,1,1,1)
  mat4x4_2 = Mat4x4.new(1,2,3,-4,1,1,-1,1,1,-1,1,1,-2,1,1,1)
  eq = mat4x4.eql?(mat4x4_2) ? 'passed' : 'failed'

  puts "Mat4x4 eql? #{eq}"

  mat4x4 = Mat4x4.new(0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5)
  mat4x4.transpose_from!(Mat4x4.new(1,2,3,-4,1,1,-1,1,1,-1,1,1,-2,1,1,1)).transpose!
  eq = mat4x4.to_a == [[1,2,3,-4], [1,1,-1,1], [1,-1,1,1], [-2,1,1,1]] ? 'passed' : 'failed'

  puts "Mat4x4 transpose! and transpose_from! #{eq}"

  mat4x4 = Mat4x4.new(-12,1,2,3,4,5,6,7,8,9,-14,1,2,3,4,5)
  det = mat4x4.determinant
  eq = det ==  912 ? 'passed' : 'failed'

  puts "Mat4x4 determinant #{eq}"

  #
  # Matrix3x3
  #
  mat3x3 = Mat3x3.new(4, -3,-4,3,0,1,2,1,2)
  mat3x3.inverse!
  eq = mat3x3.to_a == [[0.25, -0.5, 0.75], [1.0, -4.0, 4.0], [-0.75, 2.5, -2.25]] ? 'passed' : 'failed'
  puts "Mat3x3 inverse! #{eq}"

  mat3x3 = Mat3x3.new(4, -3,-4,7,8,9,2,1,2)
  mat3x3.inverse_from!(Mat3x3.new(4, -3,-4,3,0,1,2,1,2))
  eq = mat3x3.to_a == [[0.25, -0.5, 0.75], [1.0, -4.0, 4.0], [-0.75, 2.5, -2.25]] ? 'passed' : 'failed'
  puts "Mat3x3 inverse_from! #{eq}"

  mat3x3 = Mat3x3.new(1,2,3,-4,1,1,-1,1,1)
  mat3x3.add!(Mat3x3.new(1,2,3,-4,1,1,-1,1,1))
  mat3x3.sub!(Mat3x3.new(1,2,3,-4,1,1,-1,1,1))
  eq = mat3x3.to_a == [[1,2,3], [-4,1,1], [-1,1,1]] ? 'passed' : 'failed'

  puts "Mat3x3 add! and subtract! #{eq}"

  mat3x3 = Mat3x3.new(1,2,3,-4,1,1,-1,1,1)
  mat3x3.set_from!(Mat3x3.new(-10,-2,7,-4,-5,1,-1,8,9))
  eq = mat3x3.to_a == [[-10,-2,7], [-4,-5,1], [-1,8,9]] ? 'passed' : 'failed'

  puts "Mat3x3 set_from! #{eq}"

  mat3x3 = Mat3x3.new(1,2,3,-4,1,1,-1,1,1)
  mat3x3_2 = Mat3x3.new(1,2,3,-4,1,1,-1,1,1)
  eq = mat3x3.eql?(mat3x3_2) ? 'passed' : 'failed'

  puts "Mat3x3 eql? #{eq}"

  mat3x3 = Mat3x3.new(0,1,2,3,4,5,6,7,8)
  mat3x3.transpose_from!(Mat3x3.new(1,2,3,-4,9,8,7,6,5)).transpose!
  eq = mat3x3.to_a == [[1,2,3], [-4,9,8], [7,6,5]] ? 'passed' : 'failed'

  puts "Mat3x3 transpose! and transpose_from! #{eq}"

  mat3x3 = Mat3x3.new(6,-1,7,-7,1,-7,5,3,2)
  det = mat3x3.determinant
  eq = det == -23 ? 'passed' : 'failed'

  puts "Mat3x3 determinant #{eq}"

  #
  # Matrix2x2
  #
  mat2x2 = Mat2x2.new(1, 2, -2, 1)
  mat2x2.inverse!
  eq = mat2x2.to_a == [[0.2, -0.4], [0.4, 0.2]] ? 'passed' : 'failed'
  puts "Mat2x2 inverse! #{eq}"

  mat2x2 = Mat2x2.new(1, 2, 3, 4)
  mat2x2.inverse_from!(Mat2x2.new(1, 2, -2, 1))
  eq = mat2x2.to_a == [[0.2, -0.4], [0.4, 0.2]] ? 'passed' : 'failed'
  puts "Mat2x2 inverse_from! #{eq}"

  mat2x2 = Mat2x2.new(1,5,6,-4)
  mat2x2.add!(Mat2x2.new(1,2,3,-4))
  mat2x2.sub!(Mat2x2.new(1,2,3,-4))
  eq = mat2x2.to_a == [[1,5], [6,-4]] ? 'passed' : 'failed'

  puts "Mat2x2 add! and subtract! #{eq}"

  mat2x2 = Mat2x2.new(1,2,3,-4)
  mat2x2.set_from!(Mat2x2.new(-10,-2,7,8))
  eq = mat2x2.to_a == [[-10,-2], [7,8]] ? 'passed' : 'failed'

  puts "Mat2x2 set_from! #{eq}"

  mat2x2 = Mat2x2.new(1,2,3,-4)
  mat2x2_2 = Mat2x2.new(1,2,3,-4)
  eq = mat2x2.eql?(mat2x2_2) ? 'passed' : 'failed'

  puts "Mat2x2 eql? #{eq}"

  mat2x2 = Mat2x2.new(0,1,2,3)
  mat2x2.transpose_from!(Mat2x2.new(1,2,3,-4)).transpose!
  eq = mat2x2.to_a == [[1,2], [3,-4]] ? 'passed' : 'failed'

  puts "Mat2x2 transpose! and transpose_from! #{eq}"

  mat2x2 = Mat2x2.new(1,2,-2,1)
  det = mat2x2.determinant
  eq = det == 5 ? 'passed' : 'failed'

  puts "Mat2x2 determinant #{eq}"
end
