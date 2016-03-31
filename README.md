# ocaml-cordova-plugin-dialogs

Binding to
[cordova-plugin-dialogs](https://github.com/apache/cordova-plugin-dialogs)

[Example
application](https://github.com/dannywillems/ocaml-cordova-plugin-dialogs-example).

## What does cordova-plugin-dialogs do ?

```
This plugin defines a global `navigator.dialogs` object, which provides access
to the device dialogs database.
```

Source: [cordova-plugin-dialogs](https://github.com/apache/cordova-plugin-dialogs)

## Repository branches and tags

We are migrating bindings from
[js_of_ocaml](https://github.com/ocsigen/js_of_ocaml) (low level bindings) to
[gen_js_api](https://github.com/lexifi/gen_js_api) (high level bindings).

The gen_js_api binding allows to use *pure* ocaml types (you don't have to use
the ## syntax from js_of_ocaml or Js.string type but only # and string type).

The js_of_ocaml version is available in the branch
[*js_of_ocaml*](https://github.com/dannywillems/ocaml-cordova-plugin-dialogs/tree/js_of_ocaml)
but we **recommend** to use the gen_js_api version which is the master branch.

## How to use ?

TODO

## ! BE CAREFUL !

The plugin creates a new object called *navigator.notification*, but the object is
available when the *deviceready* event is handled.

We provide a function *Dialogs.t* of type *unit -> Dialogs.notification* which creates the
binding to the *navigator.notification* object. You must call it when the deviceready
event is handled, eg (with js_of_ocaml)

```OCaml
let on_device_ready _ =
  let d = Dialogs.t () in
  (* Some code *)

let _ =
  Dom.addEventListener Dom_html.document (Dom.Event.make "deviceready")
  (Dom_html.handler on_device_ready) Js._false
```
