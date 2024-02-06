// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.17;
import "../../Interfaces/IListOfLinkedList.sol";
import "../MapOfLinkedList/MapOfLinkedList.sol";
import "../LinkedList/LinkedList.sol";
import "../../Utility/LinkedListUtility.sol";

//0x0000000000000000000000000000000000000000000000000000000000000001

contract ListOfLinkedList is MapOfLinkedList, IListOfLinkedList, LinkedListPaginationUtility {
    LinkedListClass public listOfIndex;

    // MANDATORY TO BE CALLED
    function __ListOfLinkedList_init() internal virtual {
        listOfIndex = new LinkedListClass();
        listOfIndex.LinkedListClass_init();
    }

    function _registerIndex(
        bytes32 index
    ) internal virtual override {
        listOfIndex.push(index);
        super._registerIndex(index);
    }

    // if I only want to delete it in the list
    function _softDeleteIndex(bytes32 index) internal virtual{
        listOfIndex.remove(index);
    }

    function _deleteIndex(bytes32 index) internal override virtual{
        _softDeleteIndex(index);
        super._deleteIndex(index);
    }

    // delete the index only when it is empty
    function _safeDeleteIndex(bytes32 index) internal virtual returns(bool){
        if(listOfIndex.numberOfElement() == 0){
            _deleteIndex(index);
            return true;
        }
        return false;
    }

    // READ
    function getStructureAsArray(uint256 page, uint256 pageSize, uint256 secondaryPage, uint256 secondarypageSize)
        external
        view
        returns (bytes32[][] memory){
        (uint256 startIndex, uint256 endIndex, uint256 arraySize) = getPaginationIndexes(page, pageSize, listOfIndex.numberOfElement());
        bytes32[][] memory structure = new bytes32[][](arraySize);
        bytes32[] memory indexMapOfList = listOfIndex.getListAsArray(page, pageSize);
        for(uint256 i; i<indexMapOfList.length; ++i){
            structure[i] = mapOfList[indexMapOfList[i]].getListAsArray(secondaryPage, secondarypageSize);
        }

        return structure;
    }
}
