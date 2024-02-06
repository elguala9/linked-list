// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.17;
import "./ListOfLinkedList.sol";
import "../../Interfaces/Classes/IListOfLinkedListClass.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

//0x0000000000000000000000000000000000000000000000000000000000000001

contract ListOfLinkedListClass is
    ListOfLinkedList,
    IListOfLinkedListClass,
    Initializable,
    OwnableUpgradeable
{
    function ListOfLinkedList_init() public virtual override initializer{
        super.__ListOfLinkedList_init();
        super.__Ownable_init();
    }

    function registerIndex(bytes32 index) public virtual override onlyOwner{
        _registerIndex(index);
    }

    function push(bytes32 index, bytes32 element) public virtual override onlyOwner{
        if (!listOfIndex.isListed(index)) 
            _registerIndex(index);
        mapOfList[index].push(element);
    }

    function remove(bytes32 index, bytes32 element) public virtual override onlyOwner{
        mapOfList[index].remove(element);
    }

    function softDeleteIndex(bytes32 index) public virtual override onlyOwner{
        _softDeleteIndex(index);
    }

    function deleteIndex(bytes32 index) public virtual override onlyOwner{
        _deleteIndex(index);
    }

    // delete the index only when it is empty
    function safeDeleteIndex(
        bytes32 index
    ) public virtual override onlyOwner returns (bool) {
        return _safeDeleteIndex(index);
    }
}
