// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.17;


interface IListOfLinkedListClass {
    // init the smart cotract
    function ListOfLinkedList_init() external;
    // push an element into the list
    function push(bytes32 index, bytes32 element) external;
    // remove an element from the list
    function remove(bytes32 index, bytes32 element) external;
    // BEFORE using an index, it is necessary to register it
    function registerIndex(bytes32 index) external;
    
    //-----------------------------------------------------------------------------
    // for the deletes, see the implementation
    function softDeleteIndex(bytes32 index) external;
    function deleteIndex(bytes32 index) external;
    function safeDeleteIndex(bytes32 index) external returns(bool);
}