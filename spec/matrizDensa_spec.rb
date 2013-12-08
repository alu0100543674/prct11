require "./lib/prct09/matriz.rb"

describe MatrizDensa do
	before :each do
		# Creamos una matriz llamada matrizSuper de tipo Matriz.
      matrizSuper = Matriz.new();
      
      # MATRICES ENTERAS
      # Densas
      @matriz1 = matrizSuper.tipo([[1, 2], [3, 4]])
      @matriz2 = matrizSuper.tipo([[2, 3], [4, 5]])
      @matrizComp = matrizSuper.tipo([[1, 2], [3, 4]])

     

      # Resultados
      @sumDensa = matrizSuper.tipo([[3, 5], [7, 9]])
      @mulDensa = matrizSuper.tipo([[10, 13], [22, 29]])
      
      
   end

   
	describe "# Densa: filas y columnas de una matriz" do
	   it " Numero de filas " do
	      @matriz1.filas.should eq(2)
      end
      it " Numero de columnas " do
         @matriz1.columnas.should eq(2)
      end
	end

   describe "# Densa: comparar " do
   	it " Si son iguales " do
      	@matriz1.should == @matrizComp
      end
   end

   describe "# Densa: suma " do
   	it " Dos matrices densas " do
   	   sum = @matriz1 + @matriz2
         sum.should == @sumDensa
      end
   end

   describe "# Densa: maximo y minimo elemento" do
   	it "Maximo" do
   	   @matriz1.max.should eq(4)
      end
      it "Minimo" do
         @matriz1.min.should eq(1)
      end
   end

   describe "# Densa: multiplicacion " do
   	it " Dos matrices densas " do
      	mult = @matriz1 * @matriz2
         mult.should == @mulDensa
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
