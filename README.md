# README

CRUD Cats names

<table>
  <tr>
    <td>Ruby version</td>
    <td>
      3.1.3
    </td>
  </tr>
  <tr>
    <td>Rails version</td>
    <td>
      7.0.8
    </td>
  </tr>
  <tr>
    <td>Database</td>
    <td>
      SQLite3 (dev) / PostgreSQL (prod)
    </td>
  </tr>
</table>

```bash
# clone the project
git clone https://github.com/camargosjessica/api-cats-ror.git

# enter the cloned directory
cd api-cats-ror

# install Ruby on Rails dependencies
bundle install

# create the development and test databases
rails db:create

# create the tables
rails db:migrate

# run the project
rails s
```

The backend is available at `http://localhost:3000`.

## Tests

To run the tests:

```bash
rspec
```