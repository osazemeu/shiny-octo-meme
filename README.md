# README

This API application uploads documents to a folder and follows the specification outlined.

## Getting it running locally

Navigate to the content of the go

`git clone https://github.com/osazemeu/shiny-octo-meme.git`

cd shiny-octo-meme

### Database Initialization

Ensure you have Postgres instance running locally in server
rails db:migrate

### Run application

rails serve

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
