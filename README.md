# Demo

## [Latest n blocks endpoint](https://block-api-test.herokuapp.com/api/last_blocks/10)

```bash
$ curl -XGET -H 'Content-type: application/json' 'https://block-api-test.herokuapp.com/api/last_blocks/10'
[
  {
    "timestamp": "2018-01-22T04:07:04.995083",
    "rows": [
      "row10",
      "row9",
      "row8",
      "row7",
      "row6"
    ],
    "previous_block_hash": "aa1b58bb89b72868092dc6b19ba111ae7e49afcb0d3165f8d04ed9bcfc46ed3c",
    "block_hash": "17608e5094915021fa57f39debbad8d27b3bbb989045ec29dd3cccc8adadc9a4"
  },
  {
    "timestamp": "2018-01-22T03:54:15.338251",
    "rows": [
      "row5",
      "row4",
      "row3",
      "row2",
      "row1"
    ],
    "previous_block_hash": "0",
    "block_hash": "aa1b58bb89b72868092dc6b19ba111ae7e49afcb0d3165f8d04ed9bcfc46ed3c"
  }
]
```

## Receiving endpoint:

```bash
curl -XPOST -H 'Content-type: application/json' 'https://block-api-test.herokuapp.com/api/add_data' -d '{"data": "sample_data"}' 
```

# BlockApi

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
