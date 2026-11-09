class Solution:
    def longestCommonPrefix(self, strs: list[str]) -> str:
        prefix = strs[0]
        for i in range(1, len(strs)):
            while strs[i].find(prefix) != 0:
                prefix = prefix[:-1]
                if prefix == "":
                    return ""
        return prefix