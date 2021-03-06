require "./lib/prct09/matriz.rb"
require "./lib/prct09/fracciones.rb"

describe MatrizDensa do
	before :each do
		# Creamos una matriz llamada matrix de tipo Matriz.
      matrix = Matriz.new();
      
      # MATRICES ENTERAS
      # Densas
      @matriz1 = matrix.tipo([[1, 2], [3, 4]])
      @matriz2 = matrix.tipo([[2, 3], [4, 5]])
      @matrizComp = matrix.tipo([[1, 2], [3, 4]])
		@matrizDen = matrix.tipo([[1, 0], [1, 1]])
		@matrizDisp = matrix.tipo([[1, 0], [0, 0]])
		
		# FRACCIONES
		@numFrac = [[Fraccion.new(1, 2), Fraccion.new(0, 1)], [Fraccion.new(0, 1), Fraccion.new(0, 1)]]
      @numFra1 = [[Fraccion.new(3, 2), Fraccion.new(1, 1)], [Fraccion.new(1, 1), Fraccion.new(1, 1)]]
      @numFra2 = [[Fraccion.new(1, 2), Fraccion.new(1, 2)], [Fraccion.new(0, 1), Fraccion.new(0, 1)]]

		# MATRICES FRACCION
		@matFra1 = matrix.tipo([[1, 1], [1, 1]])
      @matFra2 = matrix.tipo(@numFrac)
    

      # Resultados
      @sumDensa = matrix.tipo([[3, 5], [7, 9]])
      @mulDensa = matrix.tipo([[10, 13], [22, 29]])
		@restDensa = matrix.tipo([[1, 1], [1, 1]])
		@sumDensaDispersa = matrix.tipo([[2, 0], [1, 1]])
		@sumFrac = matrix.tipo(@numFra1)
      @multFrac = matrix.tipo(@numFra2)
      
   end

   
	describe "# Filas y columnas de una matriz" do
	   it " Numero de filas " do
	      @matriz1.filas.should eq(2)
      end
      it " Numero de columnas " do
         @matriz1.columnas.should eq(2)
      end
		it "Debe existir un numero de filas para mat_D (Fracciones)" do
         @matFra1.filas.should eq(2)
      end
      it "Debe existir un numero de columnas para mat_C (1,1,1,1)" do
         @matFra1.columnas.should eq(2)
      end
	end

	 
   describe "# Operaciones " do
		it " Suma " do
	 	   sum = @matriz1 + @matriz2
	      sum.should == @sumDensa
	   end

		it " Suma de una matriz densa y una dispersa " do
         sum = @matrizDen + @matrizDisp
			sum.should == @sumDensaDispersa 
		end

		it " Suma con fracciones " do
			sumFr = @matFra1 + @matFra2
			sumFr.should == @sumFrac
      end

		it " Multiplicacion con fracciones " do
			multFr = @matFra1 * @matFra2
			multFr.should == @multFrac
		end

		it " Resta " do
			rest = @matriz2 - @matriz1
			rest.should == @restDensa
		end
	
	  	it "Maximo" do
   	   @matriz1.max.should eq(4)
      end

      it "Minimo" do
         @matriz1.min.should eq(1)
      end

   	it " Dos matrices densas " do
      	mult = @matriz1 * @matriz2
         mult.should == @mulDensa
      end

		it " Si son iguales " do
      	@matriz1.should == @matrizComp
      end
   end

   describe "# Densa: comparador " do
   	it " Menor, < " do
   	   (@matriz1 < @matriz2).should eq(true)
      end
      it " Mayor, > " do
         (@matriz1 > @matriz2).should eq(false)
      end
   end


end
