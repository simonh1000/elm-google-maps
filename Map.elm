module Map (init, update, view) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

import Effects exposing (Effects)

import Task exposing (..)
import GoogleMap

-- MODEL
type alias Position =
    { lat : Float
    , lng : Float
    }

type alias Model = Position

init : Model
init = { lat = 43, lng = 4.5 }

-- UPDATE
type Action =
      North

update : Action -> Model -> (Model, Effects Action)
update action model =
    case action of
        North -> ( { model | lat <- model.lat + 1 }, Effects.none )

-- VIEW
view : Signal.Address Action -> Model -> Html
view address model =
    div []
        [ button [ onClick address North ] [ text "North" ]
        ]
