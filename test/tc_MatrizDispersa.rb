require "./lib/prct09/matriz.rb"
require 'test/unit'

class Test_MatrizDispersa < Test::Unit::TestCase

	def setup	
		Matrix = Matriz.new()
		@matriz3 = Matrix.tipo([[1, 0], [0, 0]])
		@matriz4 = Matrix.tipo([[4, 0], [0, 0]])
	end

	def test_init
		assert_equal("1 0 \n0 0 \n", @matriz3.to_s)
		assert_equal("4 0 \n0 0 \n", @matriz4.to_s)
	end

	def test_class
		assert_equal("MatrizDispersa", @matriz3.class.to_s)
		assert_equal("MatrizDispersa", @matriz4.class.to_s)
	end

	def test_suma
   	m_sum = @matriz3 + @matriz4
   	assert_equal("5 0 \n0 0 \n", m_sum.to_s)
  	end
  
  	def test_multiplicacion
   	m_mult = @matriz3 * @matriz4
    	assert_equal("8 0 \n0 0 \n", m_mult.to_s)
  end
end
