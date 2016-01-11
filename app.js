var express = require('express'),
        app = express(),
       port = 8080;

app.get('*', function (req, res) {
    res.send('Hello World.')
});

app.listen(port, function () {
    console.log('Server can be reached at http://localhost:' + port);
});
