// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.17;

// the list is a FIFO for permormance problem
interface ICheapLinkedList{
    // get the previous element, this is needed to simlpify the _remove of an element
    function getPrevious(bytes32 element) view external returns(bytes32 previous);
    // return if the element is the list
    function isListed(bytes32 element) view external returns(bool);
}