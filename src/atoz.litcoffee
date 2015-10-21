### atoz node module

These are some "private" variables, scoped to use in this file only.

	expand = require 'expand-home-dir'
	stats = require 'npm-stats'
	C = require 'configstore'

These are naughty js-backticked "globally" available module "re-exports"
	
	`
	 inquirer = require('inquirer'),
				 __ = require('underscore'),
				clc = require('cli-color'),
		 config = new C(),
		glasses = require('glasses'),
				 fs = require('fs'),
			 util = require('util'),
				SSH = require('simple-ssh'),
		 rsync = require('rsyncwrapper').rsync
	`
	
	extend = (obj, mixin) ->
	  obj[name] = method for name, method of mixin        
	  obj

	include = (klass, mixin) -> extend klass.prototype, mixin

	### Usage  https://arcturo.github.io/library/coffeescript/03_classes.html
	include Parrot,
	  isDeceased: true
	(new Parrot).isDeceased
	###

	Function :: args = (args) ->
		Array.prototype.slice.call args

	Object :: print = (color) ->
	  console.log if color and clc.supportsColor then clc[color](@) else @

	Array :: sum = -> @.reduce (x, y) -> x + y

	clc.supportsColor = -> require 'supports-color'

	module.exports =
	
		upload: (file) ->
			rsync
				src: file
				recursive: true
				ssh: true
				port: "22"
				privateKey: "~/.ssh/id_rsa"
				noExec: true
			, (e,stdout,stderr,cmd) ->
				if e? then console.log "error: #{e.message} (#{cmd})" else console.log "success! #{cmd}"
				
		ssh: (host) ->
	    new SSH
	      host: host
	      user: 'root'
	      key: fs.readFileSync this.home('~/.ssh/id_rsa')
				
	  home: (path) ->
	    expand(path)
			
	  methods: (obj) ->
	    glasses.methods (obj)
			
	  introspect: (obj) ->
	    console.log util.inspect  obj,
	      showHidden: yes
	      depth: null
	      colors: yes
				
	  dlcount: (mods, res) ->
	    modules = Array.isArray(mods) ? mods : [mods]
	    modules.forEach (mod) ->
	      stats.module(mod).downloads (err, val) ->
	        x = (x.value for x of val).sum()
	        if res then res x else console.log x
