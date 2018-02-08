module Subscriptions exposing (subscriptions)

import Model exposing (..)
import Window exposing (resizes)


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Window.resizes SetScreenSize
        ]
