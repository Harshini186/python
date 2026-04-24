class Solution:
    def longestKSubstr(self, s, k):
        # code here
        freq={}
        left=0
        ml=-1
        n=len(s)
        for r in range(n):
            if s[r] in freq:
                freq[s[r]]+=1
            else:
                freq[s[r]]=1
            while len(freq)>k:
                freq[s[left]]-=1
                if freq[s[left]]==0:
                    del freq[s[left]]
                left+=1
            if len(freq)==k:
                ml=max(ml,r-left+1)
        return ml
        
        