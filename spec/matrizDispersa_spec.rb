require "./lib/prct09/matriz.rb"

describe MatrizDispersa do
	before :each do
		# Creamos una matriz llamada matrix de tipo Matriz.
      matrix = Matriz.new();
      
      # MATRICES ENTERAS
      # Dispersas
      @matriz3 = matrix.tipo([[1, 0], [0, 0]])
      @matriz4 = matrix.tipo([[4, 0], [0, 0]])
 		@matriz5 = matrix.tipo([[3, 0], [0, 0]])
		@matrizDen = matrix.tipo([[1, 0], [1, 1]])
		@matrizDisp = matrix.tipo([[1, 0], [0, 0]])
      

      # Resultados
      @sumDispersa = matrix.tipo([[3, 0], [0, 0]])
		#@multDispersa = matrix.tipo([[4, 0], [0, 0]])
      @matrizComp = matrix.tipo([[1, 0], [0, 0]])
		@sumDispersaDensa = matrix.tipo([[2, 0], [1, 1]])
		
      
   end

   # Matrices Dispersas
   

  	describe "# Numero filas y columnas " do
   	it " Filas " do
   	   @matriz3.filas.should eq(2)
   	end
      it " Columnas " do
      	@matriz3.columnas.should eq(2)
      end
   end

   describe "# Operaciones " do
	   it " Suma " do
         sum = (@matriz3 + @matriz4)
         sum.to_s.should eq("5 0 \n0 0 \n")
      end

		it " Suma de una matriz dispersa y una densa " do
         sum = @matrizDen + @matrizDisp
			sum.should == @sumDispersaDensa
		end		
	
		it " Resta " do
         sum = (@matriz4 - @matriz5)
         sum.to_s.should eq("1 0 \n0 0 \n")
      end
   
		it " Multiplicacion " do
			mult = @matriz3 * @matriz4
			mult.to_s.should eq("8 0 \n0 0 \n")
		end
    
      it " Maximo " do
			@matriz3.max.should eq(1)
      end
  
      it " Minimo " do
			@matriz4.min.should eq(0)
      end

		it "La matriz debe contener datos" do
    	  @matriz3.should == @matrizComp
      end
	end



	

	describe "# Comparador <=> " do
		it " < " do
		(@matriz3 < @matriz4).should eq(true)	
		end
		it " > " do
		(@matriz3 > @matriz4).should eq(false)
		end
   end



	


end
