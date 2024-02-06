// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.17;
import "./LinkedList.sol";
import "../../Interfaces/Classes/ILinkedListClass.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

//0x0000000000000000000000000000000000000000000000000000000000000001

contract LinkedListClass is
    LinkedList,
    ILinkedListClass,
    Initializable,
    OwnableUpgradeable
{
    function LinkedListClass_init() public virtual override initializer{
        super.__Ownable_init();
    }

    function push(bytes32 element) public override virtual onlyOwner{
        super._push(element);
    }

    function remove(bytes32 element) public override virtual onlyOwner{
        super._remove(element);
    }
}
