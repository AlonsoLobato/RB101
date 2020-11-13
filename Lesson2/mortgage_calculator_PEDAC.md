Mortgage calculator — PEDAC process
===================================

1) Understanding the problem
- Prompt user for the following info:
  - Loan amount (amount user asks to lender)
  - Annual Percentage Rate (annual interest rate the user chooses)
  - Loan duration (number of years over which user will repay the mortgage)

- From that info, we calculate
  - Monthly interest rate (APR / 12 months)
  - Loan durations in months (years user asks mortgage to last * 12)
  - Monthly payment (monthly principal and interest user will pay)
    - We use the following formula:
      - m = p * (j / (1 - (1 + j)**(-n))) where:
        m = monthly payment (final result)
        p = loan amount
        j = monthly interest rate
        n = loan duration in months

2) Test cases
Input:
p = '150000'
j = '6.25'
n = '25'
Output: $989.50

Input:
p = '-150000' or '15000.25' or 'some money' or ' '
j = '- 6.25' or '0' or ' '
n = '5' or '2.5' or '50' or 'fifty'
Output: error: p must be a positive integers |
        j must be a positive integer or float |
        n must be a integer between 10 and 40

3) Data structure
Integers, floats, strings

4) Algorithm
- Methods to validate user input
  - Loan amount must be positive int
  - Interest rate must be positive float
  - Loan duration must be int >= 10 AND <= 40

- Request user input
  - Prompt for users name
    - check validity name exist and is string
  - Hello user and instructions
  - Mortgage amount requested
    - use designated method to check validity
    - transform result to float
  - Anual percentage rate
    - use designated method to check validity
    - transform result to float
  - Mortgage duration (in years)
      - use designated method to check validity
      - transform result to float

- Process input to output
  - Convert anual rate to monthly rate
    - anual rate / 12
  - Convert Loan duration in years
    - loan duration * 12
  - Calculate monthly payment with formula m = p * (j / (1 - (1 + j)**(-n)))
  - Calculate details: total amount interest and total amount to pay (loan + interest)
  - Output message and result of calculation
    - Breakdown result into chapters

  - Ask if user wants to repeat calculation
    - unless answer is yes
      - break out and display good bye msg

