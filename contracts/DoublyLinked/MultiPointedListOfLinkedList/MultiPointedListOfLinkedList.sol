// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.17;
import "../ListOfLinkedList/ListOfLinkedListClass.sol";
import "../LinkedList/LinkedList.sol";

//0x0000000000000000000000000000000000000000000000000000000000000001

contract MultiPointedListOfLinkedList is ListOfLinkedList {
    // second pointer 
    ListOfLinkedListClass public listOfSecondIndex;

    // MANDATORY TO BE CALLED
    function __MultiPointedListOfLinkedListClass_init() internal virtual{
        super.__ListOfLinkedList_init();
        listOfSecondIndex = new ListOfLinkedListClass();
        listOfSecondIndex.ListOfLinkedList_init();
    }

    function _push(bytes32 index, bytes32 element) internal override virtual{
        mapOfList[index].push(element);
        listOfSecondIndex.push(element, index);
    }

    function _remove(bytes32 index, bytes32 element) internal override virtual{
        mapOfList[index].remove(element);
        listOfSecondIndex.remove(element, index);
    }
}
