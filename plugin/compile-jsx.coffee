fsPath          = Npm.require('path')
reactTools      = Npm.require('react-tools')
coffeeTransform = Npm.require('coffee-react-transform')
coffee          = Npm.require('coffee-script')

transformCoffee = (compileStep) ->
  source      = compileStep.read().toString('utf8')
  outputFile  = compileStep.inputPath + '.js'

  # TODO: Work out how to include source-maps.
  options = { bare:true }
  code = coffee.compile(coffeeTransform(source), options)

  compileStep.addJavaScript
    path:       outputFile
    sourcePath: compileStep.inputPath
    data:       code


# ----------------------------------------------------------------------

Plugin.registerSourceHandler('cjsx', transformCoffee)
