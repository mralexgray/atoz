a = require './'

ssh = a.ssh 'v6www.com'

ssh.exec 'ls /',
  out: (stdout) ->
    console.log stdout
  err: (stderr) ->
    console.log stderr

ssh.start
  success: ->
    console.log 'success'
  fail: (err) ->
    console.log "errrored #{err}"
 
console.log([1,2,3].sum())