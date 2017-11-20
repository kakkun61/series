module Main exposing (..)

import Html exposing (program)
import Type exposing (Model, Msg)
import Init exposing (init)
import View exposing (view)
import Update exposing (update)
import Subscriptions exposing (subscriptions)


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
