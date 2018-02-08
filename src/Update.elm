module Update exposing (update)

import Model exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            model ! []

        SetScreenSize size ->
            { model | screenSize = getScreenSize size } ! []

        Filter filterTerm ->
            { model
                | filtered = List.filter (String.contains model.filterTerm) model.githubProjects
                , filterTerm = filterTerm
            }
                ! []


getScreenSize size =
    if size.width <= 700 then
        Phone
    else if size.width <= 800 then
        Tablet
    else
        Desktop



-- getFiltered model =
--     List.filter (String.contains model.filterTerm) model.githubProjects
