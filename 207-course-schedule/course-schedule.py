class Solution:
    def canFinish(self, numCourses: int, prerequisites: List[List[int]]) -> bool:
        graph=defaultdict(list)
        ind=[0]*numCourses
        for course,dest in prerequisites:
            graph[dest].append(course)
            ind[course]+=1
        q=[]
        for i in range(numCourses):
            if ind[i]==0:
                q.append(i)
        finish=0
        while q:
            node=q.pop(0)
            finish+=1
            for nei in graph[node]:
                ind[nei]-=1
                if ind[nei]==0:
                    q.append(nei)
        return finish==numCourses