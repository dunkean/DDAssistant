var fs = require('fs');
var Crawler = require('node-simple-crawler');
var querystring = require('querystring');
var http = require('http');
var cheerio = require('cheerio');
var iconv = require('iconv-lite');

var creaturesString = "";
var errors = {};

var creaturesCrawler = new Crawler(
  {
    concurrent: 10,
    logs: false,
    request: { headers: { 'user-agent': 'Mozilla/5.0 (Windows; U; Windows NT 5.1; fr; rv:1.9.0.1) Gecko/2008070208 Firefox/3.0.1' } },
    decodeTo: 'utf8',
    decodeFrom: '', // e.g. 'win-1251'
    callback:  function(err, visited){if (err) { throw err; }}
  }
);

var parsecreature = function (err, url, document){
  if (err) {
    if(!errors[url]){
      creaturesCrawler.queue(url);
      errors[url] = 1;
    }
    else {
      errors[url] = errors[url] + 1;
      if(errors[url] > 10){
        console.log('************* Error url: '+ url);
        throw err;
      }
    }
    return;
  }

  var $ = document.$;
  var creatureHtml = $('#main div[style="width:50em; margin:0 auto;"]');
  creaturesString += "<br/>"
  creaturesString += creatureHtml.html();
  console.log(creatureHtml.find('h1').text())

  if(creaturesCrawler.pending.length == 0 && creaturesCrawler.active.length == 0){
    fs.writeFile('Creatures.html', creaturesString, function (err) {
      if (err) return console.log(err);
      console.log('Parsing creatures done');
      console.log(errors);
    });
  }
}

var crawlcreatures = function(){
  var creatureListUrl = "http://realmshelps.net/cgi-bin/monsteral.pl";
  var letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

  for(var i in letters){
    var post_data = querystring.stringify({
      'suba' : letters[i],
      'subc': 'All'
    });

    var post_options = {
      host: 'realmshelps.net',
      port: '80',
      path: '/cgi-bin/monsteral.pl',
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Content-Length': post_data.length
      }
    };

    var post_req = http.request(post_options, function(res) {
      var fullData = "";

      res.on('data', function (data) {
        fullData += data;
      });

      res.on('end', function (data) {
        var $ = cheerio.load(fullData);
        var str = "";
        $('table.table').find("a").each(function(index, node) { // cheerio
          var $node = $(node);
          var href = $node.attr('href');
          if(href.substring(0,2) == ".."){
            href = "http://realmshelps.net" + $node.attr('href').substring(2).replace("α", "&alpha");
            creaturesCrawler.queue(href, parsecreature);
          }
        });
      });
    });

    post_req.write(post_data);
    post_req.end();

  }
}
crawlcreatures();
