var reactVersion = '0.13.0';


Package.describe({
  name: 'jorgegorka:react-compiler',
  version: reactVersion,
  summary: 'A React JSX compiler for JS and CoffeeScript.'
});



Package.registerBuildPlugin({
  name: 'compileJSX',
  use: ['coffeescript@1.0.5'],
  sources: [
    'plugin/compile-jsx.coffee'
  ],
  npmDependencies: {
    'react-tools': reactVersion,
    'coffee-react-transform': '2.4.1',
    'coffee-script': '1.9.1'
  }
});

Package.onTest(function(api){
});
