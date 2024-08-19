## Languages seeds

No need for a gem for this one.

Simple Migration and Seeds file for adding Languages to your Rails app.

Run the migration or use the rails generator

```bash
  rails g model Language name:string:index iso_639_1:string:index iso_639_2t:string:index iso_639_2b:string iso_639_3:string:index scope:string type_of:string endonyms:string other_names:string notes:text
```

Copy over your seeds, seed them in your usual way, and viola!

That's it!

## Update Countries List

If there are changes / updates to the country list, you can run the parser to update the seeds file.

```ruby
ruby parse_wiki.rb
```

## Caveats

When you run the parser there are a few languages that may need manually fixing, mostly due to punctuation and quotations etc.

I do not have time to work out the problem, more than happy to take a pull request that deals with the errors that happen.
