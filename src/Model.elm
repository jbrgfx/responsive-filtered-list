module Model exposing (..)

import Window


type ScreenSize
    = Phone
    | Tablet
    | Desktop


type alias Model =
    { screenSize : ScreenSize
    , githubProjects : List String
    , filtered : List String
    , filterTerm : String
    }


type Msg
    = NoOp
    | SetScreenSize Window.Size
    | Filter String
