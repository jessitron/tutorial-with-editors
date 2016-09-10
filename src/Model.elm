module Model exposing (Model)

import RandomGif
import Login


type alias Model =
    { randomGif : RandomGif.Model
    , login : Login.Model
    }
