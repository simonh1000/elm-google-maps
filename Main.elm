import StartApp
-- import StartApp.Simple exposing (start)

import Effects exposing (Never)
import Task

import Map exposing (init, update, view)

-- main =
--     start
--         { model = init
--         , update = update
--         , view = view
--         }

app =
  StartApp.start
    { init = (init, Effects.none)
    , update = update
    , view = view
    , inputs = []
    }

main =
  app.html

port tasks : Signal (Task.Task Never ())
port tasks =
  app.tasks

port lat : Signal Float
port lat = Signal.map (\m -> m.lat) app.model
-- port lat = Signal.map (.lat) app.model
