# Lab 12 - Counters and Dividers

In this lab, we learned how to make clock dividers from two types of counters.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

Summary

For this lab we sought to create two different counters using the previous learned D-flip flop and T-flip flop.
## Lab Questions

### 1 - Why does the Modulo Counter actually divide clocks by 2 * Count?
          It divides by 2*count because it takes two runs through in order to toggle
### 2 - Why does the ring counter's output go to all 1s on the first clock cycle?
          This is due to needing a starting point otherwise it could go haywire from noise.
### 3 - What width of ring counter would you use to get to an output of ~1KHz?
          it needs 100,000 flip flops because 100 mil cycles / 1000 cycles per seconds
