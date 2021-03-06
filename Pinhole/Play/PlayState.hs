module Play.PlayState
( PlayState (PlayState)
, level
, balls
, drawnWalls

, DocState (DocShownFor, DocDone)
, docState

, drawing
, future
, paused

, playLevel
, initBall

, Ball (Ball)
, pos
, vel
, theta
, omega
, radius

, DrawState (Drawing, NotDrawing) ) where

import Graphics.Gloss.Data.Vector

import Level.Level

data PlayState = PlayState {
      level :: Level

    , balls :: [Ball]
    , drawnWalls :: [Wall]

    , docState :: DocState

    , drawing :: DrawState
    , future :: Bool
    , paused :: Bool
    } deriving (Show)

data Ball = Ball {
      pos :: Vector
    , vel :: Vector
    , theta :: Float
    , omega :: Float
    , radius :: Float
    } deriving (Show)

data DocState = DocShownFor Float | DocDone
                deriving (Show)

data DrawState = Drawing Wall | NotDrawing
                 deriving (Show)

playLevel :: Level -> PlayState
playLevel l = PlayState {
                level = l

              , balls = [initBall l]
              , drawnWalls = []

              , docState = DocShownFor 0

              , drawing = NotDrawing
              , future = False
              , paused = False }

initBall :: Level -> Ball
initBall l = Ball { pos = spawn l
                  , vel = (0, 0)
                  , theta = 0
                  , omega = 0
                  , radius = 20 }
