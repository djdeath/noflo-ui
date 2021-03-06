NoFlo UI ChangeLog
==================

# 0.2.2 (git master)

* Copy and paste (via [the-graph](https://github.com/the-grid/the-graph/pull/167))
* Reverted the-graph dependency to use a specific version so noflo-ui tags will work
* Added support for changing the [node icon](http://fontawesome.io/icons/) of subgraphs

# 0.2.1 (2014 September 16)

* Fixed login not working due to missing error handling on Gravatar failures

# 0.2.0 (2014 September 16)

* Major refactoring to follow the Flux pattern
* Full project synchronization with GitHub
* Ability to connect dynamically to unregistered runtimes via supplying a URL-encoded runtime definition instead of the ID in format `endpoint?protocol=websocket&address=ws://example.net:3569`. For example:

```
#runtime/endpoint%3Fprotocol%3Dwebsocket%26address%3Dws%3A%2F%2Flocalhost%3A3570
```
* Graph search: in the search input, press tab to toggle modes (search library / search graph)
* More [bugfixes and tweaks](https://github.com/noflo/noflo-ui/issues?q=milestone%3A0.2.0+is%3Aclosed)

## 0.1.13 (2014 September 5)

* Firefox `shim-shadowdom` styling fix #320

## 0.1.12 (2014 September 4)

* Updated to Polymer 0.4.0
* JavaFBP support via newer noflo-runtime library

## 0.1.10 (2014 August 4)

* Added the `noflo-react` and `noflo-amd` components and the appropriate Require.js setup to the bundled HTML runtime
* Added `noflo-webaudio`
* Minor authentication fixes

## 0.1.8 (2014 May 25)

* Disable git upload button until you type a commit message
* z-index layering refactor and pixel tweaks
* Bigger curves for loopback edges in the-graph

## 0.1.7 (2014 May 23)

* Autolayout fix

## 0.1.6 (2014 May 20)

* Node inspector renders a `<select>` dropdown for ports with `values` set
* Number scrubber fixes
* Changing label now changes node id #214
* Changes to search UX #238
* Polymer 0.2.4
* Font Awesome 4.1.0

## 0.1.5 (2014 May 17)

* Added support for [viewing component source code](https://github.com/noflo/noflo-ui/issues/223) for library components. Requires runtime-level support
* Support for Chrome 35+ (native custom elements) and Polymer 0.2.3 
* Pinch zoom gesture via Hammer.js 

## 0.1.4 (2014 May 9)

* No changes, just version bump for Chrome app

## 0.1.3 (2014 May 8)

* Added examples to home screen
* Added support for `int` and `date` inport types in Node Inspector
* Fixed IndexedDB initialization issue with Chrome Apps
* `connect` events are also shown now in the edge logs

## 0.1.1 (2014 May 6)

* We now get the GitHub token, Flowhub plan, and user information through a single API call
* Added some anonymized usage metrics to help guide development
* Undo/redo are now disabled when there is no history in that direction

## 0.0.8 (2014 May 1)

* Project creation now requires login

## 0.0.7 (2014 April 29)

* Made CHANGES.md
