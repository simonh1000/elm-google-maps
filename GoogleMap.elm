module GoogleMap (Position, Action) where

-- import Native.GoogleMap

import Html exposing (..)

-- MODEL
type alias Position =
    { lat : Float
    , lng : Float
    }

type Action =
      MapLoaded
    | MapError

-- createMap : Int -> Int -> Task Error Html
-- createMap = Native.GoogleMap.createMap

-- gmap : String -> Position -> Html
-- gmap =
