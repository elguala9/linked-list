// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.17;

// the list is a FIFO for permormance problem
interface IListOfLinkedList {
    // READ
    //  a bi-dimensional array that mimic the structure in the samrt contract
    function getStructureAsArray(uint256 page, uint256 pageSize, uint256 secondaryPage, uint256 secondarypageSize)
        external
        view
        returns (bytes32[][] memory);
}
