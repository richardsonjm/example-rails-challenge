# Rails Programming Task

### In order to be considered for a Rails position, you must complete the following steps.
*Note: This task should take no longer than 1-3 hours at the most to complete.*


### Prerequisites

- Please note that this will require some basic [Ruby on Rails](http://rubyonrails.org/) and [RSpec](http://rspec.info/) knowledge. 

- You will need to have [Ruby on Rails](http://www.rubyonrails.org/) installed to complete this task. 

## Task

- Fork this repository (if you don't know how to do that, Google is your friend).
- Create a *source* directory.
- In the *source* directory, scaffold a simple Rails 4 web app that models a credit card charge. Attributes below: 

```
:id (rails generated id)
:created_at (date and time)
:amount (quantity of money)
:unique_code (code to identify charge)
:paid (true/false)
:refunded  (true/false)
```

    *Note: a successful charge is a paid charge that is not refunded
    *Note: a disputed charge is a paid charge that is refunded
    *Note: a failed charge is a charge that is not paid
    *Note: the unique code is generated when the charge is created and should be considered secure from guessing

- Also a charge has a customer that can be either a User or a Company (this may require adding attributes not listed to some of the models)
- A user has attributes:
```
:id (rails generated id)
:first_name
:last_name
```
- A company has attributes:
```
:id (rails generated id)
:name
:zip_code
```



##### Seed Data into the system:

  - 1 Company with 5 successful charges
  - 1 Company with 3 successful charges and 1 disputed charge and 1 failed charge

  - 5 Users with 1 successful charge each
  - 1 User with 2 disputed charges and 1 failed charge
  - 1 User with 3 failed charges


##### Create a Visual Representation of Different Charges:

1)  Create a page that allows creation of a new charge.  The user will pick from the list of companies and users already seeded in the system and then enter the amount and then submit with a "Charge Customer" button

2)  On the view that shows all charges (most likely the *GET /charges* route), create three lists with H1 headers. 
When listing a customer if it's a user then show first name and last name or if it's a company then show name and zip code

- List 1 - 
  - Header: Failed Charges
  - In this list set the background color of the rows to #FF0000 and list the customer, the charge amount and the date that the charge failed for each failed charge. 
  - Link to show using unique_code (do not include rails generated id in the link)

- List 2 - 
  - Header: Disputed Charges
  - In this list set the background color of the rows to ##FF5400 and list the customer,  the charge amount and the date that the charge was disputed for each disputed charge. 
  - Link to show using unique_code (do not include rails generated id in the link)

- List 3 - 
  - Header: Successful Charges
  - In this list simply display all the charges that were successful. 
  - Link to show using unique_code (do not include rails generated id in the link)

3)  On the view for showing the details of a charge (found by the unique_code and not id)
 - Show all customer info 
 - Show all charge information

### Tests

Create the following RSpec tests:

  1.  Verify that there are three lists on the screen. One for successful charges, one for failed charges and one for the disputed charges. 
  2.  Verify the number of each kind of charge. 
  3.  Verify a new charge can be created.
  4.  Create unit tests surrounding your model logic.

### Extra Credit:

Add one feature that can be discussed in the interview.  Some ideas:
  - Other index pages
  - Edit pages for models
  - Mailers after charges are created
  - ...

## Once Complete
1. Commit and Push your code to your new repository
2. Send us a pull request, we will review your code and get back to you






