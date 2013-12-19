Gravel
======

Gravel is a Smalltalk implementation for the JVM


Getting started
===============

To open the IDE load everything in eclipse and start st.gravel.tools.StartJetty. Then point your browser to http://localhost:8080/browser 

What is Gravel
==============

Gravel is a modern Smalltalk implementation for the JVM. It's aim is to provide an interactive development environment in the Smalltalk philosophy as well as a stable runtime platform.

Implementation
--------------
The [patching-compiler](https://github.com/gravel-st/gravel/tree/master/src/main/java/st/gravel/support/compiler) of Gravel is written in Smalltalk with Type annotations. These type annotations Those parts are then transformed to [Java source code](https://github.com/gravel-st/gravel/tree/master/src/main/java/st/gravel/support/compiler) to bootstrap the system.
The runtime system then uses this compiler to generate bytecode. It uses the JSR-292 invokedynamic facilities.   