module View exposing (view)

import Color exposing (..)
import Element exposing (..)
import Element.Background as Background exposing (..)
import Element.Border as Border exposing (..)
import Element.Font as Font exposing (..)
import Element.Input as Input
import Html exposing (..)
import Model exposing (..)


blockAttributes screenSize =
    case screenSize of
        Phone ->
            [ Element.width (px 800)
            ]

        Tablet ->
            [ Element.width (px 1000)
            ]

        Desktop ->
            [ Element.width (px 1200)
            ]


wrapper : Model -> Element Msg
wrapper model =
    Element.column
        []
        [ pageArea model ]


pageArea : Model -> Element Msg
pageArea model =
    if model.screenSize == Phone then
        Element.column
            [ Background.color white
            , paddingLeft gutter
            , Font.family
                [ Font.typeface "Open Sans"
                , Font.sansSerif
                ]
            ]
            [ phoneHeaderArea
            , theAppDesc
            , row [ padding gutter ] [ inputForm ]
            , validateFilter model
            , paragraph
                []
                [ Element.text "Results:" ]
            , paragraph
                [ padding gutter
                , Background.color lightGrey
                , Font.size 16
                ]
                (List.map viewGithubProjects model.filtered)
            , overViewDesc
            , footerArea
            ]
    else
        Element.column
            []
            [ headerArea
            , mainColumns
                { left =
                    [ row [ padding gutter ] [ inputForm ]
                    , validateFilter model
                    , paragraph
                        []
                        [ Element.text "Results:" ]
                    , paragraph
                        [ padding gutter
                        , Background.color lightGrey
                        , Font.size 16
                        ]
                        (List.map viewGithubProjects model.filtered)
                    ]
                , right =
                    [ theAppDesc
                    , overViewDesc
                    ]
                }
            , footerArea
            ]


headerArea =
    row
        [ Background.color white
        , Font.color darkBlue
        , borderBottom 1
        , Border.color darkBlue
        ]
        [ elmlogo
        , Element.el
            [ centerY
            , Font.size 40
            , Font.bold
            ]
            (Element.text "desktop view")
        ]


phoneHeaderArea =
    row
        [ Background.color white
        , Font.color darkBlue
        , borderBottom 1
        , Border.color darkBlue
        ]
        [ Element.el
            [ centerY
            , Font.size 18
            , Font.bold
            ]
            (Element.text "phone view")
        ]


elmlogo =
    row []
        [ Element.image
            [ Element.width (px 180)
            , height (px 73)
            , Element.alignLeft
            ]
            { description = "the Elm Language logo"
            , src = "elm_logo.png"
            }
        ]


theAppDesc =
    paragraph
        [ padding gutter
        , Element.alignTop
        ]
        [ Element.el
            [ Element.alignLeft
            , Element.spacingXY 4 100
            , padding 10
            , Font.size 40

            -- , Font.lineHeight 0.5 -- no longer supported
            , Font.color darkBlue
            , Background.color white
            ]
            (Element.text "S")
        , paragraph
            [ Element.width (px 300)
            , Font.color black
            , Font.size 18
            ]
            [ Element.text " earch for stylish-elephants experimental projects by jbrgfx on github." ]
        ]


overViewDesc =
    paragraph
        [ padding gutter
        , Element.alignTop
        ]
        [ Element.el
            [ Element.alignLeft
            , Element.spacingXY 4 100
            , padding 10
            , Font.size 40

            -- , Font.lineHeight 0.5 -- no longer supported
            , Font.color darkBlue
            , Background.color white
            ]
            (Element.text "A")
        , paragraph
            [ Element.width (px 300)
            , Font.color black
            , Font.size 18
            ]
            [ Element.text " simple Elm module that filters a list using text input.  The module has an initial state to demonstrate to the end-user how the text box works and end-user feedback to guide the user in the use of the module." ]
        ]


viewGithubProjects entry =
    paragraph
        []
        [ newTabLink
            [ padding gutter
            , Font.bold
            , Font.size 18
            , Font.underline
            , alignBottom
            , Font.color darkBlue
            , Element.mouseOver [ Font.color Color.white, Background.color Color.darkBlue ]

            -- , Font.mouseOverColor Color.white
            ]
            { url = "https://github.com/jbrgfx/" ++ entry
            , label = Element.text entry
            }
        ]


validateFilter model =
    let
        message =
            if model.filterTerm == "" then
                "❌ No filter. Try adding one!"
            else
                "✅ Filter is set."
    in
    row []
        [ Element.text message ]


mainColumns { left, right } =
    row
        [ borderBottom 1
        , Border.color darkBlue
        ]
        [ column
            [ borderRight 1
            , Border.color darkBlue
            , paddingRight gutter
            ]
            left
        , column
            [ paddingLeft gutter ]
            right
        ]


inputForm : Element Msg
inputForm =
    Input.text
        [ Border.color Color.black
        ]
        { label = Input.labelLeft [] (Element.text "Filter:")
        , onChange = Just Filter
        , placeholder = Nothing
        , text = "el" -- model.filterTerm
        }


footerArea =
    paragraph
        [ Font.color darkBlue
        ]
        [ newTabLink
            [ padding gutter
            , Font.bold
            , Font.size 18
            , Font.underline
            , alignBottom
            ]
            { url = "http://package.elm-lang.org/packages/mdgriffith/stylish-elephants/latest/"
            , label = Element.text "stylish-elephants latest package docs"
            }
        , newTabLink
            [ Font.bold
            , Font.underline
            , Font.size 18
            , paddingLeft 20
            ]
            { url = "https://github.com/jbrgfx"
            , label = Element.text "jbrgfx's github repos"
            }
        ]



{- credit: https://github.com/opsb/cv-elm/blob/master/src/Atom.elm -}


gutter =
    20



{- credit: https://github.com/opsb/cv-elm/blob/master/src/Extra/Element.elm -}


borderRight n =
    Border.widthEach { right = n, left = 0, top = 0, bottom = 0 }


borderBottom n =
    Border.widthEach { right = 0, left = 0, top = 0, bottom = n }



{- credit: https://github.com/opsb/cv-elm/blob/master/src/Extra/Element.elm -}


paddingRight n =
    paddingEach { right = n, left = 0, top = 0, bottom = 0 }


paddingTop n =
    paddingEach { bottom = 0, top = n, left = 0, right = 0 }



{- credit: https://github.com/opsb/cv-elm/blob/master/src/Extra/Element.elm -}


paddingBottom n =
    paddingEach { bottom = n, top = 0, left = 0, right = 0 }



{- credit: https://github.com/opsb/cv-elm/blob/master/src/Extra/Element.elm -}


paddingLeft n =
    paddingEach { right = 0, left = n, top = 0, bottom = 0 }


view : Model -> Html Msg
view model =
    Element.layout
        [ Background.color white
        , padding gutter
        , spacing gutter
        ]
    <|
        wrapper model
