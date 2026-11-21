class Solution:
    def numIslands(self, grid: List[List[str]]) -> int:
        def dfs(i,j,vis,grid,n,m):
            for r,c in [[-1,0],[1,0],[0,-1],[0,1]]:
                nr=i+r
                nc=j+c
                if(nr>=0 and nr<n and nc>=0 and nc<m and grid[nr][nc]=="1" and vis[nr][nc]==0):
                    vis[nr][nc]=1
                    dfs(nr,nc,vis,grid,n,m)
        n=len(grid) 
        m=len(grid[0])
        vis=[]
        for i in range(n):
            lst=[0]*m
            vis.append(lst)
        c=0
        for i in range(n):
            for j in range(m):
                if(grid[i][j]=="1" and vis[i][j]==0):
                    vis[i][j]=1
                    dfs(i,j,vis,grid,n,m)
                    c+=1
        return c