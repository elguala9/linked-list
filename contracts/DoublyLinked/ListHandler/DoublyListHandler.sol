// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.17;
import "../../Constant/ListConst.sol";
import "../../SinglyLinked/ListHandler/SinglyListHandler.sol";
//0x0000000000000000000000000000000000000000000000000000000000000001



contract DoublyListHandler is ListConst, SinglyListHandler{

    mapping(bytes32 => bytes32) public revertedList;

    function _push(bytes32 element) internal virtual override {
        require(!_isListed(element), "Already in the list");
        revertedList[head] = element;
        super._push(element);
    }

    function _remove(bytes32 element) internal virtual override {
        require(_isListed(element), "Not in the list");
        bytes32 previous = revertedList[element];
        revertedList[list[element]] = revertedList[element];
        //cleaning
        revertedList[element] = BYTES32_0x0;
        super._remove(previous);
        
    }

    function _isListed(bytes32 element) internal view returns(bool){
        return (revertedList[element] != BYTES32_0x0 || list[element] != BYTES32_0x0 || head == element);
    }
}