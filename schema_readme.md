# Milestone03_Group21

## Constraints:
- Every Lab Section belongs to exactly one Course, one Term, and exactly one Set.
- Every Lab Event belongs to exactly one Lab Section (and therefore to one Set indirectly).
- Progress references an existing Student and Lab Event.
- Change Log references an existing Progress and User (the actor making the change).

## PK Choices:
- Term Code: Always unique, each term will have their own code.
- Set Code: Always unique, each set will have their own code.
- Course Code: Always unique, each course will have their own code.
- User ID: Always unique, each user is referred to with their ID.
- Student ID: Always unique, each student is referred to with their ID.
- Section Code: Always unique, each section will have their own code.
- Assignment ID: Always unique, each assignment is distinguished with its ID.
- Event ID: Always unique, each event is distinguished with its ID.
- Progress ID: Always unique, each progress report is distinguished with its ID.
- Change ID: Always unique, each change report is distinguished with its ID.





