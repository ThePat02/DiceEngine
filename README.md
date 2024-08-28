# DiceEngine

<p align="center">
  <img src="addons\dice_engine\dice_engine.svg" alt="DiceEngine Icon" width="128" height="128">
</p>

<p align="center">
  <b>DiceEngine</b> is a simple Dice Roller for the Godot Engine 4.x written in `GDScript`!
</p>


## Features
- Roll any number of dice with any number of sides
- Perform and check the results of `DiceCheck` resources that can represent skill checks in your game


## Installation
**Method 1:** Copy the `addons/dice_engine` folder into your `addons` folder in your Godot project.<br>
**Method 2:** Install it directly from the AssetLib in the Godot Editor.


## Usage
All functionalities are documented in the in-game documentation. You can access it by pressing `F1` in the Godot Editor and searching for `DiceEngine` or `DiceCheck`.

### ![Singleton](addons/dice_engine/dice.svg) Dice Singleton
This plugin automatically adds a new `Dice` singleton to your project. You can access it from any script using something like this:
```gdscript
# Rolls 2 six-sided dice and returns the sum
var result_sum: int = Dice.roll(2, 6) # 2d6

# Rolls 3x 4 six-sided dice and returns the sum results in an array
var result_multiple: Array[int] = Dice.roll_multiple(3, 4, 6) # 3x 4d6
```

### ![Singleton](addons/dice_engine/dice.svg) DiceEngine
The core of this plugin is the `DiceEngine` class. It provides all the functionality to roll dice and gather the results. It has the following enums, methods and signals:

```gdscript
class_name DiceEngine extends Node
## A simple dice engine that can roll dice with a certain number of sides and amount,
## and return the result in different ways.

## Emitted when a dice roll is performed.
signal rolled_dice(result: int, dice_results: Array[int], dice_amount: int, dice_sides: int, roll_type: RollType)

## Predefined dice types using the DX notation, with X being the number of sides.
enum DiceType {
    D4 = 4,
    D6 = 6,
    D8 = 8,
    D10 = 10,
    D12 = 12,
    D20 = 20,
    D100 = 100,
}

## The type of roll to perform.
enum RollType {
    SUM, ## Default. The sum of all dice results.
    HIGHEST, ## The highest result.
    LOWEST, ## The lowest result.
    AVERAGE, ## The average result.
}

## Rolls a number of dice with a certain number of sides.
func roll(amount: int, sides: int, roll_type: RollType = RollType.SUM) -> int

## Rolls a number of dice with a certain number of sides multiple times.
func roll_multiple(times: int, amount: int, sides: int, roll_type: RollType = RollType.SUM) -> Array[int]
```

### ![DiceCheck](/addons/dice_engine/roll.svg) DiceCheck Resource
Using the `DiceCheck` resource, you can save perform dice roll checks (or more specifically, skill checks) and gather the results. I suggest, using this to store custom rolls inside your own skill check resource! It has the following properties and methods:

```gdscript
class_name DiceCheck extends Resource
## A simple dice check that can be used to compare the result of a dice roll with a certain value.

## The results of the dice check.
enum DiceCheckResult {
    SUCCESS,
    FAILURE
}

## The type of check to perform.
var type: CheckType = CheckType.GREATER_THAN
## The value to compare the dice roll with.
var value: int = 10
## The amount of dice to roll.
var dice_amount: int = 1
## The number of sides on the dice to roll.
var dice_sides: int = 20
## The type of roll to perform.
var roll_type: DiceEngine.RollType = DiceEngine.RollType.SUM

## Performs a dice check and returns the result.
func check() -> DiceCheckResult
```


## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
