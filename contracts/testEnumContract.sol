// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.8;
import "./stringsForEnum.sol";

contract TestEnumContract {
    using StringsForEnum for uint8;

    enum ActionChoices { GoLeft, GoRight, GoStraight, SitStill }

    ActionChoices choice;
    ActionChoices constant defaultChoice = ActionChoices.GoStraight;

    constructor() {
        //writing to right slot
        StringsForEnum.EnumData storage enumData = StringsForEnum.getEnumDataPointer();
        enumData.enumToString[uint8(ActionChoices.GoLeft)] = "GoLeft";
        enumData.enumToString[uint8(ActionChoices.GoRight)] = "GoRight";
        enumData.enumToString[uint8(ActionChoices.GoStraight)] = "GoStraight";
        enumData.enumToString[uint8(ActionChoices.SitStill)] = "SitStill";
        // also possible to do it in pretty way, but very costly
        // uint8(ActionChoices.GoLeft).setString("GoLeft");

    }

    function setGoStraight() public {
        choice = ActionChoices.GoStraight;
    }

    function resetChoice() public {
        delete choice;
    }

    function getDefaultChoiceStr() public view returns (string memory){
        return uint8(defaultChoice).toString();
    }


    function getDefaultChoiceIntWithStr() public view returns (uint8,string memory){
        return uint8(defaultChoice).toIntWithString();
    }


    function getNotValidEnum(uint8 notValidEnumValue) public view returns(string memory){
        return notValidEnumValue.toString();
    }


    function getChoiceStr() public view returns (string memory){
        return uint8(choice).toString();
    }

    function getChoice() public view returns (ActionChoices){
        return choice;
    }

    function getLargestValueStr() public view returns (string memory) {
        return uint8(type(ActionChoices).max).toString();
    }

    function getSmallestValueStr() public view returns (string memory) {
        return uint8(type(ActionChoices).min).toString();
    }

}
