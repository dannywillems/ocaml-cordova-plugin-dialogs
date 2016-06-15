type button_response =
  | Ok [@js 1]
  | Cancel [@js 2]
  | Back_button [@js 0]
  [@@js.enum]

(* Show an alert with a button *)
(* alert [message] [callback] ?[title] ?[text_button] *)
val alert :
  string                                                          ->
  ?cb:(unit -> unit [@js.default (fun () -> ())])                 ->
  ?title:(string [@js.default "Alert"])                           ->
  ?button_text:(string [@js.default "OK"])                        ->
  unit                                                            ->
  unit
[@@js.global "navigator.notification.alert"]

(* Show a confirm with two buttons *)
(* confirm [message] [callback] ?[title] ?[label_button] *)
val confirm :
  string                                                          ->
  ?cb:(button_response -> unit [@js.default (fun e -> ())])       ->
  ?title:(string [@js.default "Confirm"])                         ->
  ?button_labels:(string array [@js.default [|"OK" ; "Cancel"|]]) ->
  unit                                                            ->
  unit
[@@js.global "navigator.notification.confirm"]

(* Show a prompt with two buttons *)
(* promp [message] [callback] ?[title] ?[label_button] ?[default_text] *)
val prompt :
  string                                                          ->
  ?cb:(button_response -> unit [@js.default (fun e -> ())])       ->
  ?title:(string [@js.default "Prompt"])                          ->
  ?button_label:(string array [@js.default [|"OK" ; "Cancel"|]])  ->
  ?default_text:(string [@js.default ""])                         ->
  unit                                                            ->
  unit
[@@js.global "navigator.notification.prompt"]

(* Beep *)
(* beep [nb_beep] *)
val beep   : int -> unit
[@@js.global "navigator.notification.beep"]
(* -------------------------------------------------------------------------- *)
