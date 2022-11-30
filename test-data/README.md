# Sythetic scheduling data creation

This folder contains scripts to create synthetic scheduling data.  They are both very similar, only differing on how many days in the future they create data for.
Data is created for test locations Z00001 through to Z00020.  A single resource is allocated at each test station.

`sql_INSERT_SITEEVENTS_20ZNUMBERS.sql` - creates data for the next 5 days
`sql_INSERT_SITEEVENTS_20ZNUMBERS_6MONTHS.sql` - creates data for the next 6 months

## Prerequisites

You will need to have a CLI or IDE such as MySQL Workbench connected to the database required, with write permissions on the schema/database you wish to create data within.

## Usage

Both scripts use the current database to manipulate.

You can see which database your session is currently pointing to via

`select database();`

set the database via

`use XXXX` replace the x's with the database to update

You can verify that you are pointing to the right database by running

`select database();`
and
`select * from ngt_site_events;`

Run the scripts via

`source sql_INSERT_SITEEVENTS_20ZNUMBERS.sql`

or

`source sql_INSERT_SITEEVENTS_20ZNUMBERS_6MONTHS.sql`

The scripts do not commit - you can do this via the command line via

`commit;`

or the appropriate GUI button.