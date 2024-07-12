---
comments: true
---

# Testing

The following languages contain small improvements to the existing testing infrastructure.

## Lantest

> ^^com.mbeddr.mpsutil.lantest^^

This language was an attempt to automatically test languages, for example, check if the generation of files finished successfully or that you can instantiate existing models again via the editor (for example: discover bugs in constraints).

!!! warning "This language isn't working anymore."

## Test Utils

> ^^com.mbeddr.mpsutil.test.util^^

Compare models inside a test case with the class [ModelAsserter](http://127.0.0.1:63320/node?ref=fdfc256f-c0b4-4ea1-9ada-e6e752358eb7%2Fr%3Ac8a1c63c-511b-4685-8f66-17b348dd5cb3%28com.mbeddr.mpsutil.test.util%2Fcom.mbeddr.mpsutil.test.util%29%2F4319749102859030414). When the two models don't match, it shows the difference between them.

## Wait For

> ^^com.mbeddr.mpsutil.blutil.test.waitfor^^

For tests, this language contains an assert item *wait for* that waits for an expression to become true. If the condition
evaluates to false, the check repeats every *m* millisecond until the timeout of *n* milliseconds is reached. You can set
*m* and *n* in the inspector of the statement.

A use case for this statement could be a multithreaded code, where you have to wait for the result of a different thread:

```
boolean enoughTimeHasElapsed; 
ApplicationManager.getApplication().executeOnPooledThread({ => 
  try { 
    Thread.sleep(50); 
  } catch (InterruptedException e) { 
    e.printStackTrace(); 
  } 
  enoughTimeHasElapsed = true; 
}); 
wait for enoughTimeHasElapsed;
```

