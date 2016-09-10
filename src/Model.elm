module Model exposing (Model)

import RandomGif.Model
import Login


type alias Model =
    { randomGif : RandomGif.Model.Model
    , login : Login.Model
    }
