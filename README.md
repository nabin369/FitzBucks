# Fitzdares
It's a Technical test for London tech company

# Welcome to FitzBucks
## Background

A Client is watching a Football match and decides they want to have a bet. They
contact us and ask to place a bet on the Football match. We then create a
football bet. The bet will then be settled after the football match finishes.

If the client's bet won, we will pay them some money. The pay out (returns) is
the stake and the winning amount (our loss). If the result is a loser, we won't
pay them anything and keep the stake (our profit).

At the end of the month we need to know what our profit and losses are.

As we like analytics, we would like to know the profit and losses based on the
sport of the bet. This is so we can see which sports the clients are winning or
losing in.

## The Challenge

We have an application that shows the Profit/Loss (P/L) By Client. This can be
found here:

```
http://localhost:3000/profit_loss_client/new
```

This report gives you a list of Clients; their total stakes, returns and P/L;
and a headline figure of all combined clients.

We would like you to create a report that shows the overall P/L for the clients,
that can then be broken down into P/L totals by sport. For example, we want to
see a client's total P/L, and a list of sports. Each sport should have its own
P/L, based on the client's bets for that sport. We have supplied you with only 6
months worth of test data. The date range for the bets is between 01/01/2014 and
30/06/2014 inclusive.

This report should be called "P/L By Client By Sport".

You should consider how a larger and more complex data set will affect the
reports and try to cater for these situations. Also, think about how
to format the report so that the data can be digested easily. We want to see how
you approach the problem, how you would solve it and most importantly what your
code looks like. Do whatever you think shows your abilities best.

You are allowed to change any part of the application, and feel free to use the
example report format as a basis for your report or you can come up with your
own.

Testing is encouraged; we use RSpec and Cucumber.

Please use the local Git repo supplied with this application and use the
"solution" branch.

## Setup

To setup the application run the following commands:

```
$ cd fitzbucks
$ bundle install
$ rake db:schema:load
$ rake db:populate
$ rails s
```

This will seed the database with all the required data. Now we're ready to start
the server and begin the challenge!

## Remember

If you have any questions please ask Simon (simon@fitzdares.com) or Ed (ed@fitzdares.com)
