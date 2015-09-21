var fs = require('fs');
var Crawler = require('node-simple-crawler');

var featsString = "";
var creaturesString = "";
var errors = {};

var featsCrawler = new Crawler(
  {
    concurrent: 10,
    logs: false,
    request: { headers: { 'user-agent': 'Mozilla/5.0 (Windows; U; Windows NT 5.1; fr; rv:1.9.0.1) Gecko/2008070208 Firefox/3.0.1' } },
    decodeTo: 'utf8',
    decodeFrom: '', // e.g. 'win-1251'
    callback:  function(err, visited){if (err) { throw err; }}
  }
);


var parseFeat = function (err, url, document){
  if (err) {
    if(!errors[url]){
      featsCrawler.queue(url);
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
  featsString += "<br/>"
  featsString += $('div.top').html();
  console.log($('h1').text());

  if(featsCrawler.pending.length == 0 && featsCrawler.active.length == 0){
    fs.writeFile('feats.html', featsString, function (err) {
      if (err) return console.log(err);
      console.log('Parsing feats done');
      console.log(errors);
    });
  }
}

var crawlFeats = function(){
  var featListUrl = "http://realmshelps.net/cgi-bin/feat-form.pl";
  featsCrawler.queue(featListUrl, function(err, url, document){
    if (err) {console.log('Error url: '+ url); throw err;}

    var $ = document.$;
    var nb = 0;
    $('table.table').find("a").each(function(index, node) { // cheerio
      var $node = $(node);
      var href = "http://realmshelps.net" + $node.attr('href').substring(2);
      // if(nb++ < 100)
      featsCrawler.queue(href, parseFeat);
    });

  });
}
crawlFeats();
