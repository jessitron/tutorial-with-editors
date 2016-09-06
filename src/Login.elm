module Login exposing (Model, model, Msg, update, view)

import Html exposing (Html)
import Html.App
import Html.Attributes
import Html.Events


-- MODEL


type alias Model =
    { name : String
    , password : String
    , passwordAgain : String
    }


model =
    { name = ""
    , password = ""
    , passwordAgain = ""
    }



-- UPDATE


type Msg
    = Name String
    | Password String
    | PasswordAgain String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Name string ->
            { model | name = string }

        Password string ->
            { model | password = string }

        PasswordAgain string ->
            { model | passwordAgain = string }



-- VIEW


view : Model -> Html Msg
view model =
    Html.div []
        [ nameInput model
        , passwordInput model
        , passwordAgainInput model
        , viewValidation model
        ]


viewValidation : Model -> Html msg
viewValidation model =
    let
        ( color, message ) =
            if model.password == model.passwordAgain then
                ( "green", "OK" )
            else
                ( "red", "Passwords do not match!" )
    in
        Html.div [ Html.Attributes.style [ ( "color", color ) ] ]
            [ Html.text message ]


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


passwordAgainInput model =
    Html.input
        [ Html.Attributes.placeholder "passwordAgain"
        , Html.Attributes.type' "password"
        , Html.Events.onInput PasswordAgain
        ]
        []
