Everything is a class
Types:
- primitive
	- boolean 
	- char (16 bit unicode)
	- byte short int long (8,16,32,64 bit signed integer)
	- float double (32 and 64 bit real)
- object/complex
	- String
	- Vector
	- ...

Variable stores reference => no pointers => only passes by value
no goto
no operatori overloading/
no inline(all are)
New modifier:
- >> 1100 0000 => 1111 0000
- >>> 1100 0000 => 0011 0000

Labels:
``` java
int i = 1;
loop: while (i < 100) {
	for (int k = i; k < 300; k++) {
		if (k == i*2) break loop;
	}
}
```

