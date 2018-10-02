## Languages seeds

No need for a gem for this one.

Simple Migration and Seeds file for adding Languages to your Rails app.

Run the migration or use the rails generator

```bash
  rails g model Language name:string:index native:string family:string scope:string type_of:string iso_639_1:string iso_639_2b:string iso_639_3:integer:index
```

#### Scope / Type Key

**Scope:** I = individual language, M = macrolanguage, S = special code

**Type:** A = ancient (extinct since ancient times), C = constructed, E = extinct (in recent times), H = historical (distinct from its modern form), L = living, S = special code

See [Wikipedia](https://en.wikipedia.org/wiki/ISO_639:a) for more information and source.

Copy over your seeds, seed them in your usual way, and viola!

That's it!
