# 🅱️math 📀

a haxe math revamp so i don't have to search degrees to radians and everything

this is a tiny haxelib with math shortcuts for haxe. it wraps/repeats stuff from haxe's base `Math` class but makes it easier for me to remember and use. good for algebraic expressions, constants, and just not cluttering up code with tons of `Math.` everywhere.

## install

`haxelib git bmath https://github.com/bobbydeluxe/bmath.git`

then just:

`import bobbydx.bmath.BMath`

## features

- exponentiation and trig stuff again (logic is too simple to change)
- log with customizable base (yes finally)
- constants like pi and phi and e
- radians-degree multipliers
- simplified function names i guess
- everything is static
- all in one file. yea bro

## examples

```
BMath.pow(x, 3); // x cubed
BMath.log(64, 2); // base 2 log example, gives u 6
BMath.sin(BMath.degToRad(45)); // degrees workaround
BMath.PI; // just pi. around 3.141592653989.
BMath.E; // euler's number. around 2.718281828459
```

## contrast to haxe `Math`

- math.log() is only natural log (ln), but `BMath.log(v, base)` exists here. now you can have base 2 or base 10 or base whatever.
- sin/cos/tan etc. are restated. they're still radians, but you can use `toRadians` to pass degrees if u want
- 4th root? 5th root? just use fractional exponentiation for anything above `cbrt`.
- i don't include advanced stuff like clamp rn... too lazy lol just use haxeflixel's math or some shi i aint writin a whole cas

## faq

**q: can you add gradian angles?**  
a: multiply your degree value by 10/9 silly

**q: can u add secant cosecant and cotangent**  
a: check inside the `trig` function

**q: will you re-implement `Math.exp`?**  
a: just use `BMath.pow(x, BMath.E)`

**q: does it support fractions**  
a: aren't they just division problems people just leave like that? also yea bro its haxe ofc it does

**q: where's tau**  
a: no lol

---

of course, if you won't want to keep writing the letter **B** everywhere, you can just `import bobbydx.bmath.BMath as Math` and possibly a `import Math as HxMath` and that'll do the trick.

follow for more cool stuff

<p align="right">
  <img src="https://raw.githubusercontent.com/bobbydeluxe/bobbydeluxe/refs/heads/main/logo.png" width="150">
</p>
