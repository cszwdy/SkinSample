# SkinSample

![](http://ww3.sinaimg.cn/large/72f96cbagw1f7ryecm3plg208w0gewkf.gif)

Run loops 是什么？

Run loops 属于线程范畴的内容，它代表着一套机制，即采用「轮询」的方式，来安排当前任务和协调新增任务。它的目的是高效地利用线程：当任务繁多时，使线程处于井井有条的工作状态；没有任务时，使线程处于休眠状态。这就是 Run loops 大致所做的事情。
```Swift
func method() {
  self.method()
}
```



## Anatomy of a Run Loop

A run loop is very much like its name sounds. It is a loop your thread enters and uses to run event handlers in response to incoming events. Your code provides the control statements used to implement the actual loop portion of the run loop—in other words, your code provides the while or for loop that drives the run loop. Within your loop, you use a run loop object to "run” the event-processing code that receives events and calls the installed handlers.

A run loop receives events from two different types of sources. Input sources deliver asynchronous events, usually messages from another thread or from a different application. Timer sources deliver synchronous events, occurring at a scheduled time or repeating interval. Both types of source use an application-specific handler routine to process the event when it arrives.

In addition to handling sources of input, run loops also generate notifications about the run loop’s behavior. Registered run-loop observers can receive these notifications and use them to do additional processing on the thread. You use Core Foundation to install run-loop observers on your threads.
1. A
2. B
3. C
4. D

In your code, you identify modes by name. Both Cocoa and Core Foundation define a default mode and several commonly used modes, along with strings for specifying those modes in your code. You can define custom modes by simply specifying a custom string for the mode name. Although the names you assign to custom modes are arbitrary, the contents of those modes are not. You must be sure to add one or more input sources, timers, or run-loop observers to any modes you create for them to be useful.


### Run Loop Modes
A run loop mode is a collection of input sources and timers to be monitored and a collection of run loop observers to be notified. Each time you run your run loop, you specify (either explicitly or implicitly) a particular “mode” in which to run. During that pass of the run loop, only sources associated with that mode are monitored and allowed to deliver their events. (Similarly, only observers associated with that mode are notified of the run loop’s progress.) Sources associated with other modes hold on to any new events until subsequent passes through the loop in the appropriate mode.

In your code, you identify modes by name. Both Cocoa and Core Foundation define a default mode and several commonly used modes, along with strings for specifying those modes in your code. You can define custom modes by simply specifying a custom string for the mode name. Although the names you assign to custom modes are arbitrary, the contents of those modes are not. You must be sure to add one or more input sources, timers, or run-loop observers to any modes you create for them to be useful.
