# Isotope11 Quote App

TL;DR - This is an application for bidding software projects.

We at Isotope11 built a project to use when creating estimates for our
customers.  It allows us to rapidly develop quotes for our customers, as well as
use post-mortems to make future quotes better.  We can export the quotes to PDF,
which we send to the customers.

![Demo Screenshot](https://raw.github.com/isotope11/quote_app/master/doc/quote_app_demo_pic.png)

Before we built this app, we were developing quotes in Google Docs.  It worked
alright, but the display always left something to be desired.  We would either
give ugly quotes to customers, or we would spend insane amounts of time making
them look good.  This tool allows us to easily generate good-looking estimates,
quickly.

## Features
- Estimate time required to build a software project with line items supporting
  min and max estimates.
- Export your quotes to PDF.
- Clone a quote.
- Store common line items in Item Templates, to help you easily add them to
  future quotes as well as to gradually perfect your min/max estimates on those
  items over time.
- Sections in a quote can have subsections, and you can add line items to the
  quote at any nesting level.
- Sections and subsections sum up their childrens' min/max hours.
- Export a quote to [xrono](http://github.com/isotope11/xrono), and create the project and all subtickets via the xrono API.

[This project is on github.](http://github.com/isotope11/isotope_quotes).  We welcome forks and pull requests.  We would love
to hear from you if you have suggestions as well - just use github issues.
