@icon("res://addons/dice_engine/dice.svg")
class_name DiceEngine extends Node
## A simple dice engine that can roll dice with a certain number of sides and amount, and return the result in different ways.


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
func roll(amount: int, sides: int, roll_type: RollType = RollType.SUM) -> int:
    var dice_results: Array[int] = []

    for die in range(amount):
        dice_results.append(randi() % sides + 1)
    
    var result: int = 0
    match roll_type:
        RollType.SUM:
            result = _sum(dice_results)
        RollType.HIGHEST:
            result = dice_results.max()
        RollType.LOWEST:
            result = dice_results.min()
        RollType.AVERAGE:
            result = _sum(dice_results) / amount

    rolled_dice.emit(result, dice_results, amount, sides, roll_type)

    return result


## Rolls a number of dice with a certain number of sides multiple times.
func roll_multiple(times: int, amount: int, sides: int, roll_type: RollType = RollType.SUM) -> Array[int]:
    var results: Array[int] = []

    for time in range(times):
        results.append(roll(amount, sides, roll_type))

    return results


func _sum(numbers: Array[int]) -> int:
    var result: int = 0
    for number in numbers:
        result += number
    return result
