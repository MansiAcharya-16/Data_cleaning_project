# ------------------------------------------------------------
# Task: Module_I - AI_Omics_Internship_2025
# Script Name: class_Ib.R
# Trainee: Mansi Acharya
# ------------------------------------------------------------

# 1. Set Working Directory 
setwd("C:/Users/MANSI/Downloads/AI_Omics_Internship_2025")

# 2. Create Project Subfolders
dir.create("raw_data", showWarnings = FALSE)
dir.create("clean_data", showWarnings = FALSE)
dir.create("scripts", showWarnings = FALSE)
dir.create("results", showWarnings = FALSE)
dir.create("plots", showWarnings = FALSE)

# ------------------------------------------------------------
# 3. Download "patient_info.csv" from GitHub

url <- "https://raw.githubusercontent.com/AI-Biotechnology-Bioinformatics/AI_and_Omics_Research_Internship_2025/refs/heads/main/patient_info.csv"
download.file(url, destfile = "raw_data/patient_info.csv", method = "auto")

# Load dataset
patient_info <- read.csv("raw_data/patient_info.csv", stringsAsFactors = FALSE)

# ------------------------------------------------------------
# Inspect Structure
str(patient_info)
summary(patient_info)
head(patient_info)

# Convert age to integer
patient_info$age <- as.integer(patient_info$age)

# Convert gender, diagnosis to factors
patient_info$gender <- as.factor(patient_info$gender)
patient_info$diagnosis <- as.factor(patient_info$diagnosis)

# Ensure bmi is numeric
patient_info$bmi <- as.numeric(patient_info$bmi)

# Convert smoker to factor
patient_info$smoker <- as.factor(patient_info$smoker)

#Binary smoking status

patient_info$smoking_binary <- ifelse(patient_info$smoker == "Yes", 1, 0)
patient_info$smoking_binary <- factor(patient_info$smoking_binary, levels = c(0, 1))

# To check changes
head(patient_info)

# Save cleaned dataset
write.csv(patient_info, "clean_data/patient_info_clean.csv", row.names = FALSE)

