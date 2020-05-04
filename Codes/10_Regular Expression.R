#####################################################################################
#####################################################################################
####### Quantifiers: Quantifiers specify how many repetitions of the pattern.  ######
#####################################################################################
#####################################################################################
strings <- c("a", "ab", "acb", "accb", "acccb", "accccb", "akcccb")

######## Search any value having letter a
grep("a", c("abc", "def", "cba a", "aa"),perl=TRUE, value=FALSE)
grep("a", c("ABC", "def", "cba a", "aa"),value=FALSE,ignore.case = T)
grep("a", c("ABC", "def", "cba a", "aa"),value=FALSE,ignore.case = F)
grep("a", c("abc", "def", "cba a", "aa"), perl=TRUE, value=TRUE)

####### The preceding item will be matched zero or more times.
grep("ac*b", strings, value = TRUE) 

####### The preceding item will be matched one or more times.
grep("ac+b", strings, value = TRUE)

####### The preceding item is optional and will be matched at most once.
grep("ac?b", strings, value = TRUE)

####### The preceding item is matched exactly n times.
grep("ac{2}b", strings, value = TRUE)

####### The preceding item is matched n or more times.
grep("ac{2,}b", strings, value = TRUE)

####### The preceding item is matched at least n times, but not more than m times.
grep("ac{2,3}b", strings, value = TRUE)

#####################################################################################
#####################################################################################
###################### Position of Pattern Within A String  #########################
#####################################################################################
#####################################################################################
strings <- c("abcd", "cdab", "cabd", "c abd", "c ab bd", "cab d")

######## Matches the sub-string at the start of the string
grep("^ab", strings, value = TRUE)

######## Matches the sub-string at the end of the string
grep("ab$", strings, value = TRUE)

######## matches the empty string at either edge of a word.
grep("\\bab", strings, value = TRUE)

######## matches the empty string provided it is not at an edge of a word.
grep("\\Bab", strings, value = TRUE)

strings <- c("^ab", "ab", "abc", "abd", "abe", "ab 12")
strings
grep("ab.", strings, value = TRUE)
grep("ab[c-e]", strings, value = TRUE)
grep("ab[^c]", strings, value = TRUE)
grep("^ab", strings, value = TRUE)
grep("\\^ab", strings, value = TRUE)
grep("abc|abd", strings, value = TRUE)
gsub("(ab) 12", "\\1 34", strings)

grep("a", c("abc", "def", "cba a", "aa"),perl=TRUE, value=FALSE)
grep("a", c("ABC", "def", "cba a", "aa"),value=FALSE,ignore.case = T)
grep("a", c("ABC", "def", "cba a", "aa"),value=FALSE,ignore.case = F)
grep("a", c("abc", "def", "cba a", "aa"), perl=TRUE, value=TRUE)


grepl("a", c("abc", "def", "cba a", "aa"), perl=TRUE)


regexpr("a", c("abc", "def", "cba a", "aa"), perl=TRUE)
gregexpr("a", c("abc", "def", "cba a", "aa"), perl=TRUE)

regexpr("a*b", c("abc", "def", "cba a", "aa"), perl=TRUE)


# Special characters

grep("a*b",c("ab","ba","bb","aab"))
grep("a+b",c("ab","ba","bb","aab"))
grep("a?b",c("ab","ba","bb","aab"))

gsub("a*b","x",c("ab","ba","bb","aab"))
gsub("a+b","x",c("ab","ba","bb","aab"))
gsub("a?b","x",c("ab","ba","bb","aab"))

grep(".line",c("bline","cline","yline","z line"))
gsub(".line","x",c("bline","cline","yline","z line"))

grep("[w]",c("www","WWW","www.zzz","WWW.zzz"))
gsub("[w]","x",c("www","WWW","www.zzz","WWW.zzz"))

grep("[wW]",c("www","WWW","www.zzz","WWW.zzz"))
gsub("[wW]","x",c("www","WWW","www.zzz","WWW.zzz"))

grep("^The",c("The INC","INC is the","THE PM","He is the PM"))
gsub("^The","Z",c("The INC","INC is the","THE PM","He is the PM"))

grep("[^The]",c("The INC","INC is the","THE PM","He is the PM"))
gsub("[^The]","Z",c("The INC","INC is the","THE PM","He is the PM"))

grep("[^(The)]",c("The INC","INC is the","THE PM","He is the PM"))
gsub("[^(the)]","Z",c("The INC","INC is the","THE PM","He is the PM"))

grep("[(hello)^]",c("hello ^","^ hi how are you","Hello I am fine ^^^"))
gsub("[(hello)]","x",c("hello ^","^ hi how are you","Hello I am fine ^^^"))

gsub("hello","x",c("hello ^","^ hi how are you","Hello I am fine ^^^"))
gsub("[("hello")]","x",c("hello ^","^ hi how are you","Hello I am fine ^^^"))

grep("[^]",c("hello this ^ +","hi ^^"))
grep("[\\^]",c("hello this ^ +","hi ^^"))
grep("[a\\^]",c("hello this a ^ +","hi ^^"))


gsub("a\\.{2}","abc",c("a..b","a....b","a..c","a.bcd"))
gsub("a.{2}","abc",c("a..b","a....b","a..c","a.bcd"))
gsub("a..","abc",c("a..b","a....b","a..c","a.bcd"))



gsub("[a\\^\\+]","x",c("hello this a ^ +","hi ^^"))


gsub("[+]","x",c("hello this is +","hi +++"))
gsub("[(hello)]","x",c("hello ^","^ hi how are you","Hello I am fine ^^^"))

