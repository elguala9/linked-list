// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.17;


interface IMultiPointedListOfLinkedListClass {
    function MultiPointedListOfLinkedListClass_init() external;
    function push(bytes32 index, bytes32 element) external;
    function remove(bytes32 index, bytes32 element) external;
}