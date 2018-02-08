module Initialize exposing (init)

import Model exposing (..)


init : ( Model, Cmd Msg )
init =
    { screenSize = Desktop
    , githubProjects = [ "elm-filtered-list", "elm-style-elements-experiments", "responsive-stylish-elephants" ]
    , filtered = [ "elm-filtered-list", "elm-style-elements-experiments", "responsive-stylish-elephants" ]
    , filterTerm = "el"
    }
        ! []
