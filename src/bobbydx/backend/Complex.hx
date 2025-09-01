package bobbydx.backend;

@:notNull @:pure
class Complex {
    public final real:Float;
    public final imag:Float;

    public function new(real:Float, imag:Float) {
        this.real = real;
        this.imag = imag;
    }

    public static function fromReal(r:Float):Complex
        return new Complex(r, 0);

    public var angle(get, never):Float;
    function get_angle():Float
        return Math.atan2(this.imag, this.real);

    public var magnitude(get, never):Float;
    function get_magnitude():Float
        return Math.sqrt(this.real * this.real + this.imag * this.imag);

    public function add(rhs:Complex):Complex
        return new Complex(this.real + rhs.real, this.imag + rhs.imag);

    public function sub(rhs:Complex):Complex
        return new Complex(this.real - rhs.real, this.imag - rhs.imag);

    public function mult(rhs:Complex):Complex
        return new Complex(this.real * rhs.real - this.imag * rhs.imag,
                           this.real * rhs.imag + this.imag * rhs.real);

    public function div(rhs:Complex):Complex
        return new Complex(
            (this.real * rhs.real + this.imag * rhs.imag) / (rhs.real * rhs.real + rhs.imag * rhs.imag),
            (this.imag * rhs.real - this.real * rhs.imag) / (rhs.real * rhs.real + rhs.imag * rhs.imag)
        );

    public function conj():Complex
        return new Complex(this.real, -this.imag);

    public function scale(k:Float):Complex
        return new Complex(this.real * k, this.imag * k);

    public function copy():Complex
        return new Complex(this.real, this.imag);

    public static function cis(w:Float):Complex
        return new Complex(Math.cos(w), Math.sin(w));

    public static function polar(r:Float, theta:Float):Complex
        return new Complex(r * Math.cos(theta), r * Math.sin(theta));

    public function pow(exp:Float):Complex
        return Complex.polar(Math.pow(magnitude, exp), angle * exp);

    public function powC(exp:Complex):Complex {
        var logz = new Complex(Math.log(magnitude), angle);
        var wlogz = exp.mult(logz);
        return wlogz.exp();
    }

    public function exp():Complex {
        var e = Math.exp(this.real);
        return new Complex(e * Math.cos(this.imag), e * Math.sin(this.imag));
    }
}
