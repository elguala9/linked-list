// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.17;


interface ILinkedListClass {
    // init to call
    function LinkedListClass_init() external;
    // push an elment into the list
    function push(bytes32 element) external;
    // remove an element from the list
    function remove(bytes32 element) external;
}