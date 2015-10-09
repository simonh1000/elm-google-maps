module MapFold (init, update, view) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

import Effects exposing (Effects)
import Task
import Signal exposing (..)

import GoogleMap

-- MODEL
 -- GoogleMap.Model = Position
type alias Model = GoogleMap.Position

-- type alias Mailbox a =
--     { address : Address a
--     , signal : Signal a
--     }
-- mailbox : a -> Mailbox a
latbox = mailbox 52

init = { lat = 52, lng = 5 }

-- UPDATE

type Action =
      North
    | South


-- update : Action -> Model -> (Model, Effects Action)
update : Action -> Model -> Task.Task x ()
update action model =
    let
        newModel = case action of
            North -> { model | lat <- model.lat + 1 }
    -- in (newModel, send latbox.address newModel.lat)
    in send latbox.address newModel.lat

-- VIEW

view : Signal.Address Action -> Model -> Html
view address model =
    div []
        [ div [ id "map" ] []
        , button [ onClick address North ] [ text "North"]
        ]

-- PORTS

port lat : Signal Float
port lat = latbox.signal

-- foldp (a -> state -> state) state Signal a
-- main = view latbox.address init
