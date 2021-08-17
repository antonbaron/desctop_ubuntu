// ==UserScript==
// @name         Default
// @namespace    http://tampermonkey.net/
// @version      0.1
// @run-at       document-start
// @description  try to take over the world!
// @author       You
// @match        *://*/*
// @require https://code.jquery.com/jquery-3.6.0.min.js
// @grant        GM_addStyle
// ==/UserScript==

(function() {
  var __machineID = '<<MACHINEID>>';

  GM_addStyle("svg,img{display: none !important; visibility: hidden !important} *{background-image:none !important}");

  //var o = XMLHttpRequest.prototype.open;
  //XMLHttpRequest.prototype.open = function(){
  //  var res = o.apply(this, arguments);
  //  this.setRequestHeader('__mid', '<<MACHINEID>>');
  //  return res;
  //}

  fetch('https://parser.shiva-property.dev.daturum.ru/__developer/public_viewer/start/next_step.json?__mid='+__machineID)
    .then(response => response.json())
    .then(data => console.log(data));
})();
