module Bookmark = {
  type t = {
    id: float,
    title: string,
    url: string,
    icon: string,
  }

  let make = %todo
}

module Site = {
  type t = {
    id: float,
    title: string,
    url: string,
    icon: string,
    showLabel: bool,
    bgcolor?: string,
  }

  let empty = {
    id: 0.,
    title: "",
    url: "",
    icon: "",
    showLabel: true,
  }
}

module Link = {
  type t = {id: float, title: string, url: string}
}
