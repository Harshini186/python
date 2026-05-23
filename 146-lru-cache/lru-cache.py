class Node:
    def __init__(self,key=-1,value=-1):
        self.prev=None
        self.key=key
        self.value=value
        self.next=None
class LRUCache:
    def __init__(self, capacity: int):
        self.head=Node()
        self.tail=Node()
        self.head.next=self.tail
        self.tail.prev=self.head
        self.capacity=capacity
        self.d={}
    def addAfterHead(self,node):
        nextNode=self.head.next
        self.head.next=node
        node.prev=self.head
        node.next=nextNode
        nextNode.prev=node
    def deleteNode(self,node):
        prevNode=node.prev
        nextNode=node.next
        prevNode.next=nextNode
        nextNode.prev=prevNode
        node.prev=None
        node.next=None
    def get(self, key: int) -> int:
        if(key in self.d):
            node=self.d[key]
            self.deleteNode(node)
            self.addAfterHead(node)
            return node.value
        else:
            return -1
    def put(self, key: int, value: int) -> None:
        if(key in self.d):
            node=self.d[key]
            node.value=value
            self.deleteNode(node)
            self.addAfterHead(node)
            return
        if(len(self.d)==self.capacity):
            node=self.tail.prev
            self.deleteNode(node)
            del self.d[node.key]
        node=Node(key,value)
        self.addAfterHead(node)
        self.d[key]=node
