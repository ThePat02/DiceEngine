@icon("res://addons/dice_engine/roll.svg")
class_name DiceCheck extends Resource
## A simple dice check that can be used to compare the result of a dice roll with a certain value.


## The types of check to perform.
enum CheckType {
    GREATER_THAN,
    LESS_THAN,
    EQUAL_TO
}


## The results of the dice check.
enum DiceCheckResult {
    SUCCESS,
    FAILURE
}


## The type of check to perform.
@export var type: CheckType = CheckType.GREATER_THAN
## The value to compare the dice roll with.
@export var value: int = 10

@export_category("Dice Settings")
## The amount of dice to roll.
@export var dice_amount: int = 1
## The number of sides on the dice to roll.
@export var dice_sides: int = 20
## The type of roll to perform.
@export var roll_type: DiceEngine.RollType = DiceEngine.RollType.SUM


## Performs a dice check and returns the result.
func check() -> DiceCheckResult:
    var roll: int = Dice.roll(dice_amount, dice_sides, roll_type)
    var result: DiceCheckResult = DiceCheckResult.FAILURE

    match type:
        CheckType.GREATER_THAN:
            if roll > value:
                result = DiceCheckResult.SUCCESS
        CheckType.LESS_THAN:
            if roll < value:
                result = DiceCheckResult.SUCCESS
        CheckType.EQUAL_TO:
            if roll == value:
                result = DiceCheckResult.SUCCESS
    
    return result
