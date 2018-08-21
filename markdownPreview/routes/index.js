fs = require('fs');
markdown = require('marked');

var express = require('express');
var router = express.Router();

var url = ''

markdown.setOptions({
  renderer: new markdown.Renderer(),
    highlight: function(code) {
        return require('highlight.js').highlightAuto(code).value;
          },
      pedantic: false,
        gfm: true,
          tables: true,
            breaks: false,
              sanitize: false,
                smartLists: true,
                  smartypants: false,
                    xhtml: false
});

/* 根据保存的路径，打开对应的文件  */
router.get('/', function(req, res, next) {
    fs.readFile(url, function(err, data) {
        if (err) throw err;
        var markdownContent = data.toString();
        var htmlContent = markdown(markdownContent);
        console.log(htmlContent);
        res.send(htmlContent);
    });
});

/* vim 通过post请求，将路径传给服务端，服务端将路径保存 */
router.post('/', function(req, res, next) {
    url = req.body.url;
    console.log(url.decode('utf-8'))
    var encoded = encodeURI(url);
    fs.readFile(url, function(err, data) {
        if (err) throw err;
        var markdownContent = data.toString();
        var htmlContent = markdown(markdownContent);
        res.send(htmlContent);
    });
});


module.exports = router;
