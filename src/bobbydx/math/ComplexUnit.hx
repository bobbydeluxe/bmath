package bobbydx.math;

import bobbydx.math.BMath;

/**
 * Represents a complex number using an abstract structure over `{ real, imag }`.
 * Based on original code by ninjamuffin99 (from `funkin.vis`), modified and extended by BobbyDX (me lol).
 *
 * Supports:
 * - Operator overloading for +, -, *, /
 * - Angle, magnitude, conjugate
 * - Polar form, exponential, rotation, normalization
 * - Utility methods like `copy`, `scale`, `pow`
 *
 * @author ninjamuffin99
 * @author BobbyDX
 * @version 1.0.0
 * @license MIT
 */
@:forward(real, imag)
@:notNull
@:pure
abstract ComplexUnit({
	final real: Float;
	final imag: Float;
}) {
	// --- Constructor ---

	public inline function new(real:Float, imag:Float)
		this = { real: real, imag: imag };

	/**
	 * Constructs a complex number from a real float.
	 * Imaginary part defaults to 0.
	 */
	@:from
	public static inline function fromReal(r:Float):ComplexUnit
		return new ComplexUnit(r, 0);

	// --- Properties ---

	/**
	 * Returns the argument (angle in radians) of the complex number.
	 */
	public var angle(get, never):Float;
	inline function get_angle():Float
		return Math.atan2(this.imag, this.real);

	/**
	 * Returns the magnitude (modulus) of the complex number.
	 */
	public var magnitude(get, never):Float;
	inline function get_magnitude():Float
		return Math.sqrt(this.real * this.real + this.imag * this.imag);

	// --- Arithmetic Operators ---

	/**
	 * Adds two complex numbers.
	 */
	@:op(A + B)
	public inline function add(rhs:ComplexUnit):ComplexUnit
		return new ComplexUnit(this.real + rhs.real, this.imag + rhs.imag);

	/**
	 * Subtracts one complex number from another.
	 */
	@:op(A - B)
	public inline function sub(rhs:ComplexUnit):ComplexUnit
		return new ComplexUnit(this.real - rhs.real, this.imag - rhs.imag);

	/**
	 * Multiplies two complex numbers.
	 */
	@:op(A * B)
	public inline function mult(rhs:Complex):Complex
		return new Complex(
			this.real * rhs.real - this.imag * rhs.imag,
			this.real * rhs.imag + this.imag * rhs.real
		);

	/**
	 * Divides one complex number by another.
	 */
	@:op(A / B)
	public inline function div(rhs:ComplexUnit):ComplexUnit {
		final denom = rhs.real * rhs.real + rhs.imag * rhs.imag;
		return new ComplexUnit(
			(this.real * rhs.real + this.imag * rhs.imag) / denom,
			(this.imag * rhs.real - this.real * rhs.imag) / denom
		);
	}

	// --- Utility Methods ---

	/**
	 * Returns the complex conjugate.
	 */
	public inline function conj():ComplexUnit
		return new ComplexUnit(this.real, -this.imag);

	/**
	 * Multiplies the complex number by a scalar (real).
	 */
	public inline function scale(k:Float):ComplexUnit
		return new ComplexUnit(this.real * k, this.imag * k);

	/**
	 * Returns a copy of the complex number.
	 */
	public inline function copy():ComplexUnit
		return new ComplexUnit(this.real, this.imag);

	/**
	 * Returns the normalized unit complex (magnitude = 1).
	 * Returns zero if magnitude is zero.
	 */
	public inline function normalize():ComplexUnit {
		final m = this.magnitude;
		return m == 0 ? ComplexUnit.zero : this.scale(1 / m);
	}

	/**
	 * Raises this complex number to an integer power (De Moivre’s Theorem).
	 */
	public inline function pow(n:Int):ComplexUnit {
		final r = Math.pow(this.magnitude, n);
		final theta = this.angle * n;
		return ComplexUnit.fromPolar(r, theta);
	}

	/**
	 * Rotates this complex number by the given angle in radians.
	 */
	public inline function rotate(theta:Float):ComplexUnit
		return this * ComplexUnit.exp(theta);

	// --- Static Factory Methods ---

	/**
	 * Constructs a complex number from polar coordinates.
	 * @param r Magnitude (radius)
	 * @param theta Angle in radians
	 */
	public static inline function fromPolar(r:Float, theta:Float):ComplexUnit
		return new ComplexUnit(r * Math.cos(theta), r * Math.sin(theta));

	/**
	 * Computes the complex exponential: e^(i·w) = cos(w) + i·sin(w)
	 */
	public static inline function exp(w:Float):ComplexUnit
		return new ComplexUnit(Math.cos(w), Math.sin(w));

	/**
	 * Returns the complex number as a string.
	 */
	public static inline function toString(num:ComplexUnit):String {
		var imaginarySign = (num.imag < 0) ? '' : '+';
		return '${num.real}${imaginarySign}${num.imag}i'
	}
	
	/**
	 * Checks if this complex number is approximately equal to another,
	 * within a given tolerance (default: BMath.EPSILON).
	 * Compares both real and imaginary parts using BMath.approxEQ.
	 */
	@:op(A == B)
	public inline function equals(other:ComplexUnit, tolerance:Float = 1e-10):Bool {
    	return BMath.approxEQ(this.real, other.real, tolerance) && BMath.approxEQ(this.imag, other.imag, tolerance);
	}
}
