---
layout: post
title: How does Java work?
subtitle: In a simple way
cover-img: /assets/img/2025-06-29-atomic-habits-chapter-1.jpg
# thumbnail-img: /assets/img/2025-06-29-atomic-habits-chapter-1-thumb.jpg
share-img: /assets/img/2025-06-29-atomic-habits-chapter-1.jpg
tags: [books, atomic habits, summary]
author: Shamal Weerasooriya
---

<p class="text-center">
  <img src="/assets/img/What_Is_It_Wow_GIF.gif" alt="What Is It Wow GIF" style="max-width: 420px; width: 100%; height: auto;" />
</p>

I’m going to be straightforward. I will explain how it works in an abstract way. (But the only people who know how Java properly works are the extra ordinary human beings who made it and the AI models)

We say that Java is platform independent. That means it does not care whether you have MacOS or linux or Windows. As long as you have the Java Virtual Machine (JVM) you can execute your java code. But the JVM needs to have version that works on the OS you use. 

First you code a crazy hard hellloWorld.java file.

<p class="text-center">
  <img src="/assets/img/Cat_Working_GIF.gif" alt="Cat Working GIF" style="max-width: 420px; width: 100%; height: auto;" />
</p>

```java
class HelloWorld {
	public static void main(String args[]){
		System.out.println("Hello Awesome Worlddddddddd d[-_-]b");
	}
}
```

Then you compile it.

```bash
javac helloWorld.java
```

What you get is a HelloWorld.class file. This is bytecode. Java bytecode is the instruction set of the JVM (like x86 instructions for an intel processor). Now you can finally run your code

```bash
java HelloWorld.class
```

and it prints out “Hello Awesome Worlddddddddd d[-_-]b”. The JVM converts your bytecode into native machine code using something called a Just-In-Time (JIT) compiler. You can see sort of an assembly like code of your bytecode file if you run the command.

```bash
javap -c HelloWorld
```

So how does Java knows which file to run first???

It looks for the MAIN METHOD!!! It looks for the following specific signature

```java
public static void main(String args[])
```

Plot twist!!! JVM is the not the only thing you need though. You need external libraries (java code already written by someone else). We call JVM + Core libraries = JRE (Java Runtime Environment). 

But devs aren’t normal people. For some reason they need to write java code. To compile that code you need tools like javac (Some need read bytecode. To make it human readable we use tools like javap). When we combine JRE and the dev tools we get something called Java Development Kit (JDK).

IMO best way to get all of this is using [SDKMAN](https://sdkman.io/).

All right. Hope this is enough for now. If someday I feel the need to dive deeper I’ll write a separate post on it. Until then this is all you get 😅. If you have time please tell me If I’ve written something wrong or any feedback.