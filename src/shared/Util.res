@val @scope("window")
external openUrl: (string, string) => unit = "open"

let toCapitalize = str =>
  str->String.charAt(0)->String.toUpperCase ++ str->String.sliceToEnd(~start=1)

let cn = strs => strs->Array.filter(s => s->String.length > 0)->Array.join(" ")

let sep = "•"
let range = Belt.Array.range(1, _)
let isValidToken = token => token->String.length > 34

let toInitials = name =>
  name
  ->String.split(" ")
  ->Array.map(s => s->String.charAt(0))
  ->Array.map(String.toUpperCase)
  ->Array.join("")

let searchLink = (url, text, ~target="_blank") => {
  url
  ->String.replace("<Q>", encodeURI(text))
  ->openUrl(target)
}

module Str = {
  let isEmpty = str => str->String.length === 0
  let or = (str, str2) => str->isEmpty ? str2 : str
  // let isSame = (str, str2) => str->String.toLowerCase == str2->String.toLowerCase
}

module Dom = {
  @send external focus: Dom.element => unit = "focus"
  @send external blur: Dom.element => unit = "blur"
  @send external setAttribute: (Dom.element, string, string) => unit = "setAttribute"

  let querySelectAndThen = (selector, action) => {
    switch ReactDOM.querySelector(selector) {
    | Some(el) => el->action
    | None => ()
    }
  }

  let targetValue = evt => ReactEvent.Form.target(evt)["value"]
  let setTheme = theme => "html"->querySelectAndThen(setAttribute(_, "data-theme", theme))

  let copyText: string => unit = %raw(`function (text) {
    navigator.clipboard.writeText(text)
  }`)
}
