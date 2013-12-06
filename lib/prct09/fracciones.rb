require "./lib/prct09/gcd.rb"
class Fraccion
include Comparable
attr_reader :numerador, :denominador
   def initialize(numerador, denominador)
     @numerador, @denominador = numerador, denominador
   end
   def reduccion()
      mcd = gcd(@numerador, @denominador)
      f2 = Fraccion.new(@numerador/mcd, @denominador/mcd)
      f2
   end

    def to_s
     "#{@numerador}/#{@denominador}"
   end

   def to_f
     (@numerador/@denominador.to_f)
   end

      def ==(other)
      num = reduccion
      num1 = other.reduccion
      if ((num.numerador == other.numerador) && (num.denominador == other.denominador))
          true
      else
          false
      end
   end

    def abs
     numerador1 = @numerador.abs
     denominador1 = @denominador.abs
     f = Fraccion.new(numerador1, denominador1)
     f
   end

   def reciprocal
     f = Fraccion.new(@denominador, @numerador)
     f
   end

   def -@
     f = Fraccion.new(-@numerador, @denominador)
     f
   end
   
   def +(other)
    den = @denominador * other.denominador
    num = ((den/@denominador)*@numerador) + ((den/other.denominador)*other.numerador)
    gcd = gcd(num, den)
    sum = Fraccion.new(num/gcd, den/gcd)
    sum
   end
   def -(other)
    den = @denominador * other.denominador
    num = ((den/@denominador)*@numerador) - ((den/other.denominador)*other.numerador)
    gcd = gcd(num, den)
    sum = Fraccion.new(num/gcd, den/gcd)
    sum

   end
   def *(other)
    num = @numerador * other.numerador
    den = @denominador * other.denominador
    gcd = gcd(num, den)
    sum = Fraccion.new(num/gcd, den/gcd)
    sum

   end
   def div(other)
    num = @numerador * other.denominador
    den = @denominador * other.numerador
    gcd = gcd(num, den)
    sum = Fraccion.new(num/gcd, den/gcd)
    sum
   end
   def %(other)
    to_f % other.to_f
    
   end
   
   
   def<=>(other)
    (self.numerador.to_f / self.denominador.to_f) <=> (other.numerador.to_f / other.denominador.to_f)
   end
  

end
