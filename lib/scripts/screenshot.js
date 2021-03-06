var page = require('webpage').create();
var system = require('system');
console.log('in screenshot script')


page.onError = function(msg, trace) {

  var msgStack = ['ERROR: ' + msg];

  if (trace && trace.length) {
    msgStack.push('TRACE:');
    trace.forEach(function(t) {
      msgStack.push(' -> ' + t.file + ': ' + t.line + (t.function ? ' (in function "' + t.function +'")' : ''));
    });
  }

  console.error(msgStack.join('\n'));

};

page.viewportSize = {width: 1024, height: 768}
page.clipRect = {top: 0, left: 0, width: 1024, height: 768}
page.open(system.args[1], function(status) {
  page.render(system.args[2]);
  console.log('screenshot taken')
  phantom.exit();
});

page.open();

