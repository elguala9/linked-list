// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.17;
import "../../Interfaces/ICheapLinkedList.sol";
import "../ListHandler/DoublyListHandler.sol";
//0x0000000000000000000000000000000000000000000000000000000000000001



contract CheapLinkedList is ICheapLinkedList, DoublyListHandler {

    function _push(bytes32 element) internal virtual override {
        super._push(element);
    }

    function _remove(bytes32 element) internal virtual override {
        super._remove(element);
    }

    function getPrevious(
        bytes32 element
    ) view public override returns (bytes32 previous) {
        require(isListed(element), "Not found");
        return revertedList[element];
    }

    function isListed(bytes32 element) view public override returns(bool){
        return _isListed(element);
    }
}