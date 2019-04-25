# Bookmark Manager

Week 4 Challenge at [Makers Academy](https://makers.tech/)

How to run
----

1. Clone this repo
2. Run bundle install
3. Connect to `psql`
4. Create the database using the `psql` command `CREATE DATABASE bookmark_manager;`, `CREATE DATABASE bookmark_manager_test;`
5. Connect to each databases in `psql` and run the SQL scripts `01_create_bookmarks_table.sql` in the `db/migrations`
6. Run `ruby app.rb` and visit `http://localhost:4567/`



User story
----

```sh
As a user
So I can save the websites I like
I want to add a new bookmark to the list

As a user
So I can see what I’ve saved
I want to see the list of bookmarks

As a user
So I can get rid of the wrong information
I want to delete the bookmark

As a user
So I can correct the current bookmark
I want to update the bookmark
```
