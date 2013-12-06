require "./lib/prct09/matriz.rb"

describe Matriz do
   before :each do
      # Creamos una matriz llamada matrizSuper de tipo Matriz.
      matrizSuper = Matriz.new();
      
      # Matrices enteras
      @matriz1 = matrizSuper.tipo([[1, 2], [3, 4]])
      @matriz2 = matrizSuper.tipo([[2, 3], [4, 5]])
      @matriz3 = matrizSuper.tipo([[1, 1], [1, 1]])
     

      
      
   end

   describe "# Matriz Densa " do
     it " Numero de filas " do
        @matriz1.filas.should eq(2)
     end
     it " Numero de columnas " do
        @matriz1.columnas.should eq(2)
     end
   end

   describe "# Suma " do
     it " Dos matrices densas " do
       
     end
     it " Dos matrices dispersas " do
     end
     it " Una matriz densa y una matriz dispersa " do
     end
   end

end
