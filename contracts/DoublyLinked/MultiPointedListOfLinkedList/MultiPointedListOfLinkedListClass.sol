// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.17;
import "../../Interfaces/Classes/IMultiPointedListOfLinkedListClass.sol";
import "./MultiPointedListOfLinkedList.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
//0x0000000000000000000000000000000000000000000000000000000000000001

contract MultiPointedListOfLinkedListClass is
    MultiPointedListOfLinkedList,
    IMultiPointedListOfLinkedListClass,
    Initializable,
    OwnableUpgradeable 
{
    function MultiPointedListOfLinkedListClass_init() public override initializer {
        super.__MultiPointedListOfLinkedListClass_init();
        super.__Ownable_init();
    }

    function push(bytes32 index, bytes32 element) public override virtual onlyOwner{
        super._push(index, element);
    }

    function remove(bytes32 index, bytes32 element) public override virtual onlyOwner{
        super._remove(index, element);
    }
}
