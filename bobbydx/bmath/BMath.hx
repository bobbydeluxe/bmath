package bobbydx.bmath;

import Math;

/**
 * BMath.hx
 *
 * This file is part of the BMath library, which provides a rewritten collection of mathematical functions and constants.
 *
 * @author BobbyDX
 * @version 0.1.0
 * @license MIT License
 */

class BMath {

    /*
     * CONSTANTS
     */

    // Pi (π), the ratio of the circumference of a circle to its diameter
    public static var PI = Math.PI;

    // Euler's Number (e), the base of the natural logarithm
    public static var E = Math.exp(1);

    // Phi (φ), the golden ratio, used in various aspects of art, architecture, and nature
    public static var PHI = (1 + Math.sqrt(5)) / 2;

    // The Euler-Mascheroni constant (γ), the limiting difference between the harmonic series and the natural logarithm
    public static var GAMMA = 0.57721566490153286060;

    // Epsilon (ε), the smallest positive number such that 1 + ε != 1 in floating-point arithmetic
    public static var EPSILON = 1e-10;

    // NaN (Not a Number), a special value representing an undefined or unrepresentable value in floating-point calculations
    public static var NaN = Math.NaN;

    // Positive Infinity (∞), a special value representing an infinitely large number
    public static var POSITIVE_INFINITY = Math.POSITIVE_INFINITY;

    // Negative Infinity (-∞), a special value representing an infinitely small number
    public static var NEGATIVE_INFINITY = Math.NEGATIVE_INFINITY;

    /*
     * FUNCTIONS
     */

    // DEGREES AND RADIANS

    // Converts degrees to radians
    public static function degToRad(degrees:Float):Float {
        return degrees * (PI / 180);
    }

    // Converts radians to degrees
    public static function radToDeg(radians:Float):Float {
        return radians * (180 / PI);
    }

    // TRIGONOMETRIC FUNCTIONS

    // Returns the sine of an angle in radians
    public static function sin(angle:Float):Float {
        return Math.sin(angle);
    }

    // Returns the cosine of an angle in radians
    public static function cos(angle:Float):Float {
        return Math.cos(angle);
    }

    // Returns the tangent of an angle in radians
    public static function tan(angle:Float):Float {
        return Math.tan(angle);
    }

    // A compilation of trigonometric functions, including sines, tangents, secants, and their co-functions and inverses
    public static function trig(type:String, angle:Float):Float {
        switch (type.toLowerCase()) {
            // base
            case "sin": return Math.sin(angle); // sine
            case "cos": return Math.cos(angle); // cosine
            case "tan": return Math.tan(angle); // tangent
            
            // reciprocals
            case "csc": return 1 / Math.sin(angle); // cosecant
            case "sec": return 1 / Math.cos(angle); // secant
            case "cot": return 1 / Math.tan(angle); // cotangent

            // arcs
            case "asin": return Math.asin(angle); // arcsine
            case "acos": return Math.acos(angle); // arccosine
            case "atan": return Math.atan(angle); // arctangent

            // reciprocal arcs
            case "acsc": return Math.asin(1 / angle); // arccosecant
            case "asec": return Math.acos(1 / angle); // arcsecant
            case "acot": return Math.atan(1 / angle); // arccotangent

            default: throw "Bro. Invalid trigonometric function type: " + type;
        }
    }

    // EXPONENTS AND LOGARITHMS

    // Returns a number raised to a specified power
    // If you want more radicals, use the reciprocal of the index as your exponent
    public static function pow(base:Float, exp:Float):Float {
        return Math.pow(base, exp);
    }

    // Returns the square root of a number
    public static function sqrt(value:Float):Float {
        return pow(value, 0.5);
    }

    // Returns the cube root of a number
    public static function cbrt(value:Float):Float {
        return pow(value, 1/3);
    }

    // Returns the logarithm of a number to a specified base
    public static function log(value:Float, base:Float):Float {
        return Math.log(value) / Math.log(base);
        // works for any base, not just e, and its thanks to the change of base formula
    }

    // Returns the natural logarithm (base e) of a number
    public static function ln(value:Float):Float {
        return log(value, E);
    }

    // MISC FUNCTIONS

    // Returns the absolute value of a number
    public static function abs(value:Float):Float {
        return Math.abs(value);
    }

    // Returns the maximum of two numbers
    public static function max(a:Float, b:Float):Float {
        return Math.max(a, b);
    }

    // Returns the minimum of two numbers
    public static function min(a:Float, b:Float):Float {
        return Math.min(a, b);
    }

    // Returns the floor of a number, the largest integer less than or equal to the number
    public static function floor(value:Float):Float {
        return Math.floor(value);
    }

    // Returns the ceiling of a number, the smallest integer greater than or equal to the number
    public static function ceil(value:Float):Float {
        return Math.ceil(value);
    }

    // Returns true if two floating-point numbers are approximately equal within a specified tolerance
    public static function approxEQ(a:Float, b:Float, tolerance:Float = 1e-10):Bool {
        return Math.abs(a - b) <= tolerance;
    }

    // Returns the sign of a number. -1 for negative, 0 for zero [duh] and 1 for positive
    public static function sign(value:Float):Int {
        if (value > 0) return 1;
        else if (value < 0) return -1;
        else return 0;
    }

    // Returns the nearest integer to a number, rounding halfway cases away from zero
    public static function round(value:Float):Int {
        return Math.round(value);
    }

    // MORE COMPLICATED MISC STUFF

    // Clamps a value between a minimum and maximum range
    public static function clamp(value:Float, min:Float, max:Float):Float {
        return Math.max(min, Math.min(max, value));
    }

    // Maps a value from one range to another
    public static function map(value:Float, fromMin:Float, fromMax:Float, toMin:Float, toMax:Float):Float {
        return toMin + (value - fromMin) * (toMax - toMin) / (fromMax - fromMin);
    }

    // Linearly interpolates between two values based on a factor
    public static function lerp(start:Float, end:Float, t:Float):Float {
        return start + (end - start) * t;
    }

    // Returns the factorial of a non-negative integer n
    public static function factorial(n:Int):Int {
        var result = 1;
        for (i in 2...n + 1) {
            result *= i;
        }
        return result;
    }

    // wrap
    // Returns a value wrapped within a specified range
    public static function wrap(value:Float, min:Float, max:Float):Float {
        var range = max - min;
        return ((value - min) % range + range) % range + min;
    }

    // Returns a random number between min and max (inclusive)
    public static function random(min:Float = 0, max:Float = 1):Float {
        return min + Math.random() * (max - min);
    }

    // Returns the remainder of a division operation
    public static function mod(a:Float, b:Float):Float {
        return a - Math.floor(a / b) * b;
    }
    
    // Returns the greatest common divisor (GCD) of two integers using the Euclidean algorithm
    public static function gcd(a:Int, b:Int):Float {
        while (b != 0) {
            var temp = b;
            b = a % b;
            a = temp;
        }
        return Math.abs(a);
    }

    // Returns the least common multiple (LCM) of two integers
    public static function lcm(a:Int, b:Int):Float {
        if (a == 0 || b == 0) return 0;
        return Math.abs(a * b) / gcd(a, b);
    }

    // Returns a value snapped to the nearest multiple of a specified step size
    public static function snap(value:Float, step:Float):Float {
        return Math.round(value / step) * step;
    }
}
