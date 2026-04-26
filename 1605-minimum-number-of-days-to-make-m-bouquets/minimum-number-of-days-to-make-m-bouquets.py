class Solution:
    def minDays(self, bloomDay: List[int], m: int, k: int) -> int:
        if m * k > len(bloomDay):
            return -1
        low=min(bloomDay)
        high=max(bloomDay)
        while(low<=high):
            mid=(low+high)//2
            no_of_flowers=0
            no_of_bouquets=0
            for num in bloomDay:
                if num<=mid:
                    no_of_flowers+=1
                    if no_of_flowers==k:
                        no_of_bouquets+=1
                        no_of_flowers=0
                else:
                    no_of_flowers=0
            if no_of_bouquets>=m:
                high=mid-1
            else:
                low=mid+1
        no_of_flowers = 0
        no_of_bouquets = 0
        for num in bloomDay:
            if num <= low:
                no_of_flowers += 1
                if no_of_flowers == k:
                    no_of_bouquets += 1
                    no_of_flowers = 0
            else:
                no_of_flowers = 0
        
        return low if no_of_bouquets>=m else -1