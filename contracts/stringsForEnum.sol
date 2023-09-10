// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.8;

/**
 * @title StringEnum
 * @dev A library for handling enumerated types (enums) with string values.
 */

library StringsForEnum {

    /**
     * @dev Struct to store the enumToString mapping.
    */

    struct EnumData {
        mapping(uint8 => string) enumToString;
    }

    /**
     * @dev Error thrown when an invalid enum value is encountered.
     * @param enumValue The invalid enum value.
     */

    error NotValidEnumValue(uint8 enumValue);


    /**
     * @dev Function to get a struct storage pointer.
    */

    function getEnumDataPointer() internal pure returns (EnumData storage enumData) {
        assembly {
            enumData.slot := 0
        }
    }

    /**
     * @dev Function to retrieve the string representation of an enum value from mapping.
     * @param value The enum value to convert to a string.
     * @return The string representation of the enum value.
    */

    function getFromMapping(uint8 value)internal view returns (string memory){
        EnumData storage self = getEnumDataPointer();
        return self.enumToString[value];
    }

    /**
     * @dev Function to check if an enum value is valid.
     * @param value The enum value to check for validity.
     * @return True if the enum value is valid ie string is not empty, otherwise false.
    */

    function isValidEnumValue(uint8 value) internal view returns (bool){
        return bytes(getFromMapping(value)).length>0;
    }

    /**
     * @dev Function to convert an enum value to its corresponding string representation.
     * @param value The enum value to convert.
     * @return The string representation of the enum value.
     * @notice throws NotValidEnumValue error if the enum value is not valid.
    */

    function toString(uint8 value) internal view returns (string memory) {
       if(isValidEnumValue(value)==true){
           return getFromMapping(value);
       }else{
           revert NotValidEnumValue({enumValue:value});
       }
    }

    /**
     * @dev Function to return an enum value along with its string representation.
     * @param value The enum value to convert.
     * @return A tuple containing the enum value and its string representation.
     * @notice throws NotValidEnumValue error if the enum value is not valid.
    */

    function toIntWithString(uint8 value) internal view returns (uint8, string memory){
        return (value,toString(value));
    }

}
