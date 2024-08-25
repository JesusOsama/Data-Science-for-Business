#### Introduction to R ####

#Case Study Description: Student Grades Analysis
#In this case study, we will learn the basics of R, including data types, mathematical and 
#text operations, conditional structures, and loops. Through the analysis of student grades, 
#we will demonstrate how to:
  #Define and manipulate different data types in R (numeric, character, factors, logical).
  #Perform basic operations with numbers and text.
  #Use conditional structures to make logical decisions.
  #Implement loops to automate data analysis.
#This practical exercise is an essential introduction to handling data and automating simple 
#tasks in R.


# First Student
score <- 85          
name_student <- "Ana"  
grade <- factor("B")        
passed <- TRUE

# Error in Review
right_score <- score + 5

# Message
message <- paste(name_student, "has obtained a score of", right_score)
print(message)

# Evaluate if student pass the exam
if (right_score >= 60) {
  resultado <- "Pass ✅"
} else {
  resultado <- "Fail ❌"
}

print(paste(name_student," : ",resultado))

# All Students
SCORES <- c(85, 90, 58, 77, 92)

# Counter
counter_passed <- 0

# Loop to Count
for (score in SCORES) {
  if (score >= 60) {
    counter_passed <- counter_passed + 1
  }
}

# Print Result
print(paste("Number of passed students:", counter_passed))
