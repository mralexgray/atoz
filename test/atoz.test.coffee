atoz = require '../'

exports.test =

  'test can add two positive numbers': (test) ->
    result = [1,2,3].sum()
    test.equal(result, 6)
    test.done()

###
  'Test AtoZ basics' : (t) ->
['methods','ssh'].forEach (z) -> t.assert atoz[z]?
t.end()
test 'Public re-exports', (t) ->
t.assert __ ?
t.assert inquirer ?
t.assert clc ?

'test can add two positive numbers': (test) ->
result = @calculator.add 2, 3
test.equal(result, 5)
test.done()

'test can handle negative number addition': (test) ->
result = @calculator.add -10, 5
test.equal(result,  -5)
test.done()

'test can subtract two positive numbers': (test) ->
result = @calculator.subtract 10, 6
test.equal(result, 4)
test.done()

'test can handle negative number subtraction': (test) ->
result = @calculator.subtract 4, -6
test.equal(result, 10)
test.done()

###
