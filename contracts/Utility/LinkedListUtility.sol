// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.17;
import "../Constant/ListConst.sol";
//0x0000000000000000000000000000000000000000000000000000000000000001

// the two utility are separated to make contracts light

// contract used to avoid duplicated source code
contract LinkedListPaginationUtility{
    // get the indexes for pagination
    function getPaginationIndexes(uint256 page, uint256 pageSize, uint256 numberOfElement) internal pure returns(uint256, uint256, uint256){
        uint256 startIndex = page * pageSize;
        uint256 endIndex = startIndex + pageSize;
        uint256 arraySize = pageSize;
        if(endIndex > numberOfElement)
            arraySize = arraySize - (endIndex - numberOfElement);
        return (startIndex, endIndex, arraySize);
    }
}

// contract used to avoid duplicated source code
contract LinkedListUtility is ListConst, LinkedListPaginationUtility{
    // transform a list in an array
    function _getListAsArray(mapping(bytes32 => bytes32) storage list, bytes32 head, uint256 numberOfElement, uint256 page, uint256 pageSize) internal view returns (bytes32[] memory) {
        bytes32 current = head;
        (uint256 startIndex, uint256 endIndex, uint256 arraySize) = getPaginationIndexes(page, pageSize, numberOfElement);
        bytes32[] memory data = new bytes32[](arraySize);
        // the list is empty, no need for further operations
        if(numberOfElement == 0)
            return data;
        uint256 arrayIndex = 0;
        uint256 listIndex = 0;
        //data[index++] = current;
        //current = list[current];
        while(current != BYTES32_0x0){
            // if I have passed the interested page I quit 
            if(listIndex >= endIndex)
                break;
            // if I am in the good page i memorize the current
            if(listIndex >= startIndex)
                data[arrayIndex++] = current;
            // go to the next
            current = list[current];
            ++listIndex;
        }
        return data;
    }
}

