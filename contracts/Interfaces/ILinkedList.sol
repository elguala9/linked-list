// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.17;
import "./ICheapLinkedList.sol";


// the list is a FIFO for permormance problem
interface ILinkedList is ICheapLinkedList{
    // READ
    // return the list as an array
    function getListAsArray(uint256 page, uint256 pageSize) external returns(bytes32[] memory);
}