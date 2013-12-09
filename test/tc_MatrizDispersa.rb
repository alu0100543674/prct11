require "./lib/prct09/matriz.rb"
require 'test/unit'

class Test_Matriz_Dispersa < Test::Unit::TestCase

	def setup	
		matrizSuper = Matriz.new()
		@matriz3 = matrizSuper.tipo([[1, 0], [0, 0]])
		@matriz4 = matrizSuper.tipo([[4, 0], [0, 0]])
	end

	def test_initialize
		assert_equal("1 0 \n0 0 \n", @matriz3.to_s)
		assert_equal("4 0 \n0 0 \n", @matriz4.to_s)
	end

	def test_clase
		assert_equal("MatrizDispersa", @matriz3.class.to_s)
		assert_equal("MatrizDispersa", @matriz4.class.to_s)
	end

	def test_sum
   	m_sum = @matriz3 + @matriz4
   	assert_equal("5 0 \n0 0 \n", m_sum.to_s)
  	end
  
  	def test_mult
   	m_mult = @matriz3 * @matriz4
    	assert_equal("8 0 \n0 0 \n", m_mult.to_s)
  end
end