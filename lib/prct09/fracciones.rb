require "./lib/prct09/gcd.rb"
class Fraccion
  
  include Comparable
  attr_reader :num, :den
  
  def initialize (num, den)
    @num, @den = num, den
  end
  
  def reduccion
    divisor = gcd(@num, @den)
    fracc2 = Fraccion.new(@num/divisor, @den/divisor)
    fracc2
  end
  
  def to_s #mostrar por pantalla
    if (@den == 1)
      "#{@num}"
    else
      "#{@num}/#{@den}"
    end
  end
  
  def to_f #convertir a float
    (@num/@den.to_f)
  end
  
  #def ==(other)
    #f1 = reduccion
    #f2 = other.reduccion
    #if ((f1.num == other.num) && (f1.den == other.den))
      #true
    #else
      #false
    #end
  #end
  
  def abs #valor absoluto
    n = @num.abs
    d = @den.abs
    fracc = Fraccion.new(n, d)
    fracc
  end
  
  def reciprocal #reciproco
    fracc2 = Fraccion.new(@den, @num)
    fracc2
  end
  
  def -@ #opuesto
    fracc2 = Fraccion.new(-@num, @den)
    fracc2
  end
  
  def -(other) #diferencia
    den = @den * other.den
    num = ((den/@den)*@num) - ((den/other.den)*other.num)
    mcd = gcd(num, den)
    res = Fraccion.new(num/mcd, den/mcd)
    res
  end
  
  def +(other) #suma
    den = @den * other.den
    num = ((den/@den)*@num) + ((den/other.den)*other.num)
    mcd = gcd(num, den)
    sum = Fraccion.new(num/mcd, den/mcd)
    sum
  end
    
  def *(other) #producto
    num = @num * other.num
    den = @den * other.den
    mcd = gcd(num, den)
    mult = Fraccion.new(num/mcd, den/mcd)
    mult
  end

  def /(other) #division
    num = @num * other.den
    den = @den * other.num
    mcd = gcd(num, den)
    div = Fraccion.new(num/mcd, den/mcd)
  end
  
  def %(other) #resto
    f2 = Fraccion.new(0, 1)
    f2
  end
  
  def <=>(other) #module Comparable
    raise TypeError "other no es del tipo Fraccion" unless other.instance_of? Fraccion
    
    (@num/@den) <=> (other.num/other.den)
  end
  
  def coerce(other)
         [self, Fraccion.new(other, 1)]
  end
  
end
