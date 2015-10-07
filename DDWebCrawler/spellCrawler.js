var fs = require('fs');
var Crawler = require('node-simple-crawler');
var querystring = require('querystring');
var http = require('http');
var cheerio = require('cheerio');
var iconv = require('iconv-lite');

var targetFileName;
var spells= [];
var errors = {};
var $;

var path= '../DDAssistant/db'
if( !fs.existsSync(path) ){
  fs.mkdirSync(path);
}
var spellsCrawler = new Crawler(
  {
    concurrent: 10,
    logs: false,
    request: { headers: { 'user-agent': 'Mozilla/5.0 (Windows; U; Windows NT 5.1; fr; rv:1.9.0.1) Gecko/2008070208 Firefox/3.0.1' } },
    decodeTo: 'utf8',
    decodeFrom: '', // e.g. 'win-1251'
    callback:  function(err, visited){if (err) { throw err; }}
  }
);

var post_options = {
  host: 'mereinetidor.fr',
  path: '/encyclodd/sorts/sorts-dd3-5.html'
};

var lastWord= function(s, char){
  if( !char ) {
    char= ' ';
  }
  var index= s.lastIndexOf(char);
  return s.substring(index+char.length, s.length);
}

var parseSpell = function (err, url, document){
  if (err) {
    if(!errors[url]){
      spellsCrawler.queue(url);
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
//  console.log(document.jQuery )
  var $ = document.$;//cheerio.load(document.body);
  var searched= ['portee', 'duree', 'zoneeffet', 'effet', 'cible', 'incantation', 'jds', 'rm', 'composantes_materielles']

  var spell= {
    nom: $('#title').text().trim(),
    niveau: {},
    ecole: lastWord( $('#ecole_text').text(), ': ').trim(),
    resume: $('#bulle').text().trim(),
    description: $('#text').text().trim()
  }
  var niveauxArray= $('#classeniveau_text').text().split(':')[1].split(', ');
  for( var i= 0; i < niveauxArray.length; i++ ) {
    var ignore= niveauxArray[i].indexOf(',')
    if( ignore >= 0 ) {
      niveauxArray[i]= niveauxArray[i].substring(0, ignore);
    }
    if( niveauxArray[i].length > 0 ) {
      var compl='';
      complIndex= niveauxArray[i].indexOf('(');
      if( complIndex > 0 ) {
        compl= niveauxArray[i].substring(complIndex);
        niveauxArray[i]= niveauxArray[i].substring(0, complIndex).trim();
      }
      var lastSpace= niveauxArray[i].lastIndexOf(' ');
      if( complIndex > 0 ) {
        spell.niveau[niveauxArray[i].substring(0, lastSpace).trim()] = niveauxArray[i].substring(lastSpace+1)+compl;
      }
      else {
        spell.niveau[niveauxArray[i].substring(0, lastSpace).trim()] = Number(niveauxArray[i].substring(lastSpace+1) );
      }
    }
  }
  for( var i= 0; i < searched.length; i++ ) {
    spell[searched[i]]= lastWord( $('#'+searched[i]).text(), ': ').trim();
  }
  if( spell.nom ) {
    spells.push(spell);
    console.log(spell.nom);
    console.log(spell.niveau)
  }
  if(spellsCrawler.pending.length == 0 && spellsCrawler.active.length == 0){
    fs.writeFile(targetFileName, JSON.stringify(spells), function (err) {
      if (err) return console.log(err);
      console.log(errors);
    });
  }
}

var parseResultsPage=function(err, url, document){
  console.log('querying individual spell');
  var $ = document.$;//cheerio.load(fullData);
  $('table#flexitable').find("a.fc_item_title").each(function(index, node) { // cheerio
    var $node = $(node);
    var href = 'http://'+post_options.host+$node.attr('href');
    spellsCrawler.queue(href, parseSpell);
  });
  var nextPageLink= $('.pagination a[title="Suivant"]').attr('href');
  if( nextPageLink ){
    console.log('Next page');
    spellsCrawler.queue( 'http://'+post_options.host+nextPageLink, parseResultsPage );
  }
  else {
    console.log(spells.length+ ' spells parsed');
  }
}
var crawlSpells = function( casterClass, level){
  var params = "?p=all";
  targetFileName= path+'/Spells';
  if( casterClass ) {
    params+= "&filter_74="+casterClass;//Ensorceleur/Magicien";
    targetFileName+='_'+casterClass.substring(0,3);
  }
  if( level ) {
    params+= "&filter_76="+level;
    targetFileName+= '_'+level;
  }
  targetFileName+= '.json';
  spellsCrawler.queue( 'http://'+post_options.host+post_options.path+params, parseResultsPage );
  /*
  post_options.path= '/encyclodd/sorts/sorts-dd3-5.html'+params,
  post_options.port= '80',
  post_options.method= 'GET',
  post_options.headers= {
    'Content-Type': 'application/x-www-form-urlencoded',
    'Content-Length': params.length
  }

  console.log('getting spells...')
  var post_req = http.request(post_options, function(res) {
    var fullData = "";

    res.on('data', function (data) {
      fullData += data;
    });

    res.on('end', parseResultsPage.);
  });

  post_req.write(params);
  post_req.end();*/
}
crawlSpells("Ensorceleur/Magicien", 6);
