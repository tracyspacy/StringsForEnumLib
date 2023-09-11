# Solidity StringsForEnum Library


## Overview
My motivation was to create a library that while works with / modifies contract storage, is still simple to interact with (as simple as a.toString(), without complex parameters).  

StringsForEnum is a Solidity library example that provides a solution to a limitation in Solidity's native support for enumerated types (enums). By default, Solidity does not support string values for enums. This library overcomes this limitation, making it easier for developers to work with enums by allowing them to get string values for enum elements.



## Functions
- **isValidEnumValue(uint8 value)**: Verifies if an enum value is valid, i.e., its string equivalent is not empty.
- **toString(uint8 value)**: Transforms an enum value (uint8) to its corresponding string equivalent. Throws a `NotValidEnumValue` error if the enum value is not valid.
- **toIntWithString(uint8 value)**: Returns an enum value along with its string equivalent. Throws a `NotValidEnumValue` error if the enum value is not valid.


## Usage Example

```
enum ActionChoices { GoLeft, GoRight, GoStraight, SitStill }
ActionChoices choice;

// Returns uint as default
// GoLeft     - 0
// GoRight    - 1
// GoStraight - 2
// SitStill   - 3

function get() public view returns (ActionChoices) {
        return choice;
    }
// returns 0

using StringsForEnum for uint8;
...
function getChoiceStr() public view returns (string memory){
        return uint8(choice).toString();
    }
// returns specified String Value for ex. "GoLeft"
```

* string values have to specified in advance, see [example contract](https://github.com/tracyspacy/StringsForEnumLib/blob/main/contracts/testEnumContract.sol)
    

## Usage

To leverage this library, import it in your Solidity contract and utilize its functions as per your requirements.
Please do your own comprehensive analysis and tests before using it!
