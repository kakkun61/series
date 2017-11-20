module Update exposing (update)

import Type exposing (Model, Msg)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )
