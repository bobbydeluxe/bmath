# 🅱️math

a math library for haxe. because the built-in one is kinda mid.

includes stuff like:
- better trigonometry
- clamping, lerping, mapping
- complex number support (yes, fr)
- factorials, gcd, lcm, logs, etc
- constants like π, e, φ, i, and your mom

based on stuff from `funkin.vis` + a little spite

## install

``` shell
haxelib git bmath https://github.com/bobbydeluxe/bmath.git
```

also slap this in your `project.xml`:

``` xml
<haxelib name="bmath" version="git" />
```

## example

``` haxe
import bobbydx.math.BMath;
import bobbydx.math.ComplexUnit;

class Main {
	static function main() {
		trace(Std.string(BMath.clamp(4.20, 0, 1))); // 1

		var z = new ComplexUnit(3, 4);
		trace(Std.string(z.magnitude)); // 5
		trace(Std.string(z * BMath.CMPLX_I)); // rotates it 90 degrees
	}
}
```

## license

mit. do whatever bro.

## bugfixes

if you find any bugs, i'll fix them. just dm me on discord [bobbydx428] as i'm not checking issues here for the time being.
if you want to contribute, go ahead! just make sure to follow the code style and stuff i guess.