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
        matrizRe.copia(m)
     else
        matrizRe = MatrizDispersa.new(@filas, @columnas)
        matrizRe.copia(m)
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

  # Si el array pasado a la clase Matriz tiene un numero de ceros menor que
  # el porcentaje 60% es Densa por lo que entra en la clase MatrizDensa y 
  # se crea una matriz con copia(other).
  def copia(other)
    @filas = other.length
    @columnas = other[0].length
  
    for i in 0...other.length
      for j in 0...other[i].length
         @matriz[i][j] = other[i][j]
      end
    end
  end

  # Suma de matrices
  def +(other)
    suma = MatrizDensa.new(@filas, @columnas)
    for i in 0...@filas
       for j in 0...@columnas
          suma.matriz[i][j] = (@matriz[i][j] + other.matriz[i][j])
       end
     end
     suma
   end
  
   # Comparar dos matrices
   def ==(other)
     iguales = true
     for i in 0...@filas
       for j in 0...@columnas
         if (@matriz[i][j] != other.matriz[i][j])
            iguales = false
         end
       end
     end
     iguales
    end

   # Multiplicacion de dos matrices
   def *(other)
     multiplicacion = MatrizDensa.new(@filas, @columnas)
     for i in 0...@filas
       for j in 0...@columnas
          aux = 0
          for k in 0...other.filas
            aux += (@matriz[i][k] * other.matriz[k][j]) 
          end
          multiplicacion.matriz[i][j] = aux
       end
     end
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
end

class MatrizDispersa < Matriz
  def initialize(filas, columnas)
    @filas, @columnas = filas, columnas
    @matriz = Hash.new()
  end

  # Si el array pasado a la clase Matriz tiene un numero de ceros mayor que
  # el porcentaje 60% es Dispersa por lo que entra en la clase 
  # MatrizDispersa y se crea un hash con copia(other), en el que solo se 
  # pondrán los valores distintos de cero.
  def copia(other)
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

	  def to_s()
                cad = ""
                for i in (0...@filas)
                        for j in (0...@columnas)                                        
                                if (@matriz.include?("#{i},#{j}"))
                                        value = @matriz["#{i},#{j}"]
                                        cad << "#{value} "
                                else
                                        cad << "0 "
                                end                                
                        end
                        cad << "\n"
                end
                cad
        end

    def +(other)
                sum = MatrizDispersa.new(@filas, @columnas)

                for i in (0...@filas)
                        for j in (0...@columnas)
                                valueA = 0
                                if (@matriz.include?("#{i},#{j}"))
                                        valueA = @matriz["#{i},#{j}"]
                                end
                                
                                valueB = 0
                                if (other.matriz.include?("#{i},#{j}"))
                                        valueB = other.matriz["#{i},#{j}"]
                                end
                                
                                sum.matriz["#{i},#{j}"] = (valueA + valueB)
                        end                        
                end

                sum
        end
        #-------------------------------------------------------------------
        def *(other)
                mult = MatrizDispersa.new(@filas, @columnas)        
                
                for i in 0...@filas
                        for j in 0...other.columnas                        
                        	aux = 0
                           for k in (0...other.filas)
                                
                                        valueA, valueB = 0, 0
                                        if (@matriz.include?("#{i},#{j}")) and (other.matriz.include?("#{i},#{j}"))
                                                aux += (@matriz["#{i},#{j}"] * other.matriz["#{i},#{j}"])
                                        else
                                                aux += 0
                                        end                
                                        
                                end #for
                                mult.matriz["#{i},#{j}"] = aux
                        
                        end #for j

                end #for i
                
                mult
        end 

       def ==(other)
                raise TypeError, "Solo se pueden comparar matrices" unless other.is_a?MatrizDispersa
                raise RangeError, "Las filas deben ser iguales" unless @filas == other.filas
                raise RangeError, "Las columnas deben ser iguales" unless @columnas == other.columnas
                iguales = true

                if (@matriz != other.matriz)
                        iguales = false
                end

                iguales
        end


  
end
