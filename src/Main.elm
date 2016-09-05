module Main exposing (main)

import Html exposing (Html)
import Html.App
import Html.Attributes
import Html.Events


main : Program Never
main =
    Html.App.beginnerProgram
        { model = model
        , update = update
        , view = view
        }



-- MODEL


type alias Model =
    { name : String
    , password : String
    }


model =
    { name = ""
    , password = ""
    }



-- UPDATE


type Msg
    = Noop
    | Name String
    | Password String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Name string ->
            { model | name = string }

        Password string ->
            { model | password = string }

        Noop ->
            model



-- VIEW


view : Model -> Html Msg
view model =
    Html.div []
        [ nameInput model
        , passwordInput model
        ]


nameInput model =
    Html.input
        [ Html.Attributes.placeholder "name"
        , Html.Attributes.type' "text"
        , Html.Events.onInput Name
        ]
        []


passwordInput model =
    Html.input
        [ Html.Attributes.placeholder "password"
        , Html.Attributes.type' "password"
        , Html.Events.onInput Password
        ]
        []
