require "./lib/prct09/matriz.rb"

describe MatrizDispersa do
	before :each do
		# Creamos una matriz llamada matrizSuper de tipo Matriz.
      matrizSuper = Matriz.new();
      
      # MATRICES ENTERAS
      # Dispersas
      @matriz3 = matrizSuper.tipo([[1, 0], [0, 0]])
      @matriz4 = matrizSuper.tipo([[4, 0], [0, 0]])
      

      # Resultados
      @sumDispersa = matrizSuper.tipo([[3, 0], [0, 0]])
		#@multDispersa = matrizSuper.tipo([[4, 0], [0, 0]])
      @matrizComp = matrizSuper.tipo([[1, 0], [0, 0]])
		
      
   end

   # Matrices Dispersas
   

  	describe "# Dispersa: Numero filas y columnas " do
   	it " Filas " do
   	   @matriz3.filas.should eq(2)
   	end
      it " Columnas " do
      	@matriz3.columnas.should eq(2)
      end
   end

   describe "# Operaciones " do
	   it "Se deben poder sumar dos matrices" do
         sum = (@matriz3 + @matriz4)
         sum.to_s.should eq("5 0 \n0 0 \n")
      end
   
		it " Multiplicacion " do
			mult = @matriz3 * @matriz4
			mult.to_s.should eq("8 0 \n0 0 \n")
		end
	end

	describe "# Comprobando que la matriz no esta vacia" do
   	it "La matriz debe contener datos" do
    	  @matriz3.should == @matrizComp
      end
   end

	


end