Gravel
======

Gravel is a Smalltalk implementation for the JVM


Getting started
===============

To open the IDE; load everything in eclipse and start [st.gravel.tools.StartJetty](https://github.com/gravel-st/gravel/blob/master/src/main/java/st/gravel/tools/StartJetty.java). Then point your
browser to [http://localhost:8080/browser](http://localhost:8080/browser)

What is Gravel
==============

Gravel is a modern Smalltalk implementation for the JVM. It's aim is to provide an interactive 
development environment in the Smalltalk philosophy as well as a stable runtime platform. Gravel 
aims to be fully [ANSI Smalltalk](http://wiki.squeak.org/squeak/172) compatible.

Implementation
--------------
The [parser](https://github.com/gravel-st/gravel/tree/master/src/main/st/Parser/st/gravel/support/compiler/ast)
and [patching-compiler](https://github.com/gravel-st/gravel/tree/master/src/main/st/Parser-Compiler/st/gravel/support/compiler/jvm)
of Gravel is written in Smalltalk with Type annotations. These type annotations allow these parts of gravel
to be transformed to [Java source code](https://github.com/gravel-st/gravel/tree/master/src/main/java/st/gravel/support/compiler).
The runtime system then uses this compiler to generate bytecode. It uses the JSR-292 invokedynamic facilities.

Features
--------
 - Traits
 - Optional typing
 - Patching compiler
 - Full block closures
 - Resumable exceptions
 - Namespaces
 - Mirror based reflection facilities
 
Commonly Smalltalk features that we probably won't support
--------
 - become:
 - thisContext
 
Benchmarks
----------
Some preliminary benchmark results of running DeltaBlue>>longBenchmark for five iterations on my *Intel(R) Xeon(R) CPU E31270 @ 3.40GHz*. The good stuff:

[Reference Java Implementation](https://github.com/gravel-st/gravel/blob/master/src/test/java/st/gravel/benchmark/DeltaBlue.java) :
```
Duration: 2030 ms
Duration: 2012 ms
Duration: 1996 ms
Duration: 2042 ms
Duration: 2057 ms
```

Reference Smalltalk Implementation in Gravel:
```
Duration: 3651 ms
Duration: 1420 ms
Duration: 1311 ms
Duration: 1376 ms
Duration: 1304 ms
```
As we can see after the first iteration the hotspot compiler kicks.

The bad: Gravel isn't at its best with the Richards benchmark. To compare Java with Gravel:

Java:
```
Duration: 28 ms
Duration: 8 ms
Duration: 8 ms
Duration: 7 ms
Duration: 7 ms
```

Gravel:
```
100 iterations run in: 1937 ms
100 iterations run in: 1280 ms
100 iterations run in: 1272 ms
100 iterations run in: 1295 ms
100 iterations run in: 1278 ms
```
