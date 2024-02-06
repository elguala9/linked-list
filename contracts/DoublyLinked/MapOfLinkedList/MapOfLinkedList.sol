// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.17;
import "../LinkedList/LinkedListClass.sol";
//0x0000000000000000000000000000000000000000000000000000000000000001



contract MapOfLinkedList {
    
    mapping(bytes32 => LinkedListClass) public mapOfList;

    function _registerIndex(bytes32 index) internal virtual{
        mapOfList[index] = new LinkedListClass();
        mapOfList[index].LinkedListClass_init();
    }

    function _deleteIndex(bytes32 index) internal virtual{
        delete mapOfList[index];
    }

    function _push(bytes32 index, bytes32 element) internal virtual{
        mapOfList[index].push(element);
    }

    function _remove(bytes32 index, bytes32 element) internal virtual{
        mapOfList[index].remove(element);
    }
}