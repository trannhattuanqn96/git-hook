const express = require('express')
const app = express()
const port = 1359

app.get('/', (req, res) => {
  res.send('đã vào trang master!')
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})