require 'rubypython'

class Matrix

  def nullspace_as_string
    a = to_a
    RubyPython.start
    main = RubyPython.import('__main__')
    RubyPython::Python.PyRun_SimpleString <<-PYTHON
from sympy import Matrix
import numpy as np
def null_space(a):
  return np.array_str(np.array(Matrix(a).nullspace()))
    PYTHON
    main.null_space(a).rubify
  end

  def nullspace_array
    nullspace_as_string[2..-3].split(' ').map(&:to_r)
  end
end
