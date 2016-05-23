type button_response =
  | Ok [@js 1]
  | Cancel [@js 2]
  | Back_button [@js 0]
  [@@js.enum]

class notification : Ojs.t ->
  object
    inherit Ojs.obj
    (* Show an alert with a button *)
    (* alert [message] [callback] ?[title] ?[text_button] *)
    method alert :  string                                      ->
                    (unit -> unit)                              ->
                    ?title:(string [@js.default "Alert"])       ->
                    ?button_text:(string [@js.default "OK"])    ->
                    unit                                        ->
                    unit

    (* Show a confirm with two buttons *)
    (* confirm [message] [callback] ?[title] ?[label_button] *)
    method confirm :  string                                      ->
                      (button_response -> unit)                   ->
                      ?title:(string [@js.default "Confirm"])     ->
                      ?button_labels:(string array [@js.default
                        [|"OK";"Cancel"|]])                       ->
                      unit                                        ->
                      unit

    (* Show a prompt with two buttons *)
    (* promp [message] [callback] ?[title] ?[label_button] ?[default_text] *)
    method prompt : string                                              ->
                    (button_response -> unit)                           ->
                    ?title:(string [@js.default "Prompt"])              ->
                    ?button_label:(string array [@js.default [|"OK";
                      "Cancel"|]])                                      ->
                    ?default_text:(string [@js.default ""])             ->
                    unit                                                ->
                    unit

    (* Beep *)
    (* beep [nb_beep] *)
    method beep   : int -> unit
  end

(* -------------------------------------------------------------------------- *)
val t : unit -> notification
[@@js.get "navigator.notification"]
(* -------------------------------------------------------------------------- *)
