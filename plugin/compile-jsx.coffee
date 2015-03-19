fsPath          = Npm.require('path')
reactTools      = Npm.require('react-tools')
coffeeTransform = Npm.require('coffee-react-transform')
coffee          = Npm.require('coffee-script')


transformJavascript = (compileStep) ->
  source      = compileStep.read().toString('utf8')
  outputFile  = compileStep.inputPath + '.js'
  code        = reactTools.transform(source, { harmony:true })

  compileStep.addJavaScript
    path:       outputFile
    sourcePath: compileStep.inputPath
    data:       code



transformCoffee = (compileStep) ->
  source      = compileStep.read().toString('utf8')
  outputFile  = compileStep.inputPath + '.js'

  # TODO: Work out how to include source-maps.
  options = { bare:true }

  try
    code = coffee.compile(coffeeTransform(source), options)
  catch e
    throw new Error(
      compileStep.inputPath + ':' +
      (if e.location then (e.location.first_line + ': ') else ' ') +
      e.message
    )

  compileStep.addJavaScript
    path:       outputFile
    sourcePath: compileStep.inputPath
    data:       code


# ----------------------------------------------------------------------


Plugin.registerSourceHandler('jsx', transformJavascript)
Plugin.registerSourceHandler('cjsx', transformCoffee)
