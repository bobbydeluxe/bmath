package bobbydx.backend;

@:forward(real, imag) @:notNull @:pure
abstract Complex({
    final real:Float;
    final imag:Float;
}) {
    public inline function new(real:Float, imag:Float)
        this = { real: real, imag: imag };

    @:from
    public static inline function fromReal(r:Float)
        return new Complex(r, 0);

    public var angle(get,never):Float;
    inline function get_angle()
        return Math.atan2(this.imag, this.real);

    public var magnitude(get,never):Float;
    inline function get_magnitude()
        return Math.sqrt(this.real*this.real + this.imag*this.imag);

    @:op(A + B)
    public inline function add(rhs:Complex):Complex
        return new Complex(this.real + rhs.real, this.imag + rhs.imag);

    @:op(A - B)
    public inline function sub(rhs:Complex):Complex
        return new Complex(this.real - rhs.real, this.imag - rhs.imag);

    @:op(A * B)
    public inline function mult(rhs:Complex):Complex
        return new Complex(this.real*rhs.real - this.imag*rhs.imag,
                           this.real*rhs.imag + this.imag*rhs.real);

    @:op(A / B)
    public inline function div(rhs:Complex):Complex
        return new Complex(
            (this.real * rhs.real + this.imag * rhs.imag) / (rhs.real * rhs.real + rhs.imag * rhs.imag),
            (this.imag * rhs.real - this.real * rhs.imag) / (rhs.real * rhs.real + rhs.imag * rhs.imag)
        );

    public inline function conj():Complex
        return new Complex(this.real, -this.imag);

    public inline function scale(k:Float):Complex
        return new Complex(this.real * k, this.imag * k);

    public inline function copy():Complex
        return new Complex(this.real, this.imag);

    public static inline function cis(w:Float):Complex
        return new Complex(Math.cos(w), Math.sin(w));

    public static inline function polar(r:Float, theta:Float):Complex
        return new Complex(r * Math.cos(theta), r * Math.sin(theta));

    public inline function pow(exp:Float):Complex
        return Complex.polar(Math.pow(magnitude, exp), angle * exp);

    public inline function powC(exp:Complex):Complex {
        var logz = new Complex(Math.log(magnitude), angle);
        var wlogz = exp * logz;
        return wlogz.exp();
    }

    public inline function exp():Complex {
        var e = Math.exp(this.real);
        return new Complex(e * Math.cos(this.imag), e * Math.sin(this.imag));
    }
}
