mw.loader.implement("ext.jquery.qtip.styles",function($,jQuery){},{"css":[".qtip{position:absolute;left:-28000px;top:-28000px;display:none;max-width:280px;min-width:50px;font-size:10.5px;line-height:12px;direction:ltr;box-shadow:none;padding:0}.qtip-content{position:relative;padding:5px 9px;overflow:hidden;text-align:left;word-wrap:break-word}.qtip-titlebar{position:relative;padding:5px 35px 5px 10px;overflow:hidden;border-width:0 0 1px;font-weight:bold}.qtip-titlebar + .qtip-content{border-top-width:0 !important} .qtip-close{position:absolute;right:-9px;top:-9px;cursor:pointer;outline:medium none;border-width:1px;border-style:solid;border-color:transparent}.qtip-titlebar .qtip-close{right:4px;top:50%;margin-top:-9px}* html .qtip-titlebar .qtip-close{top:16px} .qtip-titlebar .ui-icon,.qtip-icon .ui-icon{display:block;text-indent:-1000em;direction:ltr}.qtip-icon,.qtip-icon .ui-icon{-moz-border-radius:3px;-webkit-border-radius:3px;border-radius:3px;text-decoration:none}.qtip-icon .ui-icon{width:18px;height:14px;line-height:14px;text-align:center;text-indent:0;font:normal bold 10px/13px Tahoma,sans-serif;color:inherit;background:transparent none no-repeat -100em -100em} .qtip-focus{} .qtip-hover{} .qtip-default{border-width:1px;border-style:solid;border-color:#F1D031;background-color:#FFFFA3;color:#555}.qtip-default .qtip-titlebar{background-color:#FFEF93}.qtip-default .qtip-icon{border-color:#CCC;background:#F1F1F1;color:#777}.qtip-default .qtip-titlebar .qtip-close{border-color:#AAA;color:#111} .qtip-light{background-color:white;border-color:#E2E2E2;color:#454545}.qtip-light .qtip-titlebar{background-color:#f1f1f1} .qtip-dark{background-color:#505050;border-color:#303030;color:#f3f3f3}.qtip-dark .qtip-titlebar{background-color:#404040}.qtip-dark .qtip-icon{border-color:#444}.qtip-dark .qtip-titlebar .ui-state-hover{border-color:#303030} .qtip-cream{background-color:#FBF7AA;border-color:#F9E98E;color:#A27D35}.qtip-cream .qtip-titlebar{background-color:#F0DE7D}.qtip-cream .qtip-close .qtip-icon{background-position:-82px 0} .qtip-red{background-color:#F78B83;border-color:#D95252;color:#912323}.qtip-red .qtip-titlebar{background-color:#F06D65}.qtip-red .qtip-close .qtip-icon{background-position:-102px 0}.qtip-red .qtip-icon{border-color:#D95252}.qtip-red .qtip-titlebar .ui-state-hover{border-color:#D95252} .qtip-green{background-color:#CAED9E;border-color:#90D93F;color:#3F6219}.qtip-green .qtip-titlebar{background-color:#B0DE78}.qtip-green .qtip-close .qtip-icon{background-position:-42px 0} .qtip-blue{background-color:#E5F6FE;border-color:#ADD9ED;color:#5E99BD}.qtip-blue .qtip-titlebar{background-color:#D0E9F5}.qtip-blue .qtip-close .qtip-icon{background-position:-2px 0}.qtip-shadow{-webkit-box-shadow:1px 1px 3px 1px rgba(0,0,0,0.15);-moz-box-shadow:1px 1px 3px 1px rgba(0,0,0,0.15);box-shadow:1px 1px 3px 1px rgba(0,0,0,0.15)} .qtip-rounded,.qtip-tipsy,.qtip-bootstrap{-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px}.qtip-rounded .qtip-titlebar{-moz-border-radius:4px 4px 0 0;-webkit-border-radius:4px 4px 0 0;border-radius:4px 4px 0 0} .qtip-youtube{-moz-border-radius:2px;-webkit-border-radius:2px;border-radius:2px;-webkit-box-shadow:0 0 3px #333;-moz-box-shadow:0 0 3px #333;box-shadow:0 0 3px #333;color:white;border-width:0;background:#4A4A4A;background-image:-webkit-gradient(linear,left top,left bottom,color-stop(0,#4A4A4A),color-stop(100%,black));background-image:-webkit-linear-gradient(top,#4A4A4A 0,black 100%);background-image:-moz-linear-gradient(top,#4A4A4A 0,black 100%);background-image:-ms-linear-gradient(top,#4A4A4A 0,black 100%);background-image:-o-linear-gradient(top,#4A4A4A 0,black 100%)}.qtip-youtube .qtip-titlebar{background-color:#4A4A4A;background-color:rgba(0,0,0,0)}.qtip-youtube .qtip-content{padding:.75em;font:12px arial,sans-serif;filter:progid:DXImageTransform.Microsoft.Gradient(GradientType=0,StartColorStr=#4a4a4a,EndColorStr=#000000);-ms-filter:\"progid:DXImageTransform.Microsoft.Gradient(GradientType=0,StartColorStr=#4a4a4a,EndColorStr=#000000);\"}.qtip-youtube .qtip-icon{border-color:#222}.qtip-youtube .qtip-titlebar .ui-state-hover{border-color:#303030} .qtip-jtools{background:#232323;background:rgba(0,0,0,0.7);background-image:-webkit-gradient(linear,left top,left bottom,from(#717171),to(#232323));background-image:-moz-linear-gradient(top,#717171,#232323);background-image:-webkit-linear-gradient(top,#717171,#232323);background-image:-ms-linear-gradient(top,#717171,#232323);background-image:-o-linear-gradient(top,#717171,#232323);border:2px solid #ddd;border:2px solid rgba(241,241,241,1);-moz-border-radius:2px;-webkit-border-radius:2px;border-radius:2px;-webkit-box-shadow:0 0 12px #333;-moz-box-shadow:0 0 12px #333;box-shadow:0 0 12px #333} .qtip-jtools .qtip-titlebar{background-color:transparent;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#717171,endColorstr=#4A4A4A);-ms-filter:\"progid:DXImageTransform.Microsoft.gradient(startColorstr=#717171,endColorstr=#4A4A4A)\"}.qtip-jtools .qtip-content{filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#4A4A4A,endColorstr=#232323);-ms-filter:\"progid:DXImageTransform.Microsoft.gradient(startColorstr=#4A4A4A,endColorstr=#232323)\"}.qtip-jtools .qtip-titlebar,.qtip-jtools .qtip-content{background:transparent;color:white;border:0 dashed transparent}.qtip-jtools .qtip-icon{border-color:#555}.qtip-jtools .qtip-titlebar .ui-state-hover{border-color:#333} .qtip-cluetip{-webkit-box-shadow:4px 4px 5px rgba(0,0,0,0.4);-moz-box-shadow:4px 4px 5px rgba(0,0,0,0.4);box-shadow:4px 4px 5px rgba(0,0,0,0.4);background-color:#D9D9C2;color:#111;border:0 dashed transparent}.qtip-cluetip .qtip-titlebar{background-color:#87876A;color:white;border:0 dashed transparent}.qtip-cluetip .qtip-icon{border-color:#808064}.qtip-cluetip .qtip-titlebar .ui-state-hover{border-color:#696952;color:#696952} .qtip-tipsy{background:black;background:rgba(0,0,0,.87);color:white;border:0 solid transparent;font-size:11px;font-family:'Lucida Grande',sans-serif;font-weight:bold;line-height:16px;text-shadow:0 1px black}.qtip-tipsy .qtip-titlebar{padding:6px 35px 0 10px;background-color:transparent}.qtip-tipsy .qtip-content{padding:6px 10px}.qtip-tipsy .qtip-icon{border-color:#222;text-shadow:none}.qtip-tipsy .qtip-titlebar .ui-state-hover{border-color:#303030} .qtip-tipped{border:3px solid #959FA9;-moz-border-radius:3px;-webkit-border-radius:3px;border-radius:3px;background-color:#F9F9F9;color:#454545;font-weight:normal;font-family:serif}.qtip-tipped .qtip-titlebar{border-bottom-width:0;color:white;background:#3A79B8;background-image:-webkit-gradient(linear,left top,left bottom,from(#3A79B8),to(#2E629D));background-image:-webkit-linear-gradient(top,#3A79B8,#2E629D);background-image:-moz-linear-gradient(top,#3A79B8,#2E629D);background-image:-ms-linear-gradient(top,#3A79B8,#2E629D);background-image:-o-linear-gradient(top,#3A79B8,#2E629D);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#3A79B8,endColorstr=#2E629D);-ms-filter:\"progid:DXImageTransform.Microsoft.gradient(startColorstr=#3A79B8,endColorstr=#2E629D)\"}.qtip-tipped .qtip-icon{border:2px solid #285589;background:#285589}.qtip-tipped .qtip-icon .ui-icon{background-color:#FBFBFB;color:#555} .qtip-bootstrap{ font-size:14px;line-height:20px;color:#333333; padding:1px;background-color:#ffffff;border:1px solid #ccc;border:1px solid rgba(0,0,0,0.2);-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px;-webkit-box-shadow:0 5px 10px rgba(0,0,0,0.2);-moz-box-shadow:0 5px 10px rgba(0,0,0,0.2);box-shadow:0 5px 10px rgba(0,0,0,0.2);-webkit-background-clip:padding-box;-moz-background-clip:padding;background-clip:padding-box}.qtip-bootstrap .qtip-titlebar{ padding:8px 14px;margin:0;font-size:14px;font-weight:normal;line-height:18px;background-color:#f7f7f7;border-bottom:1px solid #ebebeb;-webkit-border-radius:5px 5px 0 0;-moz-border-radius:5px 5px 0 0;border-radius:5px 5px 0 0}.qtip-bootstrap .qtip-titlebar .qtip-close{ right:11px;top:45%;border-style:none}.qtip-bootstrap .qtip-content{ padding:9px 14px}.qtip-bootstrap .qtip-icon{ background:transparent}.qtip-bootstrap .qtip-icon .ui-icon{ width:auto;height:auto; float:right;font-size:20px;font-weight:bold;line-height:18px;color:#000000;text-shadow:0 1px 0 #ffffff;opacity:0.2;filter:alpha(opacity=20)}.qtip-bootstrap .qtip-icon .ui-icon:hover{ color:#000000;text-decoration:none;cursor:pointer;opacity:0.4;filter:alpha(opacity=40)} .qtip:not(.ie9haxors) div.qtip-content,.qtip:not(.ie9haxors) div.qtip-titlebar{filter:none;-ms-filter:none}.qtip .qtip-tip{margin:0 auto;overflow:hidden;z-index:10} x:-o-prefocus,.qtip .qtip-tip{visibility:hidden}.qtip .qtip-tip,.qtip .qtip-tip .qtip-vml,.qtip .qtip-tip canvas{position:absolute;color:#123456;background:transparent;border:0 dashed transparent}.qtip .qtip-tip canvas{top:0;left:0}.qtip .qtip-tip .qtip-vml{behavior:url(\"//www.dandwiki.com/w/extensions/SemanticMediaWiki/resources/jquery/#default#VML\");display:inline-block;visibility:visible}\n/* cache key: ddwikidb-wdd_:resourceloader:filter:minify-css:7:c73dced4621b94e1c3847fb146934dd2 */"]},{});mw.loader.implement("ext.smw.style",function($,jQuery){},{"css":["span.smwbuiltin,span.smwttactiveinline span.smwbuiltin{font-style:italic} div.smwpre{white-space:pre;font-family:monospace;padding:1em;border:1px dashed #2f6fab;color:black;background-color:#f9f9f9;line-height:1.1em;margin-bottom:0.5em;margin-top:0.5em} #smwfootbr{clear:both} span.smwsortkey{display:none} a.sortheader:hover{text-decoration:none} div.smwtimeline{border:1px solid #AAAAAA;background-color:#F9F9F9;  }span.smwtlevent,span.smwtlband,span.smwtlsize,span.smwtlposition{display:none;speak:none}span.smwtlcomment{font-style:italic;padding:5px} div.smwfact{clear:both;background-color:#F9F9F9;padding:5px;margin-top:1em;border:1px solid #AAAAAA;font-size:95%}div.smwfact td,div.smwfact tr,div.smwfact table{background-color:#F9F9F9}span.smwfactboxhead{font-size:110%;font-weight:bold;float:left}table.smwfacttable{border-top:1px dotted #AAAAAA;width:100%;clear:both}td.smwpropname,th.smwpropname,td.smwspecname{text-align:right;vertical-align:top;padding-right:1em}td.smwprops,td.smwspecs{vertical-align:top;width:75%}div.smwhr hr{background-color:#DDDDDD;color:#DDDDDD} span.smwwarning{color:#888888;font-style:italic;font-size:90%} span.smwsearchicon{padding-right:16px;margin-right:2px;color:#888888;background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAMAAABhq6zVAAABC1BMVEU+S114jayTpb6Im7eMn7qhsceBlbOYqcKXp8GDl7N2i6rJ0uCYqcJogKB9kq+KnLipt81qgKF8kK9qgKF4jayntstheJpsgqOSo75RaIxWbpCIm7fAy9tlfJ5keptedZdHXX5bcpWBlbOersajssmVp79lfJ5thKN2i6phd5lTa45GW3lPZ4plfJ5le5xRaYxbcpV3jKt2i6pWbpBKYoVOZolSao2HmrZ4jaxTa45JYYRJYYSHmrZedZdFWnhTa45ieZtVbZCzv9Lm6/Ha4Onp7fKks8rb4uvf5e3h5u7X3um2wtXQ2OTAy9vW3efl6fCmtcrJ0uDGz96jssm5xdaruc6uu8+9yNnt8PXd7KeZAAAAQnRSTlMACfbevtlP8sRPTv2lFfRF2Cz1A7jZLdG4HFbm/q8vBAxjxO/syrHaxk0EByM4NyUrutRNBAI6xeJdADjU4QFO3NoNTLabAAAAeElEQVQIHQXBvQ7BUACA0e+7P020EQsDC4NBYrZJ38BTewcmg8XGomnjRso50QlUuSkA1p9TenF2+oRUH7/DzMoChJJH3n2bEpDS0CS7kAVCntd9txhjBFzp7he86h03qqp6kb2qbm8qABy06Y0A8FjHcTkIANCqf7L2G5qa4UzTAAAAAElFTkSuQmCC) center right no-repeat;background:url(//www.dandwiki.com/w/extensions/SemanticMediaWiki/resources/smw/../images/searchgray_iconsmall.png?2014-11-01T18:25:00Z) center right no-repeat!ie}#bodyContent span.smwsearch a{padding-right:16px;margin-right:2px;color:#888888;background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAMAAABhq6zVAAABC1BMVEU+S114jayTpb6Im7eMn7qhsceBlbOYqcKXp8GDl7N2i6rJ0uCYqcJogKB9kq+KnLipt81qgKF8kK9qgKF4jayntstheJpsgqOSo75RaIxWbpCIm7fAy9tlfJ5keptedZdHXX5bcpWBlbOersajssmVp79lfJ5thKN2i6phd5lTa45GW3lPZ4plfJ5le5xRaYxbcpV3jKt2i6pWbpBKYoVOZolSao2HmrZ4jaxTa45JYYRJYYSHmrZedZdFWnhTa45ieZtVbZCzv9Lm6/Ha4Onp7fKks8rb4uvf5e3h5u7X3um2wtXQ2OTAy9vW3efl6fCmtcrJ0uDGz96jssm5xdaruc6uu8+9yNnt8PXd7KeZAAAAQnRSTlMACfbevtlP8sRPTv2lFfRF2Cz1A7jZLdG4HFbm/q8vBAxjxO/syrHaxk0EByM4NyUrutRNBAI6xeJdADjU4QFO3NoNTLabAAAAeElEQVQIHQXBvQ7BUACA0e+7P020EQsDC4NBYrZJ38BTewcmg8XGomnjRso50QlUuSkA1p9TenF2+oRUH7/DzMoChJJH3n2bEpDS0CS7kAVCntd9txhjBFzp7he86h03qqp6kb2qbm8qABy06Y0A8FjHcTkIANCqf7L2G5qa4UzTAAAAAElFTkSuQmCC) center right no-repeat;background:url(//www.dandwiki.com/w/extensions/SemanticMediaWiki/resources/smw/../images/searchgray_iconsmall.png?2014-11-01T18:25:00Z) center right no-repeat!ie}#bodyContent span.smwsearch a:hover{text-decoration:none;color:#0000FF;padding-right:18px;margin-right:0px;background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAALySURBVDgRlcFraNVlHMDx7+95nv/zP+d/LnObeVtz2uyCrRUVDAIHMbIXltUgKRYR7kWvupjYDSEkgkgoKCiJfGeRzqw0CvYuahBWyrZWuWihuWNrZ+e2c87OZf//U1DB8EXU52P27XuV9takiiVS95ZjV+xdjK3uxbO0sFi15ewnlBYO1pZqP9YbTZQSLmeUOF1eNs+fj219QXdt1i2rfXwPlpxKho3qbpme3B7+/N2wUoyKCJcz9VB2ZFfdcKDtxh7p3hiRiMFSDfKFJjadwF/fd+V8pfhmYXK83ynJgLCSKanU47Et18qmDsc1axXtAlPzEekOS7XhSK3SmNt6uuemJnc2K5VDog0rmaptvWXtmgRBLKJNBL/h8DyhPRBqScGKI31dB2c8c2exsHhIW8tKZtmm/MBGFIohZ2oRQaDYkFYECgLAOjBa0ajVk8VSGc+3rGSa+Us18XQ8bIREgSKIC74G5aAdsEAjjCgXioXSYgVTX0bE8Q+zMD0xVs2V7tKtCepNiJRQB1JAClgjwskvvuXCzOypWn2ZeLiEA5wD58DkZs69fO7UyYGBPQ/FYxoi51D8JRBhNl/i05FRWlpaLtzReZbOxiSzRcNcCXIVMErL2E+fffSYNe61/t33pUxbEgeIwOmpGY6/fQxj4mzrTe/vyUz0zzflLU/CeSOgcRhRiqhZPzx+/OjEr998tXdDd2dfPBHT1flc4eL0Lyc6OzeeXt9WHu52Xw5etTk9UP0+f2szsg87XMEhGP4kWiNEXxczmQfERQSpBIXMHKVcka1XO/QP76/rvr9rsOf2IezIu3f/PpY/8lvRewTIGv4mImjPw/MtnvXwYhbtB9jqefzKxaMfj+R74+u6nrh+1xDN8MiO7Gj+8ELZDhv+lcOJRhtTuZRt7Hn9xQ/do88MPnnz0BAPyns73ziRf8fwH/lWu9mF5acPHvggevalXU+137QN9fn4PYb/wfN0M1cKn3tl/7FNbVt6tk9L39k/AH8KLAsrDQkDAAAAAElFTkSuQmCC) center right no-repeat;background:url(//www.dandwiki.com/w/extensions/SemanticMediaWiki/resources/smw/../images/search_icon.png?2014-11-01T18:25:00Z) center right no-repeat!ie}#bodyContent span.swmfactboxheadbrowse a{padding-right:16px;margin-right:2px;color:#000000;background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAMAAABhq6zVAAAA5FBMVEUAAADb3uv///+gqcBJYqGTmq24v9KJkamboLBtfqOnrbuSmqyqr7yVnK3o6e3n6OrKzdaWna7O0NWMlKiQl6qWm6yRma3DxczEyM+Olqyeo7J+iaamq7qZoLGMlKrg4eiYobqFjqfBxMyQl6hXbaGXnK+hprmcobPEx9BZbaGkqriIkayjp7d1g6iztsSytsZzf6GcobSaobjq6++Umq5abZ6aoLJre6NqeqJ7hqfg4umvtsp0g6h9iaff4el3hKVld6aUoL6wt8meo7SXnbCUm66Jkqnq6+64usRfcqOxs8Dm5+teFG05AAAAAXRSTlMAQObYZgAAAH9JREFUeF4dymMSRDEABOGZ5HFt27Zt3v8+m833r6saSqDl6aSC0ELhXN7r80egVBYZRmOMJ5LAIV0lsy55LRRRKlNYbs0SrDfQpBCybUgh2EXvH4aOPgZDtRkjtY0nmM7m5HtJrtYbYLvb07Z5PJ2hXMybad4fEtrz5TifL4AfAxMLmJTt7hwAAAAASUVORK5CYII=) center right no-repeat;background:url(//www.dandwiki.com/w/extensions/SemanticMediaWiki/resources/smw/../images/browse_iconsmall.png?2014-11-01T18:25:00Z) center right no-repeat!ie}#bodyContent span.swmfactboxheadbrowse a:hover{text-decoration:none;color:#0000FF;padding-right:18px;margin-right:0px;background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAA81BMVEUAAADByOQOLn7///8BInfg5O2xuthsf7ODk8CmqbEnQ4slQYoYNYJqea6BhZaSlJ9kbo5fc6xld62/v8Fnea6BhZdbb6lKY6axsrWIjJe/wMQ6UZOCkMVoeq6Gk79BWZpBWJqCkr4uSo8mRI8PLnqio6plcppIXp+LjprFxsgmQYMrRo4nRJI6TX+ytLyKl8xseah7ir9cbqUDJXeJl8xWbLBue6xPZaeYm6V+hqCLl841S34MLXwsSZJVaasSMYBcaYZUZphLYqBsfrFKYaB3iLcwS5EvSpFjeK1neq4zTpE2ToxQaKlSXoIMKW9idKyur7PDoCJEAAAAAXRSTlMAQObYZgAAAJtJREFUGFdlT8USg1AQ292HQ93d3d3dvf//NYWBHhhyS2ZiAAYCnpC7GoU/al5XsjPs9V9fk8tEPn8q+AlH6jGDxxMrwnQmm8N8oVjShXLljXhS1ANio9kCaK+7yIQ9aUeB4XgyhdkcGZOWA44kxnC0hZ3OeXHDcSTyurJwCg6LGXom7WKFmrVXRb1Ztcawu20YyI+nbbrznP3+D9crFuL3dLY6AAAAAElFTkSuQmCC) center right no-repeat;background:url(//www.dandwiki.com/w/extensions/SemanticMediaWiki/resources/smw/../images/browse_icon.png?2014-11-01T18:25:00Z) center right no-repeat!ie}#bodyContent span.smwbrowse a{padding-right:16px;margin-right:2px;color:#888888;background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAMAAABhq6zVAAAA5FBMVEUAAADb3uv///+gqcBJYqGTmq24v9KJkamboLBtfqOnrbuSmqyqr7yVnK3o6e3n6OrKzdaWna7O0NWMlKiQl6qWm6yRma3DxczEyM+Olqyeo7J+iaamq7qZoLGMlKrg4eiYobqFjqfBxMyQl6hXbaGXnK+hprmcobPEx9BZbaGkqriIkayjp7d1g6iztsSytsZzf6GcobSaobjq6++Umq5abZ6aoLJre6NqeqJ7hqfg4umvtsp0g6h9iaff4el3hKVld6aUoL6wt8meo7SXnbCUm66Jkqnq6+64usRfcqOxs8Dm5+teFG05AAAAAXRSTlMAQObYZgAAAH9JREFUeF4dymMSRDEABOGZ5HFt27Zt3v8+m833r6saSqDl6aSC0ELhXN7r80egVBYZRmOMJ5LAIV0lsy55LRRRKlNYbs0SrDfQpBCybUgh2EXvH4aOPgZDtRkjtY0nmM7m5HtJrtYbYLvb07Z5PJ2hXMybad4fEtrz5TifL4AfAxMLmJTt7hwAAAAASUVORK5CYII=) center right no-repeat;background:url(//www.dandwiki.com/w/extensions/SemanticMediaWiki/resources/smw/../images/browse_iconsmall.png?2014-11-01T18:25:00Z) center right no-repeat!ie}#bodyContent span.smwbrowse a:hover{text-decoration:none;color:#0000FF;padding-right:18px;margin-right:0px;background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAA81BMVEUAAADByOQOLn7///8BInfg5O2xuthsf7ODk8CmqbEnQ4slQYoYNYJqea6BhZaSlJ9kbo5fc6xld62/v8Fnea6BhZdbb6lKY6axsrWIjJe/wMQ6UZOCkMVoeq6Gk79BWZpBWJqCkr4uSo8mRI8PLnqio6plcppIXp+LjprFxsgmQYMrRo4nRJI6TX+ytLyKl8xseah7ir9cbqUDJXeJl8xWbLBue6xPZaeYm6V+hqCLl841S34MLXwsSZJVaasSMYBcaYZUZphLYqBsfrFKYaB3iLcwS5EvSpFjeK1neq4zTpE2ToxQaKlSXoIMKW9idKyur7PDoCJEAAAAAXRSTlMAQObYZgAAAJtJREFUGFdlT8USg1AQ292HQ93d3d3dvf//NYWBHhhyS2ZiAAYCnpC7GoU/al5XsjPs9V9fk8tEPn8q+AlH6jGDxxMrwnQmm8N8oVjShXLljXhS1ANio9kCaK+7yIQ9aUeB4XgyhdkcGZOWA44kxnC0hZ3OeXHDcSTyurJwCg6LGXom7WKFmrVXRb1Ztcawu20YyI+nbbrznP3+D9crFuL3dLY6AAAAAElFTkSuQmCC) center right no-repeat;background:url(//www.dandwiki.com/w/extensions/SemanticMediaWiki/resources/smw/../images/browse_icon.png?2014-11-01T18:25:00Z) center right no-repeat!ie}#bodyContent span.smwmap a{padding-right:20px;color:#888888;background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAANkE3LLaAgAAAzBJREFUOBGlwTtsGwUAgOH/zufHOe9zHBzsJM6DhpRUCWmjCiolKgOiS6VKrWBghSUswEAlJjYGRlQECypQhoIEAqlNuwSiJhSqkJAqbR40pnbjR/w6+x72+Xw+itgqMfF98D8JPCn2thwfDZ9/cXro7LOjfSflgLetpBoP1u9llm7/kbqirn+wyX/pmLz4wvsfXV9PplW30XBcu+m4dtNxrUbTNcyGu7r2sH72jc8/hHmJJwUm3pu79OUvVcO03ZJad1PpirtxL+3e2Uy5v24k3b1EwVWrlltW6+75hS++hgseHvPwjyPv9L72yuyNhddPhTXDIpEqki/p6GaDoOzlsKgjCCJOs4VmWBwd7T+2eDerGwdLqxKPdcltb710cnwgmVHJl3R2EjkkSaTVclG6g9hNh/HhPrySh939Am3BAPPHn7l4tfDuZQ+86RVD8scdbb6wLHvJ5quoWo1sQaOq1ckVdAajCqeOD2M3HBwHDgsGubwp7z3MbYn+8Z6oKAjDK+sJvrm+gVeSmBqP4TgumztZDrIauUONRKpMOqfRdFoUSzXUqondap3wBMJzMURhIRDwismMymC/wpn5CSaPRCiWDXp7giCIfHJllWLZJBLqolypc215i2yxui02/T7d5/PYlWqNnk6ZzZ00uw/yyD4fF85MMTsdY2RAQdOaJA+q5EsmZr2BZdv4vP6qx8nphtw/8qrfHwjrhoUousSjvcT6u7h5a4fFn7fJ5U062/y4Lgz1K+wk8rQQ+HN365IEa7aZ6f4+Mn3uaPJRlopmMRZXiD3dgW40qNUddMnCrNsc5FRUrYZhNUhnD0v1/a9uioBkZVcWq6WD0lg8Qme7TKVqIXqgL9TO2GAIBBerYeP3SeylcgRkmcz24lUwyx4gAM1uvZgkEp898fzkiNinyKzcSVBSTSLhDtqDPsJKO0NRhZCisPLTd3fVxLXPgLwHaAESzYqhZrfVztBQPBobaotGFGYmY4S62wkGZXqVbvb2s+6NHy7fytz/9lPgPpAR+JcE9AIDIE6MHzs9N3/65ZmZqeeeQhCkR+m8/vvab3vLSz8u62rqNvAXkAFqfwOkPI+h92xJFAAAAABJRU5ErkJggg==) center right no-repeat;background:url(//www.dandwiki.com/w/extensions/SemanticMediaWiki/resources/smw/../images/world.png?2014-11-01T18:25:00Z) center right no-repeat!ie}#bodyContent span.smwmap a:hover{padding-right:20px;color:#0000FF;background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAANkE3LLaAgAAAzBJREFUOBGlwTtsGwUAgOH/zufHOe9zHBzsJM6DhpRUCWmjCiolKgOiS6VKrWBghSUswEAlJjYGRlQECypQhoIEAqlNuwSiJhSqkJAqbR40pnbjR/w6+x72+Xw+itgqMfF98D8JPCn2thwfDZ9/cXro7LOjfSflgLetpBoP1u9llm7/kbqirn+wyX/pmLz4wvsfXV9PplW30XBcu+m4dtNxrUbTNcyGu7r2sH72jc8/hHmJJwUm3pu79OUvVcO03ZJad1PpirtxL+3e2Uy5v24k3b1EwVWrlltW6+75hS++hgseHvPwjyPv9L72yuyNhddPhTXDIpEqki/p6GaDoOzlsKgjCCJOs4VmWBwd7T+2eDerGwdLqxKPdcltb710cnwgmVHJl3R2EjkkSaTVclG6g9hNh/HhPrySh939Am3BAPPHn7l4tfDuZQ+86RVD8scdbb6wLHvJ5quoWo1sQaOq1ckVdAajCqeOD2M3HBwHDgsGubwp7z3MbYn+8Z6oKAjDK+sJvrm+gVeSmBqP4TgumztZDrIauUONRKpMOqfRdFoUSzXUqondap3wBMJzMURhIRDwismMymC/wpn5CSaPRCiWDXp7giCIfHJllWLZJBLqolypc215i2yxui02/T7d5/PYlWqNnk6ZzZ00uw/yyD4fF85MMTsdY2RAQdOaJA+q5EsmZr2BZdv4vP6qx8nphtw/8qrfHwjrhoUousSjvcT6u7h5a4fFn7fJ5U062/y4Lgz1K+wk8rQQ+HN365IEa7aZ6f4+Mn3uaPJRlopmMRZXiD3dgW40qNUddMnCrNsc5FRUrYZhNUhnD0v1/a9uioBkZVcWq6WD0lg8Qme7TKVqIXqgL9TO2GAIBBerYeP3SeylcgRkmcz24lUwyx4gAM1uvZgkEp898fzkiNinyKzcSVBSTSLhDtqDPsJKO0NRhZCisPLTd3fVxLXPgLwHaAESzYqhZrfVztBQPBobaotGFGYmY4S62wkGZXqVbvb2s+6NHy7fytz/9lPgPpAR+JcE9AIDIE6MHzs9N3/65ZmZqeeeQhCkR+m8/vvab3vLSz8u62rqNvAXkAFqfwOkPI+h92xJFAAAAABJRU5ErkJggg==) center right no-repeat;background:url(//www.dandwiki.com/w/extensions/SemanticMediaWiki/resources/smw/../images/world.png?2014-11-01T18:25:00Z) center right no-repeat!ie}#bodyContent span.rdflink{float:right}#bodyContent span.rdflink a{padding-right:20px;color:#888888;background:url(data:image/gif;base64,R0lGODlhEQASAIQeAIWjzhpTo0h1tvH0+SpeqUh1tWeMwjlqr+Hp89Ld7cLR5rPG4RpSo8PS53aYyDhpr5Wv1FiBvO/z+KS62uDo8ileqWaMwXWXx7LF4KO62pSu1FeAu9Hc7P///wtHnQtHnSH+FUNyZWF0ZWQgd2l0aCBUaGUgR0lNUAAh+QQBAAAfACwAAAAAEQASAAAFU+AnjuQneKhQriclpSvJSC/qxaNX2/hn/6pY6udRAX03k82Y6dROJKjI01H8VknfDoXNbbmkougEBC+DZDES1aHAcChKZ9nzza89HbGefvfSDh8hADs=) center right no-repeat;background:url(//www.dandwiki.com/w/extensions/SemanticMediaWiki/resources/smw/../images/rdf_flyer.18.gif?2014-11-01T18:25:00Z) center right no-repeat!ie}#bodyContent span.rdflink a:hover{text-decoration:none;color:#0000FF;padding-right:20px;margin-right:0px;background:url(data:image/gif;base64,R0lGODlhEQASAIQeAIWjzhpTo0h1tvH0+SpeqUh1tWeMwjlqr+Hp89Ld7cLR5rPG4RpSo8PS53aYyDhpr5Wv1FiBvO/z+KS62uDo8ileqWaMwXWXx7LF4KO62pSu1FeAu9Hc7P///wtHnQtHnSH+FUNyZWF0ZWQgd2l0aCBUaGUgR0lNUAAh+QQBAAAfACwAAAAAEQASAAAFU+AnjuQneKhQriclpSvJSC/qxaNX2/hn/6pY6udRAX03k82Y6dROJKjI01H8VknfDoXNbbmkougEBC+DZDES1aHAcChKZ9nzza89HbGefvfSDh8hADs=) center right no-repeat;background:url(//www.dandwiki.com/w/extensions/SemanticMediaWiki/resources/smw/../images/rdf_flyer.18.gif?2014-11-01T18:25:00Z) center right no-repeat!ie} table.smwb-factbox{border-left:8px solid #DDDDDD;width:100% }tr.smwb-title{font-size:200%;background-color:#DDDDDD;line-height:1.5}tr.smwb-title td{padding-left:5px;border-bottom:2px solid white}tr.smwb-propvalue{width:100%;background-color:#EEEEEE}tr.smwb-propvalue th{text-align:right;vertical-align:top;font-weight:bold;font-size:120%;background-color:#DDDDDD;padding:0.2em 0.6em;border-bottom:2px solid white;border-top:2px solid white}tr.smwb-propvalue td{padding-left:0.4em;background-color:#EEEEEE;border:0px solid white;border-bottom:2px solid white;border-top:2px solid white;width:90%}tr.smwb-center{background-color:#DDDDDD}span.smwb-value{} table.smwb-ifactbox{border-right:8px solid #DDDDDD;width:100% }tr.smwb-ititle{font-size:200%;background-color:#DDDDDD;line-height:1.5}tr.smwb-ititle td{padding-left:5px;border-bottom:2px solid white}tr.smwb-ipropvalue{width:100%;background-color:#EEEEEE;text-align:right}tr.smwb-ipropvalue th{text-align:left;font-weight:bold;font-size:120%;background-color:#DDDDDD;padding:0.2em 0.6em;border-bottom:3px solid white;border-top:3px solid white}tr.smwb-ipropvalue td{background-color:#EEEEEE;border-bottom:3px solid white;border-top:3px solid white;padding-right:1em;width:90%}span.smwb-ivalue{} .smw-spinner .text{padding-left:2.1em;font-size:12px;vertical-align:middle} .smw-spinner.left.mw-small-spinner{background-position:left;vertical-align:middle;display:inline-block;padding:0px !important} .smw-spinner.center.mw-small-spinner{vertical-align:middle;display:inline-block;padding:0px !important} table.smw-ask-query .smw-ask-query-condition{width:100%}table.smw-ask-query .smw-ask-query-printout{width:100%}\n/* cache key: ddwikidb-wdd_:resourceloader:filter:minify-css:7:44e5903044e2ae1e57550e45c1009dca */"]},{});mw.loader.implement("ext.smw.tooltip.styles",function($,jQuery){},{"css":["div.smwtt{color:#000000} span.smwttpersist span.smwttcontent{color:#888888;font-style:italic;font-size:90%} span.smwttinline span.smwttcontent{display:none;speak:none} span.smwtticon{display:none} span.smwttactivepersist{cursor:help;color:#0000C8} span.smwttactiveinline{color:#BB7700;text-decoration:none} img.smwttimg{padding-right:5px;padding-left:4px} .smwttcontent{display:none} .smwtticon{padding:14px 12px 0 0;white-space:nowrap;margin-bottom:-1px} .smwtticon.info{display:inline-block;background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAYAAABWdVznAAAABmJLR0QAQACXAOIX6M4XAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH1woNCAQvupvvrgAAAgpJREFUKBUFwTtME3EAwOHf3f961+vd9Sh9HEVINUrFhAbRmCgGo9FodCFMLhomJ6MmJsbF1Z2ExMHBUQc3BmOigyERB0ElQHgECRYECrRC26OPa3t+nwQAAI7aO/K458yJeK8qOA74dY/1hbWdxZWJsVUoeAAKAImh2NDdR/duD54cdRLRdMQydB84KJaPzufyyx+6Tr+Zej/2jr1vBUHiin3j/pPnwzcvPMv0OKlb/YlAT4cupR1d0lRNNWwrmUhEB+tmSl7/vTktMiNPhy9dvviyM2FYnZEgpRp8WS3htaC/W2du64iWLAUl1RgoY84qiiJdU03TKFR9vv+tIZQGsiTojqg0WrDtwlHVR7PscCDAVaXoEV3KN+hCELUVVBFgNBOkXZd5NVPhoC6TL0J2v8FhnbiCUBtlX2WzInB1jZiuEQ4KfhVgrR7ErUO+UsMlgCwUT6FRW9YU2TdMXbIsjbglmD+EPQ9iYQFo1Go6Xq3c8hveolze2/hY3M6u2IaGHRI4JpxthyRVHAPCIQXbDFLcyi6WcuufhLs2lXMxsy0tkk51tDkdYVU6ZkosbFXxAwF290vN6amfM0uf374oTI5/lQAAYfddP5e58/BBuivel4qF4k0f/uy7u0sbubn5ifHX7srkLNCUAAAAQtFUW/LUQLI9HHGaPv6/Yj63s/pju1LYPAQA+A8p2cUweh5dZAAAAABJRU5ErkJggg==) no-repeat left bottom;background:url(//www.dandwiki.com/w/extensions/SemanticMediaWiki/resources/smw/util/../../images/info.png?2014-11-01T18:25:00Z) no-repeat left bottom!ie}.smwtticon.service{display:inline-block;background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAYAAABWdVznAAAABmJLR0QAQACXAOIX6M4XAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH1woNCAQvupvvrgAAAgpJREFUKBUFwTtME3EAwOHf3f961+vd9Sh9HEVINUrFhAbRmCgGo9FodCFMLhomJ6MmJsbF1Z2ExMHBUQc3BmOigyERB0ElQHgECRYECrRC26OPa3t+nwQAAI7aO/K458yJeK8qOA74dY/1hbWdxZWJsVUoeAAKAImh2NDdR/duD54cdRLRdMQydB84KJaPzufyyx+6Tr+Zej/2jr1vBUHiin3j/pPnwzcvPMv0OKlb/YlAT4cupR1d0lRNNWwrmUhEB+tmSl7/vTktMiNPhy9dvviyM2FYnZEgpRp8WS3htaC/W2du64iWLAUl1RgoY84qiiJdU03TKFR9vv+tIZQGsiTojqg0WrDtwlHVR7PscCDAVaXoEV3KN+hCELUVVBFgNBOkXZd5NVPhoC6TL0J2v8FhnbiCUBtlX2WzInB1jZiuEQ4KfhVgrR7ErUO+UsMlgCwUT6FRW9YU2TdMXbIsjbglmD+EPQ9iYQFo1Go6Xq3c8hveolze2/hY3M6u2IaGHRI4JpxthyRVHAPCIQXbDFLcyi6WcuufhLs2lXMxsy0tkk51tDkdYVU6ZkosbFXxAwF290vN6amfM0uf374oTI5/lQAAYfddP5e58/BBuivel4qF4k0f/uy7u0sbubn5ifHX7srkLNCUAAAAQtFUW/LUQLI9HHGaPv6/Yj63s/pju1LYPAQA+A8p2cUweh5dZAAAAABJRU5ErkJggg==) no-repeat left bottom;background:url(//www.dandwiki.com/w/extensions/SemanticMediaWiki/resources/smw/util/../../images/info.png?2014-11-01T18:25:00Z) no-repeat left bottom!ie}.smwtticon.warning{display:inline-block;background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAYAAABWdVznAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAZ1JREFUKFOVy79rE3EcxvH39+7y8/q9pF4S0xi0mEiaMxV68Yxg8PeiVyhV6iCIQhErHUScFJxcHAX/Azf/AgWXWlsUhyrYioMiqKgoiEgrJTH3cSuldvE9Pg8vkw3Nt6lfHuZ68g9fnv/k2/pPRDDWD098bD1gTO4cdS+NNowp38ZhQ2tgZgQSWo3kDgyPpU/esSuHd4fnK6o1lERtCuIp0tmGO73sHavevf8B8Y7uaDT7pwMXvSmwEkbgNHeFb1eLPH22wNJKnka7enxAG+1/wKxPpq+SuuaeOKSzuSQxq0vGjZML99vj+xJXDmoKa2DOx0znOVUcL7fNrXl8v0OtZhIEv1GFFLUJt3XW43TRJAZgGBal/lbsjN0sZeENIkuEoQUsAq/RQcZpHjEnzpUpA/DqAld/zOjVqOdJFO2RuXlPhuo5efBwUKJou0S9gvx6HO/cG+OmiGD1FdSU3tZNyNdPAFQd4cbFHvUty8jnCOhhl6JYfZBJ4JY1+1IeObc770S6ChClQCvhxaKwEAEISqE+vuf7XkCJCP/TX7cEexPi9whUAAAAAElFTkSuQmCC) no-repeat left bottom;background:url(//www.dandwiki.com/w/extensions/SemanticMediaWiki/resources/smw/util/../../images/warning.png?2014-11-01T18:25:00Z) no-repeat left bottom!ie}.smwtticon.note{display:inline-block;background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAYAAABWdVznAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAgtJREFUeNokUctqU1EUXefk5iY3D2MrSWOamyq9jYO2BovUR41O1Iykov6Bc6WDDh36A4oKnYkORZBCoA6KI1GrEKhoFWOo1qhJk6Z539c57sTB5gzOWns9NpMA3KCK0s0TsHwiBsW3qPi0OYerbmP89IaVnFvtMn/dmEginU5DITyYLSA4y40embp3MDWVVoNhgKvot1sob699/OqdvM0MY32AVTrZWZhhfnEsk85HEikOxoERnbYwBLxeGNH4jK/wdq1W1Bd7h8fySnlei4WT0ZV4ROWivQt4A+AzV0DrIV8/AtQA9Onjyt7G6spmOJHhb6IXrkbCnqOyuw+YNL0aTRPSpOnVidgE7A70Q/7x+pf315Wgph1TpAVBOcApktUBnN7/t9/AoBT6REAl8f3dBcW07R1pdSGkSvaJIBzIWpHUWkRqDrNAWENFIWJBZafWKZgjbWghDZIRgUK7Hx4PugNzXSK1wZmLVq0CO5ot8kw2Vyg70U+M/Eu7D0lWPLm78GSXKEOD7JlAu4rvTVWwmPGc/frzF63S5kIgv7SeOGCp0usHUmfAhAtW3SIdga2ffZTnl++nZk/dYlJKkDBePXtyOfb56cO4W5rUWH9YQEcEsI2U+9u48WD63KVlY0K3hpeWjgMxqr+snr9zslL5do3t/ThLnYXsUKLIY8YLj22+Y441gOKfAAMAeeDgUIIDAXwAAAAASUVORK5CYII=) no-repeat left bottom;background:url(//www.dandwiki.com/w/extensions/SemanticMediaWiki/resources/smw/util/../../images/note.png?2014-11-01T18:25:00Z) no-repeat left bottom!ie}\n/* cache key: ddwikidb-wdd_:resourceloader:filter:minify-css:7:9abc76e465e3c42fc9e9a373dda5dedc */"]},{});