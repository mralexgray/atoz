
	[test, atoz] = ( require v for v in ['ava', '../'] )


	test 'Test AtoZ basics', (t) ->
	  ['methods','ssh'].forEach (z) -> t.assert atoz[z]?
	  t.end()

	test 'Public re-exports', (t) ->
	  t.assert __ ?
	  t.assert inquirer ?
	  t.assert clc ?
	  t.end()

	test 'Object prototyes', (t) ->
	  t.assert Object.print ?
	  t.end()

	test 'Array prototyes', (t) ->
	  # t.assert Array.sum?
	  t.is [1,2,3].sum(), 6
	  t.end()

	test 'bar', (t) ->
	  t.plan 2
	  setTimeout ->
	    t.is 'bar', 'bar'
	    t.same ['a', 'b'], ['a', 'b']
	  , 100

	test 'Test simple ssh session', (t) ->
	  t.plan(1)
	  ssh = atoz.ssh 'v6www.com'
	  setTimeout ->
	    ssh.start
	      success: ->
	        ssh.exec 'ls /',
	          out: (stdout) ->
	            t.pass(stdout)
	          err: (stderr) ->
	            t.fail()
	      fail: (err) -> t.fail()
	  , 500

	test 'Test Assesrtions', (t) ->
	  t.pass 'Passing assertion.'
	  t.ok 'Assert that `value` is truthy.'
	  t.notOk  !'Assert that `value` is falsy.'
	  t.end()
	  # t.fail 'Failing assertion.'


	# ssh.exec 'ls /',
	#   out: (stdout) ->
	#     console.log stdout
	#   err: (stderr) ->
	#     console.log stderr


	# t.assert alexicons.random()
	# t.assert alexicons.random() != alexicons.random()
	# t.assert alexicons.all[0] == 'When do I look at the camera?'
	# t.assert alexicons.all[1] == 'When do I look?'

	#
	# ### .true(value, [message])
	#
	# Assert that `value` is `true`.
	#
	# ### .false(value, [message])
	#
	# Assert that `value` is `false`.
	#
	# ### .is(value, expected, [message])
	#
	# Assert that `value` is equal to `expected`.
	#
	# ### .not(value, expected, [message])
	#
	# Assert that `value` is not equal to `expected`.
	#
	# ### .same(value, expected, [message])
	#
	# Assert that `value` is deep equal to `expected`.
	#
	# ### .notSame(value, expected, [message])
	#
	# Assert that `value` is not deep equal to `expected`.
	#
	# ### .throws(function, error, [message])
	#
	# Assert that `function` throws an error.
	#
	# `error` can be a constructor, regex or validation function.
	#
	# ### .doesNotThrow(function, [message])
	#
	# Assert that `function` doesn't throw an `error`.
	#
	# ### .regexTest(regex, contents, [message])
	#
	# Assert that `regex` matches `contents`.
	#
	# ### .ifError(error, [message])
	#
	# Assert that `error` is falsy.

