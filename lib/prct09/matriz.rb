require './lib/prct09/fracciones.rb'

class Matriz
   include Enumerable
   include Comparable
        
   attr_reader :filas, :columnas, :matriz
   
   # Constructor
   def initialize()
   end

   # Convertir el array a matriz Densa o Dispersa.
   # Contamos el numero de ceros que tiene cada array, en el caso
   # de que sea menor de 60% la matriz será Densa, en caso contrario será
   # Dispersa.
   def tipo(m)
     @filas = m.length
     @columnas = m[0].length

     matrizRe = nil
     tamanio = @filas * @columnas

     ceros = 0
   
     for i in 0...@filas
       for j in 0...@columnas
          if (m[i][j] == 0)
             ceros += 1
          end
       end
     end
     
     #porcentaje = (ceros % tamanio)

     if (ceros % tamanio) < 0.6
        matrizRe = MatrizDensa.new(@filas, @columnas)
        matrizRe.hash_matrix(m)
     else
        matrizRe = MatrizDispersa.new(@filas, @columnas)
        matrizRe.hash_matrix(m)
     end

     matrizRe

  end


end

class MatrizDensa < Matriz
  	
	def initialize(filas, columnas)
      @filas, @columnas = filas, columnas
      @matriz = Array.new{Array.new()}
      for i in 0...@filas
         @matriz[i] = Array.new()
      end
   end

   # Si el array pasado a la clase Matriz tiene un numero de ceros menor 
   # que el porcentaje 60% es Densa por lo que entra en la clase
   # MatrizDensa y se crea una matriz con hash_matrix(other).
	def hash_matrix(other)
		@filas = other.length
    	@columnas = other[0].length
  
    	for i in 0...other.length
      	for j in 0...other[i].length
      	   @matriz[i][j] = other[i][j]
      	end
    	end
  	end

	# Convertir a cadenas
	def to_s()
      aux = ""
      for i in 0...@filas
         for j in 0...@columnas
            aux << "#{@matriz[i][j]} "
         end
         aux << "\n"
      end
      aux
   end

	def +(other)
		suma = MatrizDensa.new(@filas, @columnas)
		0.upto(@filas - 1) {|i| 
			0.upto(@columnas - 1) {|j| 
				suma.matriz[i][j] = (@matriz[i][j] + other.matriz[i][j]) 
			}
		}
		suma
	end


	# Resta de matrices
  	def -(other)
   	suma = MatrizDensa.new(@filas, @columnas)
  		for i in 0...@filas
      	for j in 0...@columnas
      		suma.matriz[i][j] = (@matriz[i][j] - other.matriz[i][j])
   	   end
   	end
  		suma
   end
  
   # Comparar dos matrices
   def ==(other)
		raise TypeError, "Solo si es Densa" unless other.is_a?MatrizDensa
      raise RangeError, "Filas iguales" unless @filas == other.filas
	   raise RangeError, "Columnas iguales" unless @columnas == other.columnas

      comp = true
      for i in 0...@filas
         for j in 0...@columnas
            if (@matriz[i][j] != other.matriz[i][j])
               comp = false
            end
         end
      end
     comp
	end

	# Multiplicacion
   def *(other)
      multiplicacion = MatrizDensa.new(@filas, @columnas)
      0.upto(@filas-1) { |i|
      	0.upto(@columnas-1) { |j|
            aux = 0
            0.upto(other.filas-1) { |k| 
					aux += (@matriz[i][k] * other.matriz[k][j]) 
				}
            multiplicacion.matriz[i][j] = aux
         }
    	}
      multiplicacion
	end



   # Metodos para calcular el elemento maximo y minimo de una matriz

   # Fijamos el elemento en la posicion (0,0) como maximo para ir 
   # comparando el resto. En el caso de que los elemento sean mayor que 
   # elemento max en (0,0) se almacena en max y asi sucesivamente.
   def max()
     max = @matriz[0][0]
     for i in 0...@filas
       for j in 0...@columnas
          if (@matriz[i][j] >= max)
             max = @matriz[i][j]
          end
       end
     end
     max
   end


   
   # Fijamos el elemento en la posicion (0,0) como minimo para ir 
   # comparando el resto. Se va almacenando en min el numero minimo de la 
   # matriz.
   def min()
     min = @matriz[0][0]
     for i in 0...@filas
       for j in 0...@columnas
          if (@matriz[i][j] <= min)
             min = @matriz[i][j]
          end
       end
     end
     min
   end 

   # Se podría hacer hallando el determinante de una matriz pero
   # usamos el maximo para comparar con <, >, =.
   def <=>(other)
     max <=> other.max
   end

	# Metodo para poder hacer operaciones con una matriz dispersa y densa
	# Convertir una densa a dispersa
	def DensaADispersa() 
   	mDisp = Matriz_Dispersa.new(@filas, @columnas)
   	mDisp.hash_matrix(@matriz)
      mDisp
   end
   
   def coerce(other) #other.class = Matriz_Dispersa
      [self, other.DispersaADensa]
   end

end

class MatrizDispersa < Matriz
  
   # Constructor
   def initialize(filas, columnas)
     @filas, @columnas = filas, columnas
     @matriz = Hash.new()
   end

   # Si el array pasado a la clase Matriz tiene un numero de ceros mayor que
   # el porcentaje 60% es Dispersa por lo que entra en la clase 
   # MatrizDispersa y se crea un hash con hash_matrix(other), en el que solo se 
   # pondrán los valores distintos de cero.
	def hash_matrix(other)
   	@filas = other.length
   	@columnas = other[0].length
  
    	for i in 0...other.length
      	for j in 0...other[i].length
      		if (other[i][j] != 0)
            	@matriz["#{i},#{j}"] = other[i][j].to_i
         	end
      	end
    	end
  end

	# Convertir a cadena
	def to_s()
   	aux = ""
     	for i in 0...@filas
      	for j in (0...@columnas)                                        
      	   if (@matriz.include?("#{i},#{j}"))
      	      ele = @matriz["#{i},#{j}"]
               aux << "#{ele} "
            else
            	aux << "0 "
         	end                                
        	end
			aux << "\n"
		end
      aux
	end

	# Metodos para poder sumar, multiplicar y restar una matriz dispersa y una densa, o vicervesa
	# Convertir de una matriz Dispersa a Densa, es decir, convertir a matriz
	
   def DispersaDensa() 
   	mDensa = MatrizDensa.new(@filas, @columnas)
      m = Array.new()
      for i in 0...@filas
   		aux = Array.new()
         for j in 0...@columnas
            if (@matriz.include?("#{i},#{j}"))
               aux << @matriz["#{i},#{j}"]
            else
               aux << 0
            end 
         end 
         m << aux
      end 
      mDensa.hash_matrix(m)
      mDensa
   end
   
   def coerce(other) 
      [self, other.DensaDispersa]
   end

   ################################ OPERACIONES ##################################3
   
   def +(other)
    	sum = MatrizDispersa.new(@filas, @columnas)
   	0.upto(@filas-1) { |i|
      	0.upto(@columnas-1) { |j|
      		valueA = 0
            if (@matriz.include?("#{i},#{j}"))
         	   valueA = @matriz["#{i},#{j}"]
            end
            valueB = 0
            if (other.matriz.include?("#{i},#{j}"))
               valueB = other.matriz["#{i},#{j}"]
            end
            sum.matriz["#{i},#{j}"] = (valueA + valueB)
         }
		}
      sum
	end

	# Resta de dos matrices Dispersas
	def -(other)
   	restDisp = MatrizDispersa.new(@filas, @columnas)
      for i in 0...@filas
      	for j in 0...@columnas
            ele1 = 0
            if (@matriz.include?("#{i},#{j}"))
               ele1 = @matriz["#{i},#{j}"]
            end
            ele2 = 0
				if (other.matriz.include?("#{i},#{j}"))
               ele2 = other.matriz["#{i},#{j}"]
            end
            restDisp.matriz["#{i},#{j}"] = (ele1 - ele2)
         end                        
      end
		restDisp
   end

	def *(other)
      mult = MatrizDispersa.new(@filas, @columnas)
      0.upto(@filas-1) { |i|
         0.upto(@columnas-1) { |j|
            aux = 0
            0.upto(other.filas-1) { |k|
                valueA, valueB = 0, 0
                if (@matriz.include?("#{i},#{j}")) and (other.matriz.include?("#{i},#{j}"))
                   aux += (@matriz["#{i},#{j}"] * other.matriz["#{i},#{j}"])
                 else
                    aux += 0
                 end        
             }
             mult.matriz["#{i},#{j}"] = aux
			}
      }
      mult                           
   end

   # Comparar dos matrices Dispersas
	def ==(other)
	   raise TypeError, "Solo se pueden comparar matrices" unless other.is_a?MatrizDispersa
      raise RangeError, "Las filas deben ser iguales" unless @filas == other.filas
	   raise RangeError, "Las columnas deben ser iguales" unless @columnas == other.columnas
      comp = true
      if (@matriz != other.matriz)
         iguales = false
      end
		comp
   end

   # Maximo elemento de una matriz
	def max()
 		if (@matriz.include?("0,0")) #max = al primer elemento del hash
      	max = @matriz["0,0"]
     	else
      	max = 0
     	end
  
     	for i in (0...@filas)
      	for j in (0...@columnas)
         	if ((@matriz.include?("#{i},#{j}")) && (@matriz["#{i},#{j}"] >= max))
         		max = @matriz["#{i},#{j}"]
           	end #if
        	end #for j
     	end #for i
     	max
	end

	# Minimo elemento de una matriz
   def min()
   	if (@matriz.include?("0,0")) #min = al primer elemento del hash
      	min = @matriz["0,0"]
      else
         min = 0
      end
    
      for i in (0...@filas)
         for j in (0...@columnas)
            if (@matriz.include?("#{i},#{j}"))
               if (@matriz["#{i},#{j}"] <= min)
                  min = @matriz["#{i},#{j}"]
               end
            else #Si el minimo no tiene en cuenta el 0 quitar el else
               min = 0
         	end #if
      	end #for j
      end #for i
   	min
	end

	# Metodo <=>
	def <=>(other)
      max <=> other.max
   end


 
  
end
