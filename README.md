# ZettelOutline Rendering

Assemble a first draft from your [Zettelkasten](http://zettelkasten.de) notes and an outline file. **Markdown** aware, allowing you to write arbitrarily nested lists as outlines.


## Installation

Install the ruby gem yourself from the command line:

    $ gem install zettel_outline

## Usage of the program

From the command line, run `zettel_outline` with the required parameters:

        -f, --file                   an outline file
        -a, --archive                path to your Zettel notes
        -o, --output                 file to write results to

For example:
    
    $ zettel_outline -f outline.txt -a /path/to/notes/ -o draft.txt

This will read the `outline.txt` from the current directory. It will resolve every Zettel reference using the Zettel note archive (`/path/to/notes/`) and concatenate the notes's contents into `draft.txt`.

A sample outline can look like this:

    * 201407030825 Why baking is so important for life. I really love baking
    * 201601231448 Banana cake. The very best cake ever
        * 201601222058 Nutritional value of bananas
        * 201601222035 Nutritional value of eggs

The nested list of Zettel references will be split into:

1. The Zettel ID, used to find the note in your archive; e.g. "201407030825"
2. The note title, used for the draft's output; e.g. "Why baking is so important for life"
3. The comment, which is everything after the first period in the line; e.g. "I really love baking"

Zettel note contents will be separated using Markdown-enabled HTML comments, which are surrounded with `<!--` and `-->`. So the resulting `draft.txt` will look similar to this:

    <!-- §201407030825 Why baking is so important for life -->
    <!-- I really love baking -->
    
    Baking is one of the oldest and definitely one of the 
    most delicious ways to prepare food. 
    
    ...


## Usage of the library

The higher-level interface of the gem is very simple. Wrapping every parameter into a `compile` function can look like this:

    def compile(outline_path, notes_path, draft_path)
      content = File.read(outline_path)
      result = ZettelOutline::compile(content, notes_path)
      File.open(draft_path, "w") do |f|
        f.write(ZettelOutline::render(result))
      end
    end

* `ZettelOutline::compile` takes the outline as a string and the path to resolve note references.
* `ZettelOutline::render` is just a wrapper to concatenate the result and return a simple string.


## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/DivineDominion/zettel-outline-rendering>. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

