// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.17;
import "../../Interfaces/ICheapLinkedList.sol";
import "../ListHandler/SinglyListHandler.sol";
//0x0000000000000000000000000000000000000000000000000000000000000001



contract CheapLinkedList is ICheapLinkedList, SinglyListHandler {

    

    function _push(bytes32 element) internal virtual override{
        super._push(element);
    }

    function _remove(bytes32 previous) internal virtual override{
        super._remove(previous);
    }

    // I need the bool flag as return because in Solidity there is not a NULL value
    function _getPrevious(bytes32 element) view internal returns(bytes32, bool){
        bytes32 previous = BYTES32_0x0;
        bytes32 current = head;
        while(current != BYTES32_0x0){
            if(current == element)
                return (previous, true);
            previous = current;
            // go to the next element
            current = list[current];
        }
        // I did not find the previous
        return (BYTES32_0x0, false);
    }

    function getPrevious(bytes32 element) view public override returns(bytes32){
        
        (bytes32 previous, bool found) = _getPrevious(element);
        require(found, "Not found"); 
        // DUMMY RETURN TO SILENCE WARNING
        return previous;
    } 

    function isListed(bytes32 element) view public override returns(bool){
        // an element exist if it is the head or if it have a previous
        (, bool found) = _getPrevious(element);
        if(found)
            return true;
        if(element == head)
            return true;
        return false;
    }
}