# README

This API application uploads documents to a folder and follows the specification outlined.

## Getting it running locally

Navigate to the content of the go

`git clone https://github.com/osazemeu/shiny-octo-meme.git`

cd shiny-octo-meme

### Database Initialization

Ensure you have Postgres instance running locally in server and run the following command

`rails db:setup`

### Run application

`rails serve`

navigate to the following link on your browser
<http://localhost:3000/> # Yay! You're on Rails!

## API Queries

### Upload File Functionality

Screenshot: <https://imgur.com/baNx4b1>

```markdown
curl -X POST \
  http://localhost:3000/api/files \
  -H 'Content-Type: multipart/form-data' \
  -H 'Host: localhost:3000' \
  -F name=osazeme \
  -F 'tags[]=zync' \
  -F 'file=@/Users/osazemeusen/Downloads/Amazon Web Services Ackenowledgement.pdf' \
  -F 'tags[]=golem' \
  -F 'tags[]=Phoenix' \
  -F 'tags[]=syndicate' \
  -F 'tags[]=drawl' \
  -F 'tags[]=stinger'
```

### Search Functionality

Screenshot: <https://imgur.com/IMmgCsj>

```markdown
curl -X GET \
  'http://localhost:3000/api/files/+golem%20+zync%20-stinger/0' \
  -H 'Host: localhost:3000'
```

### Design Decision

I went with Service Oriented Architecture where services are used to enhanced separation of concern. For uuid, I used PostgreSQL uuid for performance and also to reduce chances for id collision to future proof. To enhance performance for queries relating to the tag field, I used `GIN` index. For file uploads, I used `ActiveStorage` and implemented rollback and error message for validation of files. I intentionally didn't include activerecord-serializer because requirements were pretty straightforward, but it could be included on request. Error handling was done by extending existing functionality in rails.

#### Future enhancements

I could use redis across the entire application to further improve query performance.
Write unit test, integration test, etc to improve test coverage.

#### Time-Spent

11.32hrs
