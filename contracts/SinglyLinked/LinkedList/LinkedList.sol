// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.17;
import "../../Interfaces/ILinkedList.sol";
import "../CheapLinkedList/CheapLinkedList.sol";
import "../../Utility/LinkedListUtility.sol";

//0x0000000000000000000000000000000000000000000000000000000000000001



contract LinkedList is CheapLinkedList, LinkedListUtility, ILinkedList {
    // take trace of the number of element
    uint256 public numberOfElement;

    function _push(bytes32 element) internal override {
        super._push(element);
        // update the number of element
        ++numberOfElement;
    }

    function _remove(bytes32 previous) internal override {
        super._remove(previous);
        // update the number of element
        --numberOfElement;
    }

    function getListAsArray(uint256 page, uint256 pageSize)
        external
        view
        override
        returns (bytes32[] memory)
    {
        return super._getListAsArray(list, head, numberOfElement, page, pageSize);
    }
}