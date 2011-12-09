# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
  ab = a == b
  bc = b == c
  ca = c == a
  if ab && bc && ca
    :equilateral
  elsif ab || bc ||ca
    :isosceles
  else
    if a + b < c || b + c < a || c + a < b
      :not_a_triangle
    else
      :scalene
    end
  end
end
