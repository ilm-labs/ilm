require 'rubypython'

class Matrix

  def methodmy
    a = to_a
    RubyPython.start
    main = RubyPython.import("__main__")
    RubyPython::Python.PyRun_SimpleString <<-PYTHON
from sympy import Matrix
import numpy as np
def null_space(a):
  sympyMatrix = Matrix(a).nullspace()
  numpyArray = np.array(sympyMatrix)
  #print "printing array as string"
  return np.array_str(numpyArray)
  #return numpyArray
    PYTHON
    a1 = main.null_space(a).rubify
  end

  def nullspace
    str = methodmy
    str[2..(str.length-3)].split(' ').map(&:to_r)
  end
end