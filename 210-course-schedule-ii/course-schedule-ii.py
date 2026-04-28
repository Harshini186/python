class Solution:
    def findOrder(self, numCourses: int, prerequisites: List[List[int]]) -> List[int]:
        # BFS approach
        '''
        graph=defaultdict(list)
        ind=[0]*numCourses
        for course,prereq in prerequisites:
            graph[prereq].append(course)
            ind[course]+=1
        q=[]
        for i in range(numCourses):
            if ind[i]==0:
                q.append(i)
        finish=[]
        while q:
            node=q.pop(0)
            finish.append(node)
            for nei in graph[node]:
                ind[nei]-=1
                if ind[nei]==0:
                    q.append(nei)
        return finish if len(finish) == numCourses else [] '''
        # DFS approach 
        graph = defaultdict(list)
        for course, prereq in prerequisites:
            graph[prereq].append(course)
        visited = [0] * numCourses 
        res = []
        def dfs(node):
            visited[node] = 1 
            for nei in graph[node]:
                if visited[nei] == 0:
                    if dfs(nei):
                        return True  
                elif visited[nei] == 1:
                    return True         
            visited[node] = 2 
            res.append(node)
            return False 
        for i in range(numCourses):
            if visited[i] == 0:
                if dfs(i):
                    return []  
        return res[::-1]  