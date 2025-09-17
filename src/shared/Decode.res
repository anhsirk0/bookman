module Json = Js.Json

let decodeObj = json => json->Json.decodeObject
let decodeStr = (obj, key) => obj->Dict.get(key)->Option.flatMap(s => Json.decodeString(s))
let decodeNum = (obj, key) => obj->Dict.get(key)->Option.flatMap(n => Json.decodeNumber(n))
let decodeInt = (obj, key) => obj->decodeStr(key)->Option.flatMap(s => Int.fromString(s))
let decodeBool = (obj, key) => obj->Dict.get(key)->Option.flatMap(n => Json.decodeBoolean(n))
let decodeArr = (obj, key) => obj->Dict.get(key)->Option.flatMap(a => Json.decodeArray(a))
