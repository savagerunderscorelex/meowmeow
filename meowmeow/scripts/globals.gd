extends Node

signal player_died() # Custome Signals !!!!! First step, define the signal (define in global script to allow the signal to be accessed across scripts.

var score: int
var isCountdownFinished: bool = false
var highScoreEndless: int = 0
var storyCompletionTimes: int

var hasCompletedStory: bool
var isMusicOn: bool = true
var gameMode: int = 2 # If game mode is 1, it is story. If game mode is 2, it is endless
