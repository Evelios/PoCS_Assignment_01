# Thomas Waters
# Assignment 1
# Problem 2
# Rowing records of 2000m
# https://en.wikipedia.org/wiki/List_of_Olympic_records_in_weightlifting
library(tidyverse)
library(ggplot2)

record_file_name = "Rowing_Records.csv"
boating_records = read.csv(record_file_name) %>%
  select(weight_class, record, event, gender)

snatch_records = filter(boating_records, event == "Snatch")
clean_jerk_records = filter(boating_records, event == "Clean_Jerk")
total_records = filter(boating_records, event == "Total")

ggplot(boating_records,
       aes(x=weight_class, y=record,
           color=event, shape=gender)) +
  labs(title="Weight Lifting World Records",
       x="Weight Class (kg)", y="Record (kg)") +
  geom_point() +
  geom_smooth(method='lm')

snatch_reg = lm(record ~ weight_class,data=snatch_records)
clean_jerk_reg = lm(record ~ weight_class,data=clean_jerk_records)
total_reg = lm(record ~ weight_class,data=total_records)
