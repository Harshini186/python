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
        v=[0]*numCourses
        pv=[0]*numCourses
        graph=defaultdict(list)
        for c,d in prerequisites:
            graph[d].append(c)
        res=[]
        def dfs(node):
            v[node]=1
            pv[node]=1
            for nei in graph[node]:
                if v[nei]==0:
                      if dfs(nei):
                          return True
                elif pv[nei]==1:
                    return True
            res.append(node)
            pv[node]=0
            return False
        for i in range(numCourses):
            if v[i]==0:
                if dfs(i):
                    return []
        return res[::-1]