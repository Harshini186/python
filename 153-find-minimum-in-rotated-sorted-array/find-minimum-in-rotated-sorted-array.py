class Solution:
    def findMin(self, nums: List[int]) -> int:
        n=len(nums)
        ans=float("inf")
        low=0
        high=n-1
        while(low<=high):
            mid=(low+high)//2
            #left half
            if(nums[low]<=nums[mid]):
                if(nums[low]<ans):
                    ans=nums[low]
                low=mid+1
            #right half
            if(nums[mid]<=nums[high]):
                if(nums[mid]<ans):
                        ans=nums[mid]
                high=mid-1
        return ans 