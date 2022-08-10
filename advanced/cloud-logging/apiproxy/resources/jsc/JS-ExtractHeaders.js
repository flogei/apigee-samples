var requestHeaders = context.getVariable("request.headers.names"),
    result = {};

// requestHeaders is a java.util.TreeMap$KeySet; convert it to string
requestHeaders = requestHeaders + '';

// convert from "[A, B, C]" to an array of strings: ["A", "B", "C"]
requestHeaders = requestHeaders.slice(1, -1).split(', ');

// insert each header into the response
requestHeaders.forEach(function(x){
  var a = context.getVariable("request.header." + x );
  result[x] = a;
});

// set the response content:
context.setVariable('logVar.headers', JSON.stringify(result, null, 2));