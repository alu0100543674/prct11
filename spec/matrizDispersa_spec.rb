require "./lib/prct09/matriz.rb"

describe MatrizDispersa do
	before :each do
		# Creamos una matriz llamada matrizSuper de tipo Matriz.
      matrizSuper = Matriz.new();
      
      # MATRICES ENTERAS
      # Dispersas
      @matriz3 = matrizSuper.tipo([[1, 0], [0, 0]])
      @matriz4 = matrizSuper.tipo([[2, 0], [0, 0]])
      

      # Resultados
      @sumDispersa = matrizSuper.tipo([[3, 0], [0, 0]])
      
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

   describe "# Dispersa: Suma" do
   	it " Suma" do 
      	sum = @matriz3 + @matriz4
         sum.should == @sumDispersa
      end
   end
end
