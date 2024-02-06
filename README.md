# LinkedList

This library is a little implementation of linked lists.
There are two main type of lists implemented singly and doubly linked.

In both implementation there are five type of lists, CheapLinkedList, LinkedList, MapOfLinkedList, ListOfLinkedList, MultiPointedListOfLinkedList.

In the CheapLinkedList implementation we have the essential, LinkedList are easier to use, MapOfLinkedList can be used if we want a list (or array) of lists.

ATTENTION!! Do not use the 0x0 information, it is used as null in the list.
N.B in EVM the 0x0 address do not exist;

## Type of memorization
It is not possibile to memorize two times the same information in these lists. 
if we are not sure that the information is unique, we should memorize pointers. (Addresses are unique)

For example, if we want to memorize a struct we should create a mapping (```mapping(bytes32 => SimpleStruct) public data;```) and then memorize the reference.

This can be done also with an array, if you want to make things simple.

## Doubly Linked
Doubly linked lists are the easiest to understand.
Them main methods of every list are _push and _remove.

```shell
function _push(bytes32 element)
function _remove(bytes32 element)
```
- With the _push we can add an element to the top of the list.
- With the _remove function we can _remove an element.
 
If we use the LinkedList and not the CheapLinkedList, we also have the number of element in the list.

The LinkedList also has the method ```getListAsArray()``` usefull if we want get the elements in our list.



## Singly Linked
In this implementation we also have the _push and _remove methods, but there is not check if the element was previously _pushed into the list. THis does not mean that _pushing the same element should be done, this means that the check need to be done off chain. The ```isListed(bytes32 element)``` can be used for the verification off chain.

```shell
function _push(bytes32 element)
function _remove(bytes32 previous)
```
The function _remove have a different scope. It do not _remove the element passed to the function. This function delete the following (or next) element.

There is a function, to get the previous element, of the element that we want to _remove, ```function getPrevious(bytes32 element)```.

## MapOfLinkedList
There is also an implementation of list mapped. Each sinlgy and doubly listed are implemented.

```shell
function _push(bytes32 index, bytes32 element)
function _remove(bytes32 index, bytes32 element)
```

The index rappresent the mapping. Before be able to insert data into an index it must be registered by using ```function registerIndex(bytes32 index)```

## ListOfLinkedList
In this type we have a list that contain the first element of every other list.

```shell
function _push(bytes32 index, bytes32 element)
function _remove(bytes32 index, bytes32 element)
```

This type is more advanced that the MapOfLinkedList. In MapOfLinkedList you cannot retrive the list of indexes, in the ListOfLinkedList type you can.
There is also a usefull function to read the structure called ```getStructureAsArray()```. This function return an array of array that rappresent the list of list

## MultiPointedListOfLinkedList
This type is the most complex. In this type we have two ListOfLinkedList. 

```shell
function _push(bytes32 index, bytes32 element)
function _remove(bytes32 index, bytes32 element)
```

In this type you can retrive which indexes contain a certain element.
Ex:
index 1 = 5->8->4->3
index 2 = 4->6->7->9
index 3 = 11->12->8->13

We can retrive which indexes have the element 8, the result will be 1->3.

This is possibile by accessing the ```listOfSecondIndex```, more specifically ```listOfSecondIndex.mapOfList(index).getListAsArray()```.

# Type Of List
There are three type of lists:
- CheapLinkedList
- LinkedList
- MapOfLinkedList
- ListOfLinkedList
- MultiPointedListOfLinkedList

CheapLinkedList have the essential ```_push() _remove() isListed()```.

LinkedList have the ```getListAsArray()``` and the ```numberOfElement```.

MapOfLinkedList have the list organized by ```index```.

ListOfLinkedList can return the entire structure  by using ```getStructureAsArray()```. This because it store the indexes in a list.

In MultiPointedListOfLinkedList the index are also pointed by a list. In this way we have a list of indexes called ```listOfSecondIndex```.

Functions that returns arrays use pagination! See the implementation for further details.

## Class
With a class we intend a contract that can be easily declared as variabile into another contract.
We used the classes to create complex type of lists. 

In case you need this type of structure, I suggest you to see the implementation.

Class access is reserved by using the ownable feature.

# Tips
I personally suggest to use LinkedList or MapOfLinkedList, they can solve pretty much every problem. CheapLinkedList can be used if we only want to store the information on the blockchain, bu we need to have a good backend to hadle the information.

## Example

```shell
contract Example is
    UUPSUpgradeable,
    MultiPointedListOfLinkedList
{
    // the version of the sc
    uint256 public version;

    struct data 
    { 
        uint x;
        bytes32 y;
        address z;
    }

    data[] public storing;

    function initialize() public initializer {
        __MultiPointedListOfLinkedListClass_init();
        // deleting the index 0 because it is not supported
        storing.push(data(0, bytes32(0), address(0)));
    }

    // PUBLIC
    function push(bytes32 index, uint x, bytes32 y, address z) public {
        // 0x0 element is ko
        bytes32 ref = bytes32(storing.length);
        storing.push(data(x, y, z));
        _push(index, ref);
    }

    function remove(bytes32 index, uint256 ref) public {
        _remove(index, bytes32(ref));
    }

    function register(bytes32 index) external {
        if (!listOfIndex.isListed(index)) 
            _registerIndex(index);
        if (!listOfSecondIndex.listOfIndex().isListed(index)) 
            listOfSecondIndex.registerIndex(index);
    }

    function _authorizeUpgrade(
        address newImplementation
    ) internal override {
        version++;
    }
}
```