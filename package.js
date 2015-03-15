var reactVersion = '0.13.0';


Package.describe({
  name: 'respondly:react-compiler',
  version: reactVersion,
  summary: 'A React JSX compiler for JS and CoffeeScript.'
});



Package.registerBuildPlugin({
  name: 'compileJSX',
  use: ['coffeescript'],
  sources: [
    'plugin/compile-jsx.coffee'
  ],
  npmDependencies: {
    'react-tools': reactVersion,
    'coffee-react-transform': '2.4.1',
    'coffee-script': '1.9.1'
  }
});

