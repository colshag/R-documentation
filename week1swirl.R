##Subsetting Vectors
#To create a vector containing the numbers 1.1, 9, and 3.14
c(1.1, 9, 3.14)


##Workspace and Files
#List all the objects in your local workspace using ls()
#Determine which directory your R session is using as its current working directory using getwd()
#List all the files in your working directory using list.files() or dir()
#Create a file in your working directory called "mytest.R" 
file.create("mytest.R")
#Check to see if "mytest.R" exists
file.exists("mytest.R")
#Change the name of the file "mytest.R" to "mytest2.R"
file.rename("mytest.R","mytest2.R")
#Make a copy of "mytest2.R" called "mytest3.R"
file.copy("mytest2.R", "mytest3.R")
#You can use file.path to construct file and directory paths that are independent of the operating system
#your R code is running on. Pass 'folder1' and 'folder2' as arguments to file.path to make a
#platform-independent pathname.
file.path("folder1", "folder2")
[1] "folder1/folder2"
#Create a directory in the current working directory called "testdir2" and a subdirectory for it called
#"testdir3", all in one command by using dir.create() and file.path()
dir.create(file.path("testdir2", "testdir3"), recursive = TRUE)


##Sequences of Numbers
#a vector of numbers ranging from 0 to 10, incremented by 0.5. 
seq(0, 10, by=0.5)
#we don't care what the increment is and we just want a sequence of 30
#numbers between 5 and 10
my_seq <- seq(5, 10, length=30)
#my_seq has a length of 30
length(my_seq)
#creating a vector that contains 40 zeros
rep(0, times = 40)
#our vector to contain 10 repetitions of the vector (0, 1, 2)
rep(c(0, 1, 2), times = 10)
#vector to contain 10 zeros, then 10 ones, then 10 twos
 rep(c(0, 1, 2), each = 10)
#named elements, Create a numeric vector with three named elements
vect <- c(foo = 11, bar = 2, norf = NA)
vect
 foo  bar norf 
  11    2   NA 
# or we can assign names to a vector vect2 <- c(11, 2, NA)
names(vect2) <- c("foo", "bar", "norf")
#give us the second element of vect
vect["bar"]
bar 
  2
vect[c("foo", "bar")]
foo bar 
 11   2 


##Vectors
#Vectors come in two different flavors: atomic vectors and lists. An atomic vector
#contains exactly one data type, whereas a list may contain multiple data types
#Logical vectors can contain the values TRUE, FALSE, and NA
#create a variable called tf that gets the result of num_vect < 1, which is read
#| as 'num_vect is less than 1'
tf <- num_vect < 1
#my_char <- c("My", "name", "is")
#join the elements of my_char together into one continuous character string
paste(my_char, collapse = " ")
[1] "My name is"
#Tack your name on to the end of the my_char vector using the c() function
my_name <- c(my_char, "Chris")
[1] "My"    "name"  "is"    "Chris"
#join two character vectors that are each of length 1
paste("Hello", "world!", sep = " ")
[1] "Hello world!"
#join two vectors, each of length 3. Use paste() to join the integer vector 1:3
# with the character vector c("X", "Y", "Z")
paste(1:3, c("X", "Y", "Z"), sep = "")
[1] "1X" "2Y" "3Z"
paste(LETTERS, 1:4, sep = "-")
 [1] "A-1" "B-2" "C-3" "D-4" "E-1" "F-2" "G-3" "H-4" "I-1" "J-2" "K-3" "L-4" "M-1" "N-2"
[15] "O-3" "P-4" "Q-1" "R-2" "S-3" "T-4" "U-1" "V-2" "W-3" "X-4" "Y-1" "Z-2"


##Missing Values
#create a vector containing 1000 draws from a standard normal distribution
y <- rnorm(1000)
#create a vector containing 1000 NAs
z <- rep(NA, 1000)
#select 100 elements at random from these 2000 values (combining y and z)
my_data <- sample(c(y, z), 100)
#The is.na() function tells us whether each element of a vector is NA
my_na <- is.na(my_data)
my_na
[1]  TRUE  TRUE FALSE  TRUE FALSE  TRUE  TRUE FALSE FALSE ...


##Subsetting Vectors
 x
 [1]          NA          NA  0.50413401 -0.25828872  0.72945723          NA -1.09190714
 [8]  1.33190807  0.08093821  0.58544563 -0.52099523 -0.52386985          NA  0.09214341
[15] -2.74186555  1.82687332 -0.84607238 -1.55041721          NA          NA          NA
[22] -1.12503791          NA          NA -0.06320191 -0.60756886          NA          NA
[29]          NA -2.30346937          NA  1.63214949          NA          NA          NA
[36]          NA -2.02826592          NA          NA          NA

# to view the first ten elements of x
x[1:10]
#A vector of all NAs
x[is.na(x)]
#create a vector called y that contains all of the non-NA values from x
y <- x[!is.na(x)]
# A vector of all the positive elements of y
y[y > 0]
x[!is.na(x) & x > 0]
[1] 0.50413401 0.72945723 1.33190807 0.08093821 0.58544563 0.09214341 1.82687332
[8] 1.63214949
# subset the 3rd, 5th, and 7th elements of x
x[c(3, 5, 7)]
[1]  0.5041340  0.7294572 -1.0919071
#You should always make sure that what you are asking for is within
# the bounds of the vector you're working with.
x[3000]
[1] NA
x[0]
numeric(0)
#all elements of x EXCEPT the 2nd and 10th
x[c(-2, -10)]


##Matrices and Data Frames
#matrices can only contain a single class
# of data, while data frames can consist of many different classes of data
my_vector <- 1:20
dim(my_vector) <- c(4, 5)
my_vector
     [,1] [,2] [,3] [,4] [,5]
[1,]    1    5    9   13   17
[2,]    2    6   10   14   18
[3,]    3    7   11   15   19
[4,]    4    8   12   16   20
class(my_vector)
[1] "matrix"
#a matrix is simply an atomic vector with a dimension attribute
#create a matrix containing the same numbers (1-20) and dimensions (4 rows, 5 columns)
my_matrix2 <- matrix(1:20, nrow=4, ncol=5)
my_matrix2
     [,1] [,2] [,3] [,4] [,5]
[1,]    1    5    9   13   17
[2,]    2    6   10   14   18
[3,]    3    7   11   15   19
[4,]    4    8   12   16   20
patients <- c("Bill", "Gina", "Kelly", "Sean")
#use the cbind() function to 'combine columns'
cbind(patients, my_matrix)
     patients                       
[1,] "Bill"   "1" "5" "9"  "13" "17"
[2,] "Gina"   "2" "6" "10" "14" "18"
[3,] "Kelly"  "3" "7" "11" "15" "19"
[4,] "Sean"   "4" "8" "12" "16" "20"
# not a good result as matrix is now coerced into all characters
my_data <- data.frame(patients, my_matrix)
 my_data
  patients X1 X2 X3 X4 X5
1     Bill  1  5  9 13 17
2     Gina  2  6 10 14 18
3    Kelly  3  7 11 15 19
4     Sean  4  8 12 16 20
#the data.frame() function takes any number of arguments and returns a single 
#object of class `data.frame` that is composed of the original objects.
cnames <- c("patient", "age", "weight", "bp", "rating", "test")
colnames(my_data) <- cnames
 my_data
  patient age weight bp rating test
1    Bill   1      5  9     13   17
2    Gina   2      6 10     14   18
3   Kelly   3      7 11     15   19
4    Sean   4      8 12     16   20

##Logic

#use the `&` operator to evaluate AND across a vector. The `&&` version of AND
# only evaluates the first member of a vector
TRUE & c(TRUE, FALSE, FALSE)
[1]  TRUE FALSE FALSE
> TRUE && c(TRUE, FALSE, FALSE)
[1] TRUE
# same with OR (|, ||)
#All AND operators are evaluated before OR operators

#Let's walk through the order of operations in the above case. First the left and
#right operands of the AND operator are evaluated. 6 is not equal 8, 4 is greater than
#3.9, therefore both operands are TRUE so the resulting expression `TRUE && TRUE`
#evaluates to TRUE. Then the left operand of the OR operator is evaluated: 5 is not
#greater than 8 so the entire expression is reduced to FALSE || TRUE. Since the right
#operand of this expression is TRUE the entire expression evaluates to TRUE.
5 > 8 || 6 != 8 && 4 > 3.9
[1] TRUE
2
isTRUE(6 > 4)
[1] TRUE
identical('twins', 'twins')
[1] TRUE
#xor() function stands for exclusive OR. If one argument evaluates to TRUE and one argument
#evaluates to FALSE, then this function will return TRUE
xor(5 == 6, !FALSE)
[1] TRUE
ints
 [1]  6  2  8  5  1 10  4  3  9  7
which(ints > 7)
[1] 3 6 9
#The any() function will return TRUE if one or more of the elements in
# the logical vector is TRUE. The all() function will return TRUE if every element in
# the logical vector is TRUE
any(ints < 0)
[1] FALSE
all(ints > 0)
[1] TRUE


##Functions
#When you explicitly
#designate argument values by name, the ordering of the arguments becomes unimportant.
#You can try this out by typing: remainder(divisor = 11, num = 5)
#make an evaluate() function that passess a function and an argument for it to run on
evaluate <- function(func, dat){
  func(dat)
}
evaluate(sum, c(2, 4, 6)) should evaluate to 12
evaluate(median, c(7, 40, 9)) should evaluate to 9
#paste (..., sep = " ", collapse = NULL) ... allows you to pass inf arguments to a function
paste("Programming", "is", "fun!")
[1] "Programming is fun!"
#To unpack a ... args inside a function:
mad_libs <- function(...){
  # Do your argument unpacking here!
  args <- list(...)
  place <- args[["place"]]
  adjective <- args[["adjective"]]
  noun <- args[["noun"]] 
  paste("News from", place, "today where", adjective, "students took to the streets in protest of the new", noun, "being installed on campus.")
}

##lapply sapply vapply tapply
# Each of the *apply functions will SPLIT up some data into smaller pieces, APPLY a
# function to each piece, then COMBINE the results
head(flags)
            name landmass zone area population language religion bars stripes colours
1    Afghanistan        5    1  648         16       10        2    0       3       5
2        Albania        3    1   29          3        6        6    0       0       3
3        Algeria        4    1 2388         20        8        2    2       0       3
4 American-Samoa        6    3    0          0        1        1    0       0       5
5        Andorra        3    1    0          0        6        0    3       0       3
6         Angola        4    2 1247          7       10        5    0       2       3
  red green blue gold white black orange mainhue circles crosses saltires quarters
1   1     1    0    1     1     1      0   green       0       0        0        0
2   1     0    0    1     0     1      0     red       0       0        0        0
3   1     1    0    0     1     0      0   green       0       0        0        0
4   1     0    1    1     1     0      1    blue       0       0        0        0
5   1     0    1    1     0     0      0    gold       0       0        0        0
6   1     0    0    1     0     1      0     red       0       0        0        0
  sunstars crescent triangle icon animate text topleft botright
1        1        0        0    1       0    0   black    green
2        1        0        0    0       1    0     red      red
3        1        1        0    0       0    0   green    white
4        0        0        1    1       1    0    blue      red
5        0        0        0    0       0    0    blue      red
6        1        0        0    1       0    0     red    black

# The lapply() function takes a list as input, applies a function to each element of
# the list, then returns a list of the same length as the original one. Since a data
# frame is really just a list of vectors (you can see this with as.list(flags)), we can
# use lapply() to apply the class() function to each column of the flags dataset.

#apply the class() function to each column of
#the flags dataset and store the result in a variable called cls_list
cls_list <- lapply(flags, class)
cls_list
$`name`
[1] "factor"

$landmass
[1] "integer"

$zone
[1] "integer"
...

#Columns 11 through 17 of our dataset are indicator variables, each representing a
#different color. The value of the indicator variable is 1 if the color is present in
#a country's flag and 0 otherwise. Therefore, if we want to know the total number of 
#countries (in our dataset) with,for example, the color orange on their flag, we can 
#just add up all of the 1s and 0s in the 'orange' column.
sum(flags$orange)
[1] 26
#extract the columns containing the color data and store them in a new data frame called flag_colors
flag_colors <- flags[, 11:17]
head(flag_colors)
  red green blue gold white black orange
1   1     1    0    1     1     1      0
2   1     0    0    1     0     1      0
3   1     1    0    0     1     0      0
4   1     0    1    1     1     0      1
5   1     0    1    1     0     0      0
6   1     0    0    1     0     1      0
...
#To get a list containing the sum of each column of flag_colors, call the lapply()
# function with two arguments. The first argument is the object over which we are
# looping (i.e. flag_colors) and the second argument is the name of the function we
# wish to apply to each column (i.e. sum)
lapply(flag_colors, sum)
$`red`
[1] 153

$green
[1] 91

$blue
[1] 99
...
# Each element of this list
# is of length one, so the result can be simplified to a vector by calling sapply()
flag_shapes <- flags[,19:23]
#Each of these columns (i.e. variables) represents the number of times a particular
#shape or design appears on a country's flag
flag_shapes
    circles crosses saltires quarters sunstars
1         0       0        0        0        1
2         0       0        0        0        1
3         0       0        0        0        1
4         0       0        0        0        0
5         0       0        0        0        0
6         0       0        0        0        1
7         0       0        0        0        0
8         0       0        0        0        1
9         0       0        0        0        0
10        0       0        0        0        1
11        0       1        1        1        6
...
#The range() function returns the minimum and maximum of its first argument
lapply(flag_shapes, range)
$`circles`
[1] 0 4

$crosses
[1] 0 2

$saltires
[1] 0 1

$quarters
[1] 0 4

$sunstars
[1]  0 50

#Whereas sapply() tries to 'guess' the correct format of the result, vapply() allows
#you to specify it explicitly. If the result doesn't match the format you specify,
#vapply() will throw an error, causing the operation to stop. This can prevent
#significant problems in your code that might be caused by getting unexpected return
#values from sapply().

#If we wish to be explicit about the format of the result we expect, we can use
#vapply(flags, class, character(1)). The 'character(1)' argument tells R that we
#expect the class function to return a character vector of length 1 when applied to
#EACH column of the flags dataset.
 vapply(flags, class, character(1))
      name   landmass       zone       area population   language   religion       bars 
  "factor"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer" 
   stripes    colours        red      green       blue       gold      white      black 
 "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer" 
    orange    mainhue    circles    crosses   saltires   quarters   sunstars   crescent 
 "integer"   "factor"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer" 
  triangle       icon    animate       text    topleft   botright 
 "integer"  "integer"  "integer"  "integer"   "factor"   "factor"

#you'll often wish to split your data up into groups based on the
#value of some variable, then apply a function to the members of each group. The next
#function we'll look at, tapply(), does exactly that

#The 'landmass' variable in our dataset takes on integer values between 1 and 6, each
#of which represents a different part of the world.
table(flags$landmass)
 1  2  3  4  5  6 
31 17 35 52 39 20
#The 'animate' variable in our dataset takes the value 1 if a country's flag contains
#an animate image (e.g. an eagle, a tree, a human hand) and 0 otherwise
table(flags$animate)
  0   1 
155  39
#apply the mean function to the
# 'animate' variable separately for each of the six landmass groups, thus giving us the
# proportion of flags containing an animate image WITHIN each landmass group
tapply(flags$animate, flags$landmass, mean)
 1         2         3         4         5         6 
0.4193548 0.1764706 0.1142857 0.1346154 0.1538462 0.3000000 
#look at a summary of population values (in round millions) for
# countries with and without the color red on their flag
tapply(flags$population, flags$red, summary)
 tapply(flags$population, flags$red, summary)
$`0`
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   0.00    0.00    3.00   27.63    9.00  684.00 

$`1`
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    0.0     0.0     4.0    22.1    15.0  1008.0 
#use the same approach to look at a summary of population values for each of
# the six landmasses.
tapply(flags$population, flags$landmass, summary)
$`1`
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   0.00    0.00    0.00   12.29    4.50  231.00 

$`2`
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   0.00    1.00    6.00   15.71   15.00  119.00 

$`3`
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   0.00    0.00    8.00   13.86   16.00   61.00 

$`4`
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  0.000   1.000   5.000   8.788   9.750  56.000 

$`5`
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   0.00    2.00   10.00   69.18   39.00 1008.00 

$`6`
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   0.00    0.00    0.00   11.30    1.25  157.00


##Looking at data
# using plant data table
#get the dimensions, number of rows(observations), number of columns(variables)
dim(plants) 
[1] 5166   10
nrow(plants)
[1] 5166
ncol(plants)
[1] 10
object.size(plants)
686080 bytes
names(plants)
[1] "Scientific_Name"      "Duration"             "Active_Growth_Period" "Foliage_Color"        "pH_Min"               "pH_Max"              
[7] "Precip_Min"           "Precip_Max"           "Shade_Tolerance"      "Temp_Min_F"
head(plants)
Scientific_Name          Duration Active_Growth_Period Foliage_Color pH_Min pH_Max Precip_Min Precip_Max Shade_Tolerance Temp_Min_F
1                  Abelmoschus              <NA>                 <NA>          <NA>     NA     NA         NA         NA            <NA>         NA
2       Abelmoschus esculentus Annual, Perennial                 <NA>          <NA>     NA     NA         NA         NA            <NA>         NA
3                        Abies              <NA>                 <NA>          <NA>     NA     NA         NA         NA            <NA>         NA
4               Abies balsamea         Perennial    Spring and Summer         Green      4      6         13         60        Tolerant        -43
5 Abies balsamea var. balsamea         Perennial                 <NA>          <NA>     NA     NA         NA         NA            <NA>         NA
6                     Abutilon              <NA>                 <NA>          <NA>     NA     NA         NA         NA            <NA>         NA
#view the first 10 rows of data
head(plants, 10)
#view the last rows of plants
tail(plants)
#get a better feel for how each variable is distributed and how much of the dataset is missing
summary(plants)
Scientific_Name              Duration              Active_Growth_Period      Foliage_Color      pH_Min          pH_Max      
Abelmoschus                 :   1   Perennial        :3031   Spring and Summer   : 447      Dark Green  :  82   Min.   :3.000   Min.   : 5.100  
Abelmoschus esculentus      :   1   Annual           : 682   Spring              : 144      Gray-Green  :  25   1st Qu.:4.500   1st Qu.: 7.000  
Abies                       :   1   Annual, Perennial: 179   Spring, Summer, Fall:  95      Green       : 692   Median :5.000   Median : 7.300  
Abies balsamea              :   1   Annual, Biennial :  95   Summer              :  92      Red         :   4   Mean   :4.997   Mean   : 7.344  
Abies balsamea var. balsamea:   1   Biennial         :  57   Summer and Fall     :  24      White-Gray  :   9   3rd Qu.:5.500   3rd Qu.: 7.800  
Abutilon                    :   1   (Other)          :  92   (Other)             :  30      Yellow-Green:  20   Max.   :7.000   Max.   :10.000  
(Other)                     :5160   NA's             :1030   NA's                :4334      NA's        :4334   NA's   :4327    NA's   :4327 
...
#see how many times each value actually occurs in the data
table(plants$Active_Growth_Period)
Fall, Winter and Spring                  Spring         Spring and Fall       Spring and Summer    Spring, Summer, Fall                  Summer 
                     15                     144                      10                     447                      95                      92 
Summer and Fall              Year Round 
24                       5
#str() is the best one
str(plants)
'data.frame':	5166 obs. of  10 variables:
 $ Scientific_Name     : Factor w/ 5166 levels "Abelmoschus",..: 1 2 3 4 5 6 7 8 9 10 ...
 $ Duration            : Factor w/ 8 levels "Annual","Annual, Biennial",..: NA 4 NA 7 7 NA 1 NA 7 7 ...
 $ Active_Growth_Period: Factor w/ 8 levels "Fall, Winter and Spring",..: NA NA NA 4 NA NA NA NA 4 NA ...
 $ Foliage_Color       : Factor w/ 6 levels "Dark Green","Gray-Green",..: NA NA NA 3 NA NA NA NA 3 NA ...
 $ pH_Min              : num  NA NA NA 4 NA NA NA NA 7 NA ...
 $ pH_Max              : num  NA NA NA 6 NA NA NA NA 8.5 NA ...
 $ Precip_Min          : int  NA NA NA 13 NA NA NA NA 4 NA ...
 $ Precip_Max          : int  NA NA NA 60 NA NA NA NA 20 NA ...
 $ Shade_Tolerance     : Factor w/ 3 levels "Intermediate",..: NA NA NA 3 NA NA NA NA 2 NA ...
 $ Temp_Min_F          : int  NA NA NA -43 NA NA NA NA -13 NA ...


## Simulation
#simulate rolling four six-sided dice
sample(1:6, 4, replace = TRUE)
[1] 4 3 5 1
#randomly select four numbers between 1 and 6, WITH replacement. Sampling with replacement simply means that
#each number is "replaced" after it is selected, so that the same number can show up more than once
sample(1:6, 4, replace = TRUE)
[1] 6 2 6 6
#The sample() function can also be used to permute, or rearrange, the elements of a vector. For example, 
#try sample(LETTERS) to permute all 26 letters of the English alphabet
sample(LETTERS)
 [1] "Y" "P" "X" "I" "O" "L" "J" "Q" "S" "A" "E" "G" "D" "K" "N" "W" "C" "V" "F" "M" "Z" "B" "U" "T" "R" "H"
#simulate 100 flips of an unfair two-sided coin. This particular coin has a 0.3 probability of landing 
#'tails' and a 0.7 probability of landing 'heads'
flips <- sample(c(0,1), 100, replace = TRUE, prob = c(0.3, 0.7))
#request 100 observations, each of size 1, with success probability of 0.7
rbinom(1, size = 100, prob = 0.7)
#generate 10 random numbers from a standard normal distribution
rnorm(10)
#Generate 5 random values from a Poisson distribution with mean 10
rpois(5, 10)
my_pois
     [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10] [,11] [,12] [,13] [,14] [,15] [,16]
[1,]    7    8   12    7   13   12   15   14    7     3    10    14    10    10     7    12
[2,]    6   12   17   14   10    8   10    5   10     8    14     9    11     8    14     9
[3,]    8    7   11   11    9    9    9   17   12     7     4    15     5     8    19    10
[4,]   12   11   12    3    8   13   10   10    7    11     8    17    10    10     3     9
...
#created a matrix, each column of which contains 5 random numbers generated
#from a Poisson distribution with mean 10
#find the mean of each column
cm <- colMeans(my_pois)
#plot a histogram of cm
hist(cm)




