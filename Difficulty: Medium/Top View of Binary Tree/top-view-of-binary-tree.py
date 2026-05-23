'''
class Node:
    def __init__(self, val):
        self.data = val
        self.left = None
        self.right = None
'''
from collections import deque
class Solution:
    def topView(self, root):
        if not root:
            return []
        q = deque([(0, root)])   
        d = {}                  
        while q:
            vertical, node = q.popleft()
            if node.left:
                q.append((vertical - 1, node.left))
            if node.right:
                q.append((vertical + 1, node.right))
            if vertical not in d:
                d[vertical] = node.data
        ans = []
        for key in sorted(d):
            ans.append(d[key])
        return ans