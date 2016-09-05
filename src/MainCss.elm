module MainCss exposing (..)

import Css exposing (..)
import Css.Elements
import Css.Namespace exposing (namespace)


css : Stylesheet
css =
    (stylesheet << namespace "tutorialWithEditors")
        [ Css.Elements.img [ display block, margin auto ]
        ]
