// ==UserScript==
// @name         Default
// @version      0.1
// @description  try to take over the world!
// @run-at      document-start
// @author       You
// @match        *
// @grant        GM_addStyle
// @require https://code.jquery.com/jquery-3.6.0.min.js
// ==/UserScript==
(function() {
  GM_addStyle("img{display: none !important; visibility: hidden !important} *{background-image:none !important}");

  var o = XMLHttpRequest.prototype.open;
  XMLHttpRequest.prototype.open = function(){
    var res = o.apply(this, arguments);
    this.setRequestHeader('__mid', '<<MACHINEID>>');
    return res;
  }
  
  fetch('https://parser.shiva-property.dev.daturum.ru/__developer/public_viewer/start/next_step.json')
    .then(response => response.json())
    .then(data => console.log(data));
})
