// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.17;
import "../../Constant/ListConst.sol";
//0x0000000000000000000000000000000000000000000000000000000000000001



contract SinglyListHandler is ListConst{

    bytes32 public head;
    mapping(bytes32 => bytes32) public list; 

    function _push(bytes32 element) internal virtual {
        require(element != BYTES32_0x0, "0x0 not accepted"); 
        list[element] = head;
        head = element;
    }

    function _remove(bytes32 previous) internal virtual {
        // the element need to have a next
        bytes32 elementTo_remove;
        if(previous == BYTES32_0x0){
            elementTo_remove = head;
            head = list[head];
        }
        else{
            require(list[previous] != BYTES32_0x0, "No next element found");
            elementTo_remove = list[previous];
            list[previous] = list[elementTo_remove];   
        }
        // cleaning is necessary to avoid trigger the require in the _push
        list[elementTo_remove] = BYTES32_0x0;
    }
}