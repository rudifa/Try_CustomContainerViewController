#  Experiment with custom Container View Controller

See also  

[Managing View Controllers With Container View Controllers](https://cocoacasts.com/managing-view-controllers-with-container-view-controllers/)

Create other controllers

Try to set up a state machine

states: red, green, blue
events: done, cancel

switch on (state, event)
specify next_state, action

var nextState = fsm.next(event)
switch (nextState) {
case red: ...
case green: ...
case blue: ...
default: break
}

