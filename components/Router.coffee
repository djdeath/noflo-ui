noflo = require 'noflo'

class Router extends noflo.Component
  constructor: ->
    @inPorts = new noflo.InPorts
      url:
        datatype: 'string'
    @outPorts = new noflo.OutPorts
      route:
        datatype: 'object'
      main:
        datatype: 'bang'
        required: false
      missed:
        datatype: 'string'
        required: false
      project:
        datatype: 'object'
        required: false
      runtime:
        datatype: 'object'
        required: false

    @inPorts.url.on 'data', (url) =>
      args = @matchArguments url
      if args.runtime
        console.log 'Runtime:'
        console.log args.runtime
        @outPorts.runtime.send args.runtime
        @outPorts.runtime.disconnect()
      if args.project
        console.log 'Project:'
        console.log args.project
        @outPorts.project.send args.project
        @outPorts.project.disconnect()

      matched = @matchPath url
      unless matched
        @outPorts.missed.send url
        @outPorts.missed.disconnect()
        return

      @outPorts.route.send matched
      @outPorts.route.disconnect()

      if matched.route is 'main'
        @outPorts.main.send true
        @outPorts.main.disconnect()

  getUrlVars: (url) ->
    vars = {}
    hashes = url.slice(url.indexOf('?') + 1).split('&')
    for hash in hashes
      kv = hash.split('=')
      vars[kv[0]] = kv[1];
    vars

  matchArguments: (url) ->
    args = {}
    vars = @getUrlVars(url)

    # Runtime specification
    runtime = vars.runtime
    try
      args.runtime = JSON.parse atob decodeURIComponent runtime
    catch e
    # Project specification
    project = vars.project
    try
      args.project = JSON.parse atob decodeURIComponent project
    catch e

    args

  matchPath: (url) ->
    routeData =
      route: ''
    if url is ''
      routeData.route = 'main'
      return routeData
    if url.substr(0, 8) is 'project/'
      remainder = url.substr 8
      parts = remainder.split '/'
      routeData.project = parts.shift()
      if parts[0] is 'component' and parts.length is 2
        routeData.route = 'component'
        routeData.component = parts[1]
        return routeData
      routeData.route = 'graph'
      routeData.graph = parts.shift()
      routeData.nodes = parts
      return routeData
    if url.substr(0, 8) is 'example/'
      routeData.route = 'example'
      routeData.graphs = [url.substr(8)]
      return routeData
    return null

exports.getComponent = -> new Router
