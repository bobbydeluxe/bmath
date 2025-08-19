package bobbydx;

import bobbydx.backend.Complex;

/**
 * A collection of consistent and modern mathematical utilities to fix or replace
 * Haxe's inconsistent-ish built-in Math behavior. Includes functions for trigonometry,
 * exponentiation, interpolation, number theory, and more.
 *
 * Example usage:
 * ```haxe
 * var angleDeg = 30;
 * var angleRad = MathUtil.degToRad(angleDeg);
 * trace("sin(" + angleDeg + "°) = " + MathUtil.sin(angleRad)); // ~0.5
 * ```
 *
 * @author BobbyDX
 * @version 1.2.0
 * @license MIT
 */
@:final
class MathUtil
{
    // --- CONSTANTS ---
    // Common mathematical constants.
    public static final PI = Math.PI; // 3.14159...
    public static final E = Math.exp(1); // Euler's number
    public static final PHI = (1 + Math.sqrt(5)) / 2; // Golden ratio
    public static final GAMMA = 0.57721566490153286060; // Euler–Mascheroni constant
    public static final EPSILON = 1e-10; // For floating-point tolerance comparisons
    public static final NaN = Math.NaN;
    public static final POSITIVE_INFINITY = Math.POSITIVE_INFINITY;
    public static final NEGATIVE_INFINITY = Math.NEGATIVE_INFINITY;

    public static final CMPLX_ZERO = new Complex(0, 0); // Represents the real number 0 in complex form.
    public static final CMPLX_ONE = new Complex(1, 0); // Represents the real number 1 in complex form.
    public static final CMPLX_I = new Complex(0, 1); // Represents the imaginary unit i, the complex square root of -1.
    public static final CMPLX_INF = new Complex(POSITIVE_INFINITY, POSITIVE_INFINITY); // Represents infinity in complex form.

    // --- DEG <-> RAD ---
    // Convert between degrees and radians.
    public static inline function degToRad(degrees:Float):Float return degrees * (PI / 180);
    public static inline function radToDeg(radians:Float):Float return radians * (180 / PI);

    // --- TRIGONOMETRY ---
    // Standard trigonometric functions (input in radians).
    public static inline function sin(angle:Float):Float return Math.sin(angle);
    public static inline function cos(angle:Float):Float return Math.cos(angle);
    public static inline function tan(angle:Float):Float return Math.tan(angle);

    /**
     * Evaluate trigonometric and inverse functions by name.
     * Includes extended types like sec, csc, cot and their inverses.
     * @throws if input is invalid or would result in division by zero.
     */
    public static inline function trig(type:String, angle:Float):Float {
        switch (type.toLowerCase()) {
            case "sin": return Math.sin(angle);
            case "cos": return Math.cos(angle);
            case "tan": return Math.tan(angle);
            case "csc":
                var s = Math.sin(angle);
                if (approxEQ(s, 0)) throw "csc undefined at sin(angle) = 0";
                return 1 / s;
            case "sec":
                var c = Math.cos(angle);
                if (approxEQ(c, 0)) throw "sec undefined at cos(angle) = 0";
                return 1 / c;
            case "cot":
                var t = Math.tan(angle);
                if (approxEQ(t, 0)) throw "cot undefined at tan(angle) = 0";
                return 1 / t;
            case "asin": return Math.asin(angle);
            case "acos": return Math.acos(angle);
            case "atan": return Math.atan(angle);
            case "acsc": return Math.asin(1 / angle);
            case "asec": return Math.acos(1 / angle);
            case "acot": return Math.atan(1 / angle);
            default: throw "Invalid trig function type: " + type;
        }
    }

    // --- EXPONENTS & LOGS ---
    // Core exponentiation and logarithm functions.
    public static inline function pow(base:Float, exp:Float):Float return Math.pow(base, exp);
    public static inline function log(value:Float, base:Float = 10):Float return Math.log(value) / Math.log(base);


    // --- BASIC FUNCTIONS ---
    public static inline function abs(value:Float):Float return Math.abs(value);
    public static inline function max(a:Float, b:Float):Float return Math.max(a, b);
    public static inline function min(a:Float, b:Float):Float return Math.min(a, b);
    public static inline function floor(value:Float):Float return Math.floor(value);
    public static inline function ceil(value:Float):Float return Math.ceil(value);
    public static inline function round(value:Float):Int return Math.round(value);

    /**
     * Compare two floats for near-equality within a given tolerance.
     */
    public static inline function approxEQ(a:Float, b:Float, tolerance:Float = 1e-10):Bool {
        return Math.abs(a - b) <= tolerance;
    }

    /**
     * Return the sign of a number: -1 for negative, 1 for positive, 0 for zero.
     */
    public static inline function sign(value:Float):Int {
        return value > 0 ? 1 : value < 0 ? -1 : 0;
    }

    // --- RANGE & INTERPOLATION ---

    /**
     * Clamp a value between min and max.
     */
    public static inline function clamp(value:Float, min:Float, max:Float):Float {
        return Math.max(min, Math.min(max, value));
    }

    /**
     * Clamp a value between 0 and 1.
     */
    public static inline function clamp01(value:Float):Float return clamp(value, 0, 1);

    /**
     * Map a value from one range to another.
     */
    public static inline function map(value:Float, fromMin:Float, fromMax:Float, toMin:Float, toMax:Float):Float {
        return toMin + (value - fromMin) * (toMax - toMin) / (fromMax - fromMin);
    }

    /**
     * Linear interpolation between two values.
     * @param t should be between 0 and 1.
     */
    public static inline function lerp(start:Float, end:Float, t:Float):Float {
        return start + (end - start) * t;
    }

    /**
     * Wrap a value within a range [min, max). Handles negative input safely.
     */
    public static inline function wrap(value:Float, min:Float, max:Float):Float {
        var range = max - min;
        return ((value - min) % range + range) % range + min;
    }

    /**
     * Check if value is NaN.
     */
    public static inline function isNaN(value:Float):Bool {
        return Math.isNaN(value);
    }

    // --- FACTORIALS & RANDOM ---

    /**
     * Compute factorial of an integer (n!).
     */
    public static inline function factorial(n:Int):Int {
        if (n < 0)
		    throw 'Factorial is undefined for negative integers: $n';
        
        var result = 1;
        for (i in 2...n + 1) result *= i;
        return result;
    }

    /**
     * Generate a random float between min and max.
     */
    public static inline function random(min:Float = 0, max:Float = 1):Float {
        return min + Math.random() * (max - min);
    }

    /**
     * Mathematical modulo that works with floats.
     */
    public static inline function mod(a:Float, b:Float):Float {
        return a - Math.floor(a / b) * b;
    }

    // --- GCD / LCM ---

    /**
     * Compute the greatest common divisor using Euclidean algorithm.
     */
    public static inline function gcd(a:Int, b:Int):Float {
        while (b != 0) {
            var temp = b;
            b = a % b;
            a = temp;
        }
        return Math.abs(a);
    }

    /**
     * Compute the least common multiple.
     */
    public static inline function lcm(a:Int, b:Int):Float {
        if (a == 0 || b == 0) return 0;
        return Math.abs(a * b) / gcd(a, b);
    }

    // --- SCIENTIFIC NOTATION ---

    /**
     * Converts a number to an array representing the scientific notation.
     * Example: 1234567 -> [1.234567, 6]
     */
    public static inline function toScientificNotation(value:Float):Array<Float> {
        if (value == 0) return [0, 0];
        var exponent = Math.floor(log(Math.abs(value), 10));
        var mantissa = value / pow(10, exponent);
        return [mantissa, exponent];
    }

    /**
     * Converts a number from scientific notation back to a float.
     * Example: [1.234567, 6] -> 1234567
     */
    public static inline function fromScientificNotation(sci:Array<Float>):Float {
        return sci[0] * pow(10, sci[1]);
    }

    /**
     * Checks if the array is valid scientific notation.
     * To return true instead of false, the absolute value of the first element must be between 1 (inclusive) and 10 (exclusive).
     * Also the second element must be an integer.
     * Example: [5, 5] -> true, [0.5, 6] -> false
     */
    public static inline function isValidScientificNotation(sci:Array<Float>):Bool {
        return sci.length == 2 && abs(sci[0]) >= 1 && abs(sci[0]) < 10 && sci[1] == Math.floor(sci[1]);
    }

    // --- MISC ---

    /*
     * Remaps sum shit. Kinda like the game builder garage map nodon.
     */
    public static inline function remap(value:Float, fromMin:Float, fromMax:Float, toMin:Float, toMax:Float):Float {
        return toMin + (value - fromMin) * (toMax - toMin) / (fromMax - fromMin);
    }

    /*
     * Converts type Int to type Float. We have `Std.int` so why not have the inverse?
     */
    public static inline function intToFloat(value:Int):Float {
        return value;
    }

    /*
     * The F.O.I.L. method (First, Outside, Inside, Last)
     * A technique for multiplying two binomials, represented as arrays.
     */
    public static inline function foil(a:Array<Float>, b:Array<Float>):Array<Float> {
        if (a.length != 2 || b.length != 2) throw 'Invalid binomial representation';
        return [
            a[0] * b[0], // First
            a[0] * b[1] + a[1] * b[0], // Outside + Inside
            a[1] * b[1] // Last
        ];
    }
}